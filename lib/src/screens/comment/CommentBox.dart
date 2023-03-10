import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jitd_client/src/blocs/comment/comment_bloc.dart';
import 'package:jitd_client/src/screens/Utilities/CommentModal.dart';
import 'package:like_button/like_button.dart';
import 'package:intl/intl.dart';


import '../../constant.dart';
import '../../data/respository/like_repository.dart';

class CommentBox extends StatefulWidget {
  final String? userId;
  final String? commentId;
  final String? content;
  final int? countLike;
  final String? postId;
  final String? Date;
  final bool? isLike;
  final CommentBloc? commentBloc;

  const CommentBox({
    Key? key,
    required this.userId,
    required this.commentId,
    required this.content,
    required this.countLike,
    required this.postId,
    required this.Date,
    required this.isLike,
    this.commentBloc,
  }) : super(key: key);

  @override
  State<CommentBox> createState() => _CommentBoxState();
}

class _CommentBoxState extends State<CommentBox> {
  LikeRepository likeRepository = LikeRepository();

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
                      DateFormat('dd MMM yyyy   HH:mm:ss').format(
                          DateTime.parse(widget.Date!)
                              .toUtc()
                              .add(const Duration(hours: 7))),
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
                      "?????????????????????????????? ${"${widget.userId!.substring(0, 5)}xxx"}",
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
                  LikeButton(
                    isLiked: widget.isLike,
                    likeCount: widget.countLike,
                    likeBuilder: (bool isLiked) {
                      return Icon(
                        Icons.favorite,
                        color: isLiked ? heartColor : Colors.black12,
                        size: 30.0,
                      );
                    },
                    onTap: (unLike) async {
                      if (unLike == true) {
                        likeRepository.unlikeComment(
                            commentId: widget.commentId, postId: widget.postId);
                      } else {
                        likeRepository.likeComment(
                            commentId: widget.commentId, postId: widget.postId);
                      }
                      return !unLike;
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  String convertDate(String? date) {
    DateTime dt = DateTime.parse(date!);
    String datFormat =
        '${dt.day.toString()}-${dt.month.toString()}-${dt.year.toString()}';
    return datFormat;
  }
}
