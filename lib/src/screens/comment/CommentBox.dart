import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jitd_client/src/blocs/comment/comment_bloc.dart';
import 'package:jitd_client/src/screens/Utilities/CommentModal.dart';

import '../../constant.dart';

class CommentBox extends StatefulWidget {
  final String? userId;
  final String? commentId;
  final String? content;
  final int? like;
  final String? postId;
  final String? Date;
  final CommentBloc? commentBloc;

  const CommentBox({
    Key? key,
    required this.userId,
    required this.commentId,
    required this.content,
    required this.like,
    required this.postId,
    required this.Date,
    this.commentBloc,
  }) : super(key: key);

  @override
  State<CommentBox> createState() => _CommentBoxState();
}

class _CommentBoxState extends State<CommentBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          bottom: MediaQuery.of(context).size.height * 0.03),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: Color.fromRGBO(0, 0, 0, 0.1),
                offset: Offset(0, 4),
              )
            ]),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 5, 20, 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).devicePixelRatio * 5,
                    ),
                    child: Text(
                      widget.Date ?? DateTime.now().toString(),
                      style: GoogleFonts.getFont("Lato",
                          fontSize: 16, color: textColor3),
                    ),
                  ),
                  CommentModal(
                      userId: widget.userId,
                      postId: widget.postId,
                      commentId: widget.commentId,
                      content: widget.content,
                      date: widget.Date ?? DateTime.now().toString(),
                      commentBloc: widget.commentBloc!)
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).devicePixelRatio * 5,
                      bottom: MediaQuery.of(context).devicePixelRatio * 3,
                    ),
                    child: Text(
                      widget.userId ?? "",
                      style: GoogleFonts.getFont("Bai Jamjuree",
                          color: textColor3, fontSize: 12),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),

              // Section-Content
              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.content ?? "No Data",
                      style: GoogleFonts.getFont("Bai Jamjuree",
                          fontSize: 16, color: textColor2),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 100,
                      softWrap: false,
                    ),
                  )
                ],
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.02),

              SizedBox(height: MediaQuery.of(context).size.height * 0.02),

              // Section-Comments ----------------------------------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Section-Like
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.175,
                    child: Center(
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: '0',
                              style: GoogleFonts.getFont('Lato',
                                  fontSize: 18, color: textColor2)),
                          const TextSpan(text: ' '),
                          const WidgetSpan(
                              child: Icon(
                            Icons.favorite,
                            color: Colors.black12,
                            size: 22,
                          ))
                        ]),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
