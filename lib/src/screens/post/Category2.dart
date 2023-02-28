import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jitd_client/src/blocs/post/post_state.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../blocs/post/post_bloc.dart';
import '../../constant.dart';
import '../../constant/constant_fonts.dart';
import '../../data/models/post_model.dart';

class Category2 extends StatefulWidget {
  final String? content;
  final String? date;
  final List<String>? category;
  final PostBloc postBloc;
  final String postID;

  const Category2(
      {Key? key,
      this.content,
      this.date,
      required this.category,
      required this.postBloc,
      required this.postID})
      : super(key: key);

  @override
  Category2State createState() => Category2State();
}

class Category2State extends State<Category2> {
  TextEditingController? textController;
  final panelController = PanelController();
  List<String> category = [
    "การเรียน",
    "การงาน",
    "สุขภาพจิต",
    "ปัญหาชีวิต",
    "ความสัมพันธ์",
    "ครอบครัว",
    "สุขภาพร่างกาย"
  ];

  @override
  void initState() {
    super.initState();
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

    List<PostModel> listPost = widget.postBloc.listPostModel.posts;
    int i = getIndex(listPost, widget.postID);

    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: width * 0.08),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(50)),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: height * 0.025, horizontal: width * 0.07),
            child: BlocProvider.value(
              value: widget.postBloc,
              child: BlocListener<PostBloc, PostState>(
                listener: (context, state) {
                  if (state is EditCategorySuccess) {
                    Navigator.of(context).pop();
                  }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // header
                    header(),

                    // show category
                    Container(
                      width: width,
                      margin: EdgeInsets.symmetric(vertical: height * 0.03),
                      height: height * 0.08,
                      padding: EdgeInsets.symmetric(
                          vertical: height * 0.02, horizontal: width * 0.05),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: backgroundColor3,
                      ),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.category?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: thirterydColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20)),
                              onPressed: () {
                                // remove category
                                setState(() {
                                  widget.category?.remove(category[index]);
                                });
                                ;
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(widget.postBloc.listPostModel.posts[i]
                                      .category![index]),
                                  const Icon(Icons.close)
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    // select category
                    SizedBox(
                      height: height * 0.5,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: category.length,
                        itemBuilder: (BuildContext context, int index) {
                          final post = widget.postBloc.listPostModel.posts[i];
                          return BlocBuilder<PostBloc, PostState>(
                              builder: (context, state) {
                            // check if click
                            if (checkClick(post, category[index])) {
                              return Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Card(
                                      color: primaryColor,
                                      elevation: 0,
                                      // shadowColor: Colors.blue,
                                      child: ListTile(
                                          title: Text(category[index]),
                                          textColor: secondaryColor,
                                          trailing: const Icon(
                                            Icons.add_circle_rounded,
                                            color: secondaryColor,
                                          ))));
                            } else {
                              return Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: Card(
                                      color: Colors.white,
                                      elevation: 5,
                                      // shadowColor: Colors.blue,
                                      child: ListTile(
                                          title: Text(category[index]),
                                          trailing: const Icon(
                                              Icons.add_circle_rounded))));
                            }
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  int getIndex(List<PostModel> listPost, String postID) {
    for (int i = 0; i < listPost.length; i++) {
      if (listPost[i].postId == postID) {
        return i;
      }
    }
    return 0;
  }

  bool checkClick(PostModel list, String category) {
    for (var element in list.category!) {
      if (element == category) {
        return true;
      }
    }
    return false;
  }

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
              widget.postBloc
                  .add(UpdateCategory(widget.postID, widget.category!));
            },
            style: ElevatedButton.styleFrom(
                primary: thirterydColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
            child: Text(
              "แก้ไขโพส",
              style: fontsTH16White,
            ))
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
}
