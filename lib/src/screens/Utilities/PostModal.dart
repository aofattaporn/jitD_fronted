import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jitd_client/src/blocs/post/post_bloc.dart';
import 'package:jitd_client/src/blocs/post/post_state.dart';

import 'package:jitd_client/src/screens/post/UpdatePost.dart';
import '../../constant.dart';

class PostModal extends StatelessWidget {
  final String? userId;
  final String? postId;
  final String? content;
  final String? date;
  final List<String>? category;

  const PostModal(
      {Key? key,
      required this.userId,
      required this.postId,
      required this.content,
      required this.date,
      required this.category})
      : super(key: key);

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
                  if (currentID == userId)
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                  if (currentID == userId)
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                            Navigator.of(context).push(_createRoute(UpdatePost(
                              userId: userId ?? "",
                              postId: postId ?? "",
                              content: content ?? "No Data",
                              date: date ?? DateTime.now().toString(),
                              category: category ?? ["Tag1", "Tag2"],
                            )));},
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
                  if (currentID == userId)
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.035,
                    ),
                  if (currentID == userId)
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
                            Text(
                              "ลบโพสต์",
                              style: GoogleFonts.getFont("Bai Jamjuree",
                                  fontSize: 18, color: textColor2),
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
                          "ปิดการแจ้งเตือนสำหรับโพสต์นี้",
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
  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => BlocProvider<PostBloc>(
        create: (_) => PostBloc(),
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            return CupertinoAlertDialog(
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("ยืนยันหารลบ", style: fontsTH16_Red),
              ),
              content: const Text('เมื่อคุณกดลบโพสนี้จะไม่สามารถเห็นได้ได้'),
              actions: <CupertinoDialogAction>[
                CupertinoDialogAction(
                  /// This parameter indicates this action is the default,
                  /// and turns the action's text to bold text.
                  isDefaultAction: true,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('ยกเลิก'),
                ),
                CupertinoDialogAction(
                  /// This parameter indicates the action would perform
                  /// a destructive action such as deletion, and turns
                  /// the action's text color to red.
                  isDestructiveAction: true,
                  onPressed: () {
                    context.read<PostBloc>().add(DeleteMyPost(postId));
                    Navigator.pop(context);
                    Navigator.of(context, rootNavigator: true).pop(context);
                  },
                  child: const Text('ยืนยัน'),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
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
