import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:jitd_client/src/blocs/Like/like_bloc.dart';
import 'package:jitd_client/src/blocs/comment/comment_bloc.dart';
import 'package:jitd_client/src/screens/Utilities/CommentModal.dart';
import 'package:like_button/like_button.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constant.dart';

class CommentBox extends StatefulWidget {
  final String? userId;
  final String? commentId;
  final String? content;
  final int? countLike;
  final String? postId;
  final String? date;
  final bool? isLike;
  final bool? isPin;
  final String? postUserId;
  final String? commentIndex;
  final CommentBloc? commentBloc;

  const CommentBox({
    Key? key,
    required this.userId,
    required this.commentId,
    required this.content,
    required this.countLike,
    required this.postId,
    required this.date,
    required this.isLike,
    required this.isPin,
    required this.commentIndex,
    required this.postUserId,
    this.commentBloc,
  }) : super(key: key);

  @override
  State<CommentBox> createState() => _CommentBoxState();
}

class _CommentBoxState extends State<CommentBox> {
  final LikeBloc _likeBloc = LikeBloc();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          bottom: MediaQuery.of(context).size.height * 0.03),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: borderColors(),
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
                          DateTime.parse(widget.date!)
                              .toUtc()
                              .add(const Duration(hours: 7))),
                      style: GoogleFonts.getFont("Lato",
                          fontSize: 16, color: textColor3),
                    ),
                  ),
                  if (widget.isPin == true)
                    ShaderMask(
                      blendMode: BlendMode.srcATop,
                      shaderCallback: (bounds) => const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFF538AAD), Color(0xFFAAD4CC)])
                          .createShader(bounds),
                      child: const Icon(
                        Icons.push_pin,
                      ),
                    ),
                  CommentModal(
                      userId: widget.userId,
                      postId: widget.postId,
                      commentId: widget.commentId,
                      content: widget.content,
                      date: widget.date ?? DateTime.now().toString(),
                      postUserId: widget.postUserId,
                      isPin: widget.isPin,
                      commentIndex: widget.commentIndex,
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
                      "ชื่อผู้ใช้ ${"${widget.userId!.substring(0, 5)}xxx"}",
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
                  BlocProvider(
                    create: (_) => _likeBloc,
                    child: BlocBuilder<LikeBloc, LikeState>(
                      builder: (context, state) {
                        var currentComment = widget
                            .commentBloc!
                            .listCommentModel
                            .comments[int.parse(widget.commentIndex!)];
                        return LikeButton(
                          isLiked: currentComment.isLike,
                          likeCount: currentComment.countLike,
                          likeBuilder: (bool isLiked) {
                            return Icon(
                              Icons.favorite,
                              color: isLiked ? heartColor : Colors.black12,
                              size: 30.0,
                            );
                          },
                          onTap: (unLike) async {
                            if (unLike == true) {
                              context.read<LikeBloc>().add(UnlikeComment(
                                  postId: widget.postId,
                                  commentId: widget.commentId));
                              currentComment.isLike = false;
                              currentComment.countLike =
                                  (currentComment.countLike! - 1);
                            } else {
                              context.read<LikeBloc>().add(LikeComment(
                                  postId: widget.postId,
                                  commentId: widget.commentId));
                              currentComment.isLike = true;
                              currentComment.countLike =
                                  currentComment.countLike! + 1;
                            }
                            return !unLike;
                          },
                        );
                      },
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

  BoxDecoration borderColors() {
    return BoxDecoration(
        border: widget.isPin == true
            ? const GradientBoxBorder(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF538AAD), Color(0xFFAAD4CC)]),
                width: 3)
            : null,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        boxShadow: [
          widget.isPin == true
              ? const BoxShadow(
                  blurRadius: 15,
                  color: primaryColor,
                  offset: Offset(0, 4),
                )
              : const BoxShadow(
                  blurRadius: 10,
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                  offset: Offset(0, 4),
                )
        ]);
  }

  String convertDate(String? date) {
    DateTime dt = DateTime.parse(date!);
    String datFormat =
        '${dt.day.toString()}-${dt.month.toString()}-${dt.year.toString()}';
    return datFormat;
  }
}
