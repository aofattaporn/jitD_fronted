// TODO Implement this library.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jitd_client/src/blocs/comment/comment_bloc.dart';
import 'package:jitd_client/src/blocs/comment/comment_state.dart';

import 'package:jitd_client/src/screens/post/UpdatePost.dart';
import '../../constant.dart';
import '../../ui/DialogMessage.dart';

class CommentModal extends StatefulWidget {
  // const PostModal({Key? key}) : super(key: key);
  final String? userId;
  final String? postId;
  final String? commentId;
  final String? content;
  final String? date;

  const CommentModal(
      {Key? key,
        required this.userId,
        required this.postId,
        required this.commentId,
        required this.content,
        required this.date})
      : super(key: key);

  @override
  State<CommentModal> createState() => _CommentModalState();
}

class _CommentModalState extends State<CommentModal> {
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
                          Navigator.pop(context);

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
                                _showAlertDialog(context);
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
      builder: (BuildContext context) => BlocProvider<CommentBloc>(
        create: (_) => CommentBloc(),
        child: BlocListener<CommentBloc, CommentState>(
          listener: (context, state) {
            if (state is LoadingComment) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return const CupertinoAlertDialog(
                      title: Text("Deleting Your Comment..."),
                      // CircularProgressIndicator(color: thirterydColor)),
                    );
                  });
            } else if (state is DeletedComment) {
              showToast("สถานะการลบสำเร็จ");
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            }
          },
          child: BlocBuilder<CommentBloc, CommentState>(builder: (context, state) {
            return CupertinoAlertDialog(
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("ยืนยันการลบ", style: fontsTH16_Red),
              ),
              content: const Text('เมื่อคุณกดลบคอมเมนท์นี้จะไม่สามารถเห็นได้อีก'),
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
                    context.read<CommentBloc>().add(DeleteMyComment(widget.commentId,widget.postId));
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
            style: GoogleFonts.getFont("Bai Jamjuree",
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18),
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
