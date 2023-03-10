import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jitd_client/src/blocs/post/post_bloc.dart';
import 'package:jitd_client/src/blocs/post/post_state.dart';
import 'package:jitd_client/src/constant/constant_fonts.dart';

import '../../constant.dart';
import '../post/UpdatePost2.dart';

class PostModal extends StatefulWidget {
  // const PostModal({Key? key}) : super(key: key);
  final String? userId;
  final String? postId;
  final String? content;
  final String? date;
  final List<String>? category;
  final PostBloc postBloc;

  const PostModal(
      {Key? key,
      required this.userId,
      required this.postId,
      required this.content,
      required this.date,
      required this.category,
      required this.postBloc})
      : super(key: key);

  @override
  State<PostModal> createState() => _PostModalState();
}

class _PostModalState extends State<PostModal> {
  final toast = FToast();

  @override
  void initState() {
    super.initState();
    toast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final currentID = user?.uid;

    return IconButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: () {
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            context: context,
            builder: (BuildContext context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.01,
                        decoration: BoxDecoration(
                            color: textColor3,
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ],
                  ),
                  if (currentID == widget.userId)
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                  if (currentID == widget.userId)
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(_createRoute(UpdatePost2(
                            content: widget.content ?? "No Data",
                            date: widget.date ?? DateTime.now().toString(),
                            category: widget.category ?? ["Tag1", "Tag2"],
                            postBloc: widget.postBloc,
                            postID: widget.postId ?? "",
                            userID: widget.userId?? "",
                          )));
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  30, 0, 20, 0),
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
                                    borderRadius: BorderRadiusDirectional.all(
                                        Radius.circular(10))),
                                child: const Padding(
                                    padding: EdgeInsetsDirectional.all(8),
                                    child: Icon(
                                      Icons.edit,
                                      size: 28,
                                      color: textColor2,
                                    )),
                              ),
                            ),
                            Text(
                              "แก้ไขโพสต์",
                              style: GoogleFonts.getFont("Bai Jamjuree",
                                  fontSize: 18, color: textColor2),
                            ),
                          ],
                        )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.035,
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.postBloc.add(AddBookMark(widget.postId??""));
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              30, 0, 20, 0),
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
                                borderRadius: BorderRadiusDirectional.all(
                                    Radius.circular(10))),
                            child: const Padding(
                                padding: EdgeInsetsDirectional.all(8),
                                child: Icon(
                                  Icons.save_rounded,
                                  size: 28,
                                  color: textColor2,
                                )),
                          ),
                        ),
                        Text(
                          "บันทึกโพสต์",
                          style: GoogleFonts.getFont("Bai Jamjuree",
                              fontSize: 18, color: textColor2),
                        ),
                      ],
                    ),
                  ),
                  if (currentID == widget.userId)
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.035,
                    ),
                  if (currentID == widget.userId)
                    GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  30, 0, 20, 0),
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
                                    borderRadius: BorderRadiusDirectional.all(
                                        Radius.circular(10))),
                                child: const Padding(
                                    padding: EdgeInsetsDirectional.all(8),
                                    child: Icon(
                                      Icons.delete,
                                      size: 28,
                                      color: textColor2,
                                    )),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                _showAlertDialog(context, widget.postBloc!);
                              },
                              child: Text(
                                "ลบโพสต์",
                                style: GoogleFonts.getFont("Bai Jamjuree",
                                    fontSize: 18, color: textColor2),
                              ),
                            ),
                          ],
                        )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.035,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              30, 0, 20, 0),
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
                                borderRadius: BorderRadiusDirectional.all(
                                    Radius.circular(10))),
                            child: const Padding(
                                padding: EdgeInsetsDirectional.all(8),
                                child: Icon(
                                  Icons.notifications_off,
                                  size: 28,
                                  color: textColor2,
                                )),
                          ),
                        ),
                        Text(
                          "ปิดดการแจ้งเตือนสำหรับโพสต์นี้",
                          style: GoogleFonts.getFont("Bai Jamjuree",
                              fontSize: 18, color: textColor2),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.085),
                ],
              );
            },
          );
        },
        icon: const Icon(
          Icons.more_horiz,
          color: textColor3,
          size: 30,
        ));
  }

  // This shows a CupertinoModalPopup which hosts a CupertinoAlertDialog.
  void _showAlertDialog(BuildContext context, PostBloc postBloc) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => BlocProvider<PostBloc>(
        create: (_) => PostBloc(),
        child: BlocListener<PostBloc, PostState>(
          listener: (context, state) {
            if (state is PostLoadingState) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return const CupertinoAlertDialog(
                      title: Text("Deleting Your Post..."),
                      // CircularProgressIndicator(color: thirterydColor)),
                    );
                  });
            } else if (state is PostDeletedState) {
              showToast("สถานะการลบสำเร็จ");
              Navigator.of(context).pop();
            }
          },
          child: BlocBuilder<PostBloc, PostState>(builder: (context, state) {
            return CupertinoAlertDialog(
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("ยืนยันการลบ", style: fontsTH16_Red),
              ),
              content: const Text('เมื่อคุณกดลบโพสนี้จะไม่สามารถเห็นได้อีก'),
              actions: <CupertinoDialogAction>[
                CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('ยกเลิก'),
                ),
                CupertinoDialogAction(
                  isDestructiveAction: true,
                  onPressed: () {
                    postBloc.add(DeleteMyPost(widget.postId));
                  },
                  child: const Text('ยืนยัน'),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  void showToast(String msg) => toast.showToast(
        child: successToast(msg),
        gravity: ToastGravity.TOP,
      );

  Widget successToast(String msg) => Container(
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
        color: statusColorSuccess,
        child: IntrinsicHeight(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.check_circle,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.05),
              Text(
                msg,
                style: fontsTH20White,
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.015),
              const VerticalDivider(
                thickness: 1,
                width: 20,
                color: Colors.black,
              ),
              const CircleAvatar(
                  backgroundColor: Color.fromRGBO(102, 204, 144, 1),
                  child: Icon(
                    Icons.cancel_rounded,
                    color: Colors.white,
                    size: 30,
                  ))
            ],
          ),
        ),
      );
}

Route _createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
