import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../blocs/post/post_bloc.dart';
import '../../blocs/post/post_state.dart';
import '../../constant.dart';
import '../Utilities/AllToast.dart';
import 'BlockWords.dart';
import 'ConsultantLevel.dart';

class UpdatePost extends StatefulWidget {
  final String? userId;
  final String? postId;
  final String? content;
  final String? date;
  final List<String>? category;
  final PostBloc postBloc;

  const UpdatePost(
      {Key? key,
      required this.userId,
      required this.postId,
      required this.content,
      required this.date,
      required this.category,
      required this.postBloc})
      : super(key: key);

  @override
  State<UpdatePost> createState() => _UpdatePostState();
}

class _UpdatePostState extends State<UpdatePost> {
  TextEditingController? textController;
  static GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  final _unFocusNode = FocusNode();
  final panelController = PanelController();
  final toast = FToast();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: widget.content);
    toast.init(context);
  }

  @override
  void dispose() {
    _unFocusNode.dispose();
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      // resizeToAvoidBottomInset: false,

      // This is a Panel
      body: SlidingUpPanel(
        // defaultPanelState: PanelState.OPEN,
        controller: panelController,
        color: Colors.transparent,
        maxHeight: MediaQuery.of(context).size.height * 0.325,
        minHeight: MediaQuery.of(context).size.height * 0.1,

        // For Open Panel
        panel: buildOpenPanel(context),
        // For collapsed panel
        collapsed: buildCollapsedPanel(context),

        // This is a Main App
        body: BlocProvider(
          create: (context) => widget.postBloc,
          child: SafeArea(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(_unFocusNode);
                panelController.close();
              },
              child: Stack(
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0, 1),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.85,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(50),
                        ),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Stack(
                          children: [
                            headerUpdatePost(context),
                            showIDupdate(context),
                            formUpdate(context),
                            selectCategory(context),
                            selectCategory2(context),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Align selectCategory2(BuildContext context) {
    return Align(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Align(
              alignment: const AlignmentDirectional(0, 0.325),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.04,
                decoration: const BoxDecoration(
                  color: Color(0xFFF8FAFA),
                ),
                child: Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width * 0.025),
                    Text(
                      "กรุณาระบุประเภทของโพส",
                      style: GoogleFonts.getFont("Bai Jamjuree",
                          color: textColor3),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Align selectCategory(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0, 0.175),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.45,
            height: MediaQuery.of(context).size.height * 0.04,
            decoration: BoxDecoration(
              color: const Color(0xFFAAD4CC),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 20,
                  color: Color(0x80AAD4CC),
                  offset: Offset(0, 2),
                )
              ],
              borderRadius: BorderRadius.circular(10),
              shape: BoxShape.rectangle,
            ),
            child: Center(
              child: Text(
                'เลือกประเภทที่เกี่ยวข้อง+',
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont(
                  'Lato',
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Align formUpdate(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0, -0.45),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.28,
        child: Scrollbar(
          child: Form(
            key: keyForm,
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'กรุณากรอกข้อความ';
                }
                return null;
              },
              autofocus: true,
              // onTap: () => panelController.close(),
              controller: textController,
              obscureText: false,
              decoration: InputDecoration(
                hintText: 'มีอะไรอยากจะบอกบ้าง',
                hintStyle: const TextStyle(color: textColor3),
                enabledBorder: buildUnderlineInputBorder(),
                focusedBorder: buildUnderlineInputBorder(),
                errorBorder: buildUnderlineInputBorder(),
                focusedErrorBorder: buildUnderlineInputBorder(),
              ),
              maxLines: null,
            ),
          ),
        ),
      ),
    );
  }

  Align showIDupdate(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0, -0.75),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.35,
            height: MediaQuery.of(context).size.height * 0.04,
            decoration: const BoxDecoration(
              color: backgroundColor3,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: const Center(
              child: Text(
                'user id : 1242413',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color(0xFF666666),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.325,
            height: MediaQuery.of(context).size.height * 0.04,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: RichText(
                text: TextSpan(children: [
                  const WidgetSpan(
                      child: Icon(
                    Icons.public,
                    size: 16,
                    color: Colors.white,
                  )),
                  TextSpan(
                      text: '  สาธารณะ',
                      style: GoogleFonts.getFont('Bai Jamjuree',
                          fontSize: 14, color: Colors.white)),
                  const TextSpan(text: '  '),
                  const WidgetSpan(
                      child: Icon(
                    Icons.arrow_drop_down,
                    size: 18,
                    color: Colors.white,
                  ))
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }

  Align headerUpdatePost(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(1, -0.95),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.cancel_rounded,
                size: 40,
                color: textColor2,
              )),
          BlocBuilder<PostBloc, PostState>(builder: (context, state) {
            if (state is CheckingPost) {
              return ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 16),
                      padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                      backgroundColor: thirterydColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      )),
                  child:
                      const CircularProgressIndicator(color: Colors.white70));
            } else {
              return ElevatedButton(
                onPressed: () {
                  widget.postBloc.add(UpdatingMyPost(textController!.text,
                      widget.date!, true, widget.postId!, widget.category!));
                  // if (keyForm.currentState!.validate()) {
                  //   // keyForm.currentState!.save();
                  //   widget.postBloc.add(UpdatingMyPost(
                  //       textController!.text,
                  //       widget.date!,
                  //       true,
                  //       widget.postId!
                  //       )
                  //       );
                  // }
                },
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 16),
                    padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                    backgroundColor: thirterydColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    )),
                child: Text(
                  "บันทึก",
                  style: GoogleFonts.getFont("Bai Jamjuree",
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
              );
            }
          }),
        ],
      ),
    );
  }

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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            buildDragHandle(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
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

  GestureDetector buildCollapsedPanel(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(_unFocusNode);
        panelController.open();
      },
      // onTap: panelController.open,
      child: Container(
        color: backgroundColor2,
        child: Center(
          child: RichText(
            text: TextSpan(children: [
              const WidgetSpan(
                  child: Icon(
                Icons.settings,
                size: 20,
                color: textColor3,
              )),
              TextSpan(
                  text: "ตั้งค่าโพสเพิ่มเติม",
                  style: GoogleFonts.getFont("Bai Jamjuree",
                      fontSize: 18, color: textColor3))
            ]),
          ),
        ),
      ),
    );
  }

  UnderlineInputBorder buildUnderlineInputBorder() {
    return const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
        width: 1,
      ),
    );
  }

  Widget buildDragHandle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * 0.01,
          decoration: BoxDecoration(
              color: textColor3, borderRadius: BorderRadius.circular(15)),
        ),
      ],
    );
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

  void showToast(String msg) => toast.showToast(
        child: successToast(msg, context),
        gravity: ToastGravity.TOP,
      );
}
