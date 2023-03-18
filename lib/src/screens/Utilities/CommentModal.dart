// TODO Implement this library.
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jitd_client/src/blocs/comment/comment_bloc.dart';
import 'package:jitd_client/src/blocs/comment/comment_state.dart';

import '../../constant.dart';

class CommentModal extends StatefulWidget {
  final String? userId;
  final String? postId;
  final String? commentId;
  final String? content;
  final String? date;
  final String? postUserId;
  final bool? isPin;
  final String? commentIndex;
  final CommentBloc commentBloc;

  const CommentModal(
      {Key? key,
      required this.userId,
      required this.postId,
      required this.commentId,
      required this.content,
      required this.date,
      required this.postUserId,
      required this.isPin,
      required this.commentIndex,
      required this.commentBloc})
      : super(key: key);

  @override
  State<CommentModal> createState() => _CommentModalState();
}

class _CommentModalState extends State<CommentModal> {
  TextEditingController? commentController;

  @override
  void initState() {
    commentController = TextEditingController(text: widget.content);
    super.initState();
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
                  const DragBar(),
                  if (currentID == widget.postUserId) pinningComment(),
                  if (currentID == widget.userId) editingComment(context),
                  if (currentID == widget.userId) deletingComment(context),
                  reportingComment()
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

  Padding reportingComment() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      child: Row(
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
                    Icons.report,
                    size: 28,
                    color: textColor2,
                  )),
            ),
          ),
          Text(
            "รายงานคอมเมนต์",
            style: GoogleFonts.getFont("Bai Jamjuree",
                fontSize: 18, color: textColor2),
          ),
        ],
      ),
    );
  }

  Padding pinningComment() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: GestureDetector(
        onTap: () {
          if (widget.isPin == false || widget.isPin == null) {
            widget.commentBloc.add(PinComment(
                widget.commentId, widget.postId, widget.commentIndex));
          } else if (widget.isPin == true) {
            widget.commentBloc.add(UnPinComment(
                widget.commentId, widget.postId, widget.commentIndex));
          }
          widget.commentBloc.add(SortCommentByDate("เรียงตามใหม่ล่าสุด"));
          Navigator.pop(context);
        },
        child: Row(
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
                      Icons.push_pin,
                      size: 28,
                      color: textColor2,
                    )),
              ),
            ),
            if (widget.isPin == false || widget.isPin == null)
              Text(
                "ปักหมุดคอมเมนต์",
                style: GoogleFonts.getFont("Bai Jamjuree",
                    fontSize: 18, color: textColor2),
              ),
            if (widget.isPin == true)
              Text(
                "ลบออกจากคอมเมนต์ปักหมุด",
                style: GoogleFonts.getFont("Bai Jamjuree",
                    fontSize: 18, color: textColor2),
              ),
          ],
        ),
      ),
    );
  }

  Padding deletingComment(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: GestureDetector(
          onTap: () {},
          child: Row(
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
                  "ลบคอมเมนต์",
                  style: GoogleFonts.getFont("Bai Jamjuree",
                      fontSize: 18, color: textColor2),
                ),
              ),
            ],
          )),
    );
  }

  Padding editingComment(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Center(
                    child: Text(
                  "แก้ไขความคิดเห็น",
                  style: GoogleFonts.getFont("Bai Jamjuree",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: textColor2),
                )),
                content: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกข้อความ';
                    }
                    return null;
                  },
                  controller: commentController,
                  autofocus: true,
                  obscureText: false,
                  decoration: const InputDecoration(
                    label: Icon(
                      Icons.edit,
                      size: 18,
                    ),
                    hintText: 'ให้พลังงานบวกกัน',
                    hintStyle: TextStyle(
                      color: textColor3,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(color: primaryColor),
                    ),
                  ),
                  minLines: 1,
                  maxLines: 5,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: const BorderSide(color: Colors.transparent, width: 2),
                ),
                actions: [
                  TextButton(
                    child: Text(
                      "Cancel",
                      style: GoogleFonts.getFont("Bai Jamjuree", fontSize: 14),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  TextButton(
                    child: Text(
                      "Save",
                      style: GoogleFonts.getFont("Bai Jamjuree", fontSize: 14),
                    ),
                    onPressed: () {
                      widget.commentBloc.add(UpdatingMyComment(
                          commentController!.text,
                          widget.date,
                          widget.postId,
                          widget.commentId));
                      // Do something with the edited comment,
                      // like sending it to the server or updating it in the UI
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
          },
          child: Row(
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
                        Icons.edit,
                        size: 28,
                        color: textColor2,
                      )),
                ),
              ),
              Text(
                "แก้ไขคอมเมนต์",
                style: GoogleFonts.getFont("Bai Jamjuree",
                    fontSize: 18, color: textColor2),
              ),
            ],
          )),
    );
  }

  // This shows a CupertinoModalPopup which hosts a CupertinoAlertDialog.
  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => BlocProvider<CommentBloc>(
        create: (_) => CommentBloc(),
        child:
            BlocBuilder<CommentBloc, CommentState>(builder: (context, state) {
          return CupertinoAlertDialog(
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("ยืนยันการลบ", style: fontsTH16_Red),
            ),
            content: const Text('เมื่อคุณกดลบคอมเมนท์นี้จะไม่สามารถเห็นได้อีก'),
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
                  widget.commentBloc
                      .add(DeleteMyComment(widget.commentId, widget.postId));
                },
                child: const Text('ยืนยัน'),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class DragBar extends StatelessWidget {
  const DragBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
