import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jitd_client/src/blocs/post/post_state.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../blocs/post/post_bloc.dart';
import '../../constant.dart';
import '../../constant/constant_fonts.dart';
import '../../data/models/post_model.dart';
import 'BlockWords.dart';
import 'Category2.dart';
import 'ConsultantLevel.dart';

class UpdatePost2 extends StatefulWidget {
  final String? content;
  final String? date;
  final List<String>? category;
  final String userID;
  final PostBloc postBloc;
  final String postID;

  const UpdatePost2(
      {Key? key,
      this.content,
      this.date,
      this.category,
      required this.postBloc,
      required this.postID,
      required this.userID})
      : super(key: key);

  @override
  UpdatePost2State createState() => UpdatePost2State();
}

class UpdatePost2State extends State<UpdatePost2> {
  TextEditingController? textController;
  final panelController = PanelController();
  final _formKey = GlobalKey<FormState>();
  late List<String> myList;

  @override
  void initState() {
    super.initState();
    myList = widget.category!.toList();
    textController = TextEditingController(text: widget.content);
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: primaryColor,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: width * 0.08),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(50)),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: height * 0.025, horizontal: width * 0.07),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // header
                    header(),

                    // show id and setting
                    showID_setting(context, widget.userID),

                    // form create
                    formCreatePost(),

                    // selection category
                    selectCategory(width, height),
                  ],
                ),
              ),
            ),
          ),
        );
  }

  // -------------- header ---------------
  Row header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.close)),
        ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                widget.postBloc.add(UpdatingMyPost(
                    textController!.text,
                    DateTime.now().toUtc().toString(),
                    true,
                    widget.postID,
                    myList));
              }
            },
            style: ElevatedButton.styleFrom(
                fixedSize: Size.fromWidth(110),
                backgroundColor: thirterydColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
            child: BlocBuilder<PostBloc, PostState>(
                bloc: widget.postBloc,
                builder: (context, state) {
                  if (state is UpdatingPost) {
                    return const CircularProgressIndicator(
                      color: Colors.white,
                    );
                  }
                  return Text(
                    "แก้ไขโพส",
                    style: fontsTH16White,
                  );
                }))
      ],
    );
  }

  // ----------------- show-id ---------------------
  Row showID_setting(BuildContext context, String userID) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // show id
        Container(
          decoration: BoxDecoration(
              color: backgroundColor3, borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: 3),
          child: Text("ชื่อผู้ใช้ ${"${userID.substring(0, 5)}xxx"}",
              style: fontsTH16_Black),
        ),

        // check public
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: secondaryColor),
            child: Row(
              children: [
                const Icon(Icons.privacy_tip, color: Colors.white),
                Text(
                  "โชว์สาธราณะ",
                  style: fontsEN14White,
                ),
              ],
            ))
      ],
    );
  }

  // ------------------ content post ------------------

  Container formCreatePost() {
    return Container(
      // color: Colors.orangeAccent,
      height: MediaQuery.of(context).size.height * 0.4,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'คุณยังไม่มีข้อความก';
                  }
                },
                autofocus: true,
                obscureText: false,
                controller: textController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "อยากบอกอะไร",
                )),
          ),
        ],
      ),
    );
  }

  // -------------- category ---------------
  BlocProvider<PostBloc> selectCategory(double width, double height) {
    List<PostDate> listPost = widget.postBloc.listHomePageModel.postDate!;
    int postIndex = getIndex(listPost, widget.postID);
    return BlocProvider.value(
      value: widget.postBloc,
      child: BlocBuilder<PostBloc, PostState>(builder: (context, state) {
        if (state is EditCategorySuccess ||
            state is SelectedCatSuccess ||
            state is UpdatingMyPost ||
            state is UpdatedPost) {
          List<PostDate> listPost = widget.postBloc.listHomePageModel.postDate!;
          int postIndex = getIndex(listPost, widget.postID);

          return categorElem(context, state, postIndex, width, height);
        }
        return categorElem(context, state, postIndex, width, height);
      }),
    );
  }

  // -------------- category element ---------------
  Column categorElem(BuildContext context, PostState state, int postIndex,
      double width, double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) => Category2(
                          postBloc: widget.postBloc,
                          postID: widget.postID,
                          category: state.listHomePageModel.postDate![postIndex].category,
                        )));
          },
          style: ElevatedButton.styleFrom(backgroundColor: secondaryColor),
          child: const Text("เลือกประเภทโพสที่เกี่ยวข้อง"),
        ),
        Container(
            width: width,
            height: height * 0.08,
            padding: EdgeInsets.symmetric(
                vertical: height * 0.02, horizontal: width * 0.05),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: backgroundColor3,
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.listHomePageModel.postDate![postIndex].category!.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: thirterydColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.symmetric(horizontal: 20)),
                    onPressed: () {},
                    child:
                        Text(state.listHomePageModel.postDate![postIndex].category![index]),
                  ),
                );
              },
            ))
      ],
    );
  }

  // ------------------ function ------------------
  int getIndex(List<PostDate> listPost, String postID) {
    for (int i = 0; i < listPost.length; i++) {
      if (listPost[i].postId == postID) {
        return i;
      }
    }
    return 0;
  }

  //---------- option panel ----------------
  Container buildOpenPanel(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(30, 40, 20, 40),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            color: Color.fromRGBO(0, 0, 0, 0.1),
                            offset: Offset(0, 4),
                          )
                        ],
                        borderRadius:
                            BorderRadiusDirectional.all(Radius.circular(10))),
                    child: const Padding(
                        padding: EdgeInsetsDirectional.all(8),
                        child: Icon(
                          Icons.lock,
                          size: 28,
                          color: textColor2,
                        )),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context)
                      .push(_createRoute(const BlockWords())),
                  child: Text(
                    "แก้ไขคำที่ต้องการบล็อค",
                    style: GoogleFonts.getFont("Bai Jamjuree", fontSize: 18),
                  ),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 20, 0),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            color: Color.fromRGBO(0, 0, 0, 0.1),
                            offset: Offset(0, 4),
                          )
                        ],
                        borderRadius:
                            BorderRadiusDirectional.all(Radius.circular(10))),
                    child: const Padding(
                        padding: EdgeInsetsDirectional.all(8),
                        child: Icon(
                          Icons.person_add,
                          size: 28,
                          color: textColor2,
                        )),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context)
                      .push(_createRoute(const ConsultantLevel())),
                  child: Text(
                    "แก้ไขระดับผู้ให้คำปรึกษาที่เห็นโพส",
                    style: GoogleFonts.getFont("Bai Jamjuree", fontSize: 18),
                  ),
                )
              ],
            )
          ],
        ));
  }

  Route _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
