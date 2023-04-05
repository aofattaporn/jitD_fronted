import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:jitd_client/src/blocs/post/post_bloc.dart';
import 'package:like_button/like_button.dart';

import '../../blocs/Like/like_bloc.dart';
import '../../constant.dart';
import '../Utilities/PostModal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBox extends StatefulWidget {
  final String? userId;
  final String? postId;
  final String? content;
  final String? date;
  final String? countComment;
  final String? countLike;
  final bool? isLike;
  final int? postIndex;
  final List<String>? category;
  final PostBloc postBloc;

  const PostBox(
      {Key? key,
      required this.userId,
      required this.postId,
      required this.content,
      required this.date,
      required this.countComment,
      required this.countLike,
      required this.isLike,
      required this.postIndex,
      required this.category,
      required this.postBloc})
      : super(key: key);

  @override
  PostBoxState createState() => PostBoxState();
}

class PostBoxState extends State<PostBox> {
  @override
  Widget build(BuildContext context) {
    final LikeBloc _likeBloc = LikeBloc();
    bool tempIsLike = widget.isLike!;

    return Padding(
      padding: EdgeInsetsDirectional.only(
          bottom: MediaQuery.of(context).size.height * 0.03),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.31,
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
                  Text(
                    DateFormat('dd MMM yyyy   HH:mm:ss').format(
                        DateTime.parse(widget.date!)
                            .toUtc()
                            .add(const Duration(hours: 7))),
                    style: GoogleFonts.getFont("Lato",
                        fontSize: 16, color: textColor3),
                  ),
                  PostModal(
                    userId: widget.userId ?? "",
                    postId: widget.postId ?? "",
                    content: widget.content ?? "No Data",
                    date: widget.date ?? DateTime.now().toString(),
                    category: widget.category ?? ["Tag1", "Tag2"],
                    postBloc: widget.postBloc,
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "ชื่อผู้ใช้ ${"${widget.userId!.substring(0, 5)}xxx"}",
                    style: GoogleFonts.getFont("Bai Jamjuree",
                        color: textColor3, fontSize: 12),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),

              // Section-Content
              Container(
                alignment: Alignment.topLeft,
                height: MediaQuery.of(context).size.height * 0.08,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.content ?? "No Data",
                        style: GoogleFonts.getFont("Bai Jamjuree",
                            fontSize: 16, color: textColor2),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        softWrap: false,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),

              // Section-Tag ---------------------------------------------------
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.035,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.category!.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        // For click in category on postbox that will redirect to allPostByCategory
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => ViewAllPost(
                        //       categorySelected: category![index],
                        //     )));
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: secondaryColor),
                        child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10, 5, 10, 5),
                            child: Text(
                              widget.category![index],
                              style: GoogleFonts.getFont("Bai Jamjuree",
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),

              // Section-Comments ----------------------------------------------
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.03,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: primaryColor),
                    child: Center(
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: widget.countComment,
                              style: GoogleFonts.getFont('Lato',
                                  fontSize: 16, color: Colors.white)),
                          const TextSpan(text: '  '),
                          const WidgetSpan(
                              child: Icon(
                            Icons.chat,
                            size: 16,
                            color: Colors.white,
                          ))
                        ]),
                      ),
                    ),
                  ),

                  // Section-Like
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                  BlocProvider(
                    create: (_) => _likeBloc,
                    child: BlocBuilder<LikeBloc, LikeState>(
                      builder: (context, state) {
                        return LikeButton(
                          isLiked: widget.postBloc.listHomePageModel
                              .postDate![widget.postIndex!].isLike,
                          likeCount: widget.postBloc.listHomePageModel
                              .postDate![widget.postIndex!].countLike,
                          likeBuilder: (bool isLiked) {
                            return Icon(
                              Icons.favorite,
                              color: isLiked ? heartColor : Colors.black12,
                              size: 30.0,
                            );
                          },
                          onTap: (unLike) async {
                            tempIsLike = !tempIsLike;
                            if (unLike == true) {
                              context.read<LikeBloc>().add(UnlikePost(
                                    postId: widget.postId,
                                  ));
                              setState(() {
                                widget.postBloc.listHomePageModel
                                    .postDate![widget.postIndex!].isLike = false;
                                widget.postBloc.listHomePageModel
                                    .postDate![widget.postIndex!].countLike = widget
                                    .postBloc
                                    .listHomePageModel
                                    .postDate![widget.postIndex!]
                                    .countLike! -
                                    1;
                              });
                            } else {
                              context.read<LikeBloc>().add(LikePost(
                                    postId: widget.postId,
                                  ));
                              setState(() {
                                widget.postBloc.listHomePageModel
                                    .postDate![widget.postIndex!].isLike = true;
                                widget.postBloc.listHomePageModel
                                    .postDate![widget.postIndex!].countLike = widget
                                    .postBloc
                                    .listHomePageModel
                                    .postDate![widget.postIndex!]
                                    .countLike! +
                                    1;
                              });
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
}
