// import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:jitd_client/src/blocs/comment/comment_bloc.dart';
import 'package:jitd_client/src/blocs/comment/comment_state.dart';
import 'package:like_button/like_button.dart';

import '../../blocs/Like/like_bloc.dart';
import '../../blocs/post/post_bloc.dart';
import '../../constant.dart';
import '../../constant/constant_fonts.dart';
import '../../data/respository/like_repository.dart';
import '../Utilities/AllSkeleton.dart';
import '../Utilities/AllToast.dart';
import '../Utilities/PostModal.dart';
import '../Utilities/SortModal.dart';
import '../Utilities/buildComment.dart';

class ViewPost extends StatefulWidget {
  final String? userId;
  final String? postId;
  final String? content;
  final String? date;
  final String? countComment;
  final String? countLike;
  final bool? isLike;
  final bool? tempIsLike;
  final int? postIndex;
  final List<String>? category;
  final PostBloc postBloc;

  const ViewPost(
      {Key? key,
      required this.userId,
      required this.postId,
      required this.content,
      required this.date,
      required this.countComment,
      required this.countLike,
      required this.isLike,
      required this.category,
      required this.postIndex,
      this.tempIsLike,
      required this.postBloc})
      : super(key: key);

  @override
  ViewPostState createState() => ViewPostState();
}

class ViewPostState extends State<ViewPost> {
  final _unFocusNode = FocusNode();
  final toast = FToast();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final CommentBloc _commentBloc = CommentBloc();
  TextEditingController? commentController;
  LikeRepository likeRepository = LikeRepository();

  @override
  void initState() {
    super.initState();
    toast.init(context);
    _commentBloc.add(GetComment(widget.postId));
    commentController = TextEditingController();
  }

  @override
  void dispose() {
    _unFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: BlocProvider<CommentBloc>(
        create: (_) => _commentBloc,
        child: BlocListener<CommentBloc, CommentState>(
          listener: (context, state) {
            if (state is DeletingComment) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return const CupertinoAlertDialog(
                      title: Text("Deleting Your Comment..."),
                      // CircularProgressIndicator(color: thirterydColor)),
                    );
                  });
            } else if (state is DeletedComment) {
              showToast("delete success");
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            } else if (state is CommentSuccess) {
              showToast("comment success");
            } else if (state is UpdatingComment) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return const CupertinoAlertDialog(
                      title: Text("Updating Your Comment..."),
                      // CircularProgressIndicator(color: thirterydColor)),
                    );
                  });
            } else if (state is UpdatedComment) {
              showToast("update success");
              Navigator.of(context).pop();
            }
          },
          child: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unFocusNode),
              child: Stack(children: [
                /// Post-Comment
                _buildBodyContent(context),

                /// BottomContainer-CommentBox
                Align(
                    alignment: Alignment.bottomCenter,
                    child: _buildTextBottom(context))
                // child: Text("dsfddsfddsfd"))
              ]),
            ),
          ),
        ),
      ),
    );
  }

  Container _buildTextBottom(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
          color: primaryColorLight,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Color.fromRGBO(170, 212, 204, 0.4),
              offset: Offset(0, 4),
            )
          ]),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(30, 10, 30, 10),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            // boxShadow: [
            //   BoxShadow(
            //     blurRadius: 10,
            //     color: Color.fromRGBO(170, 212, 204, 0.4),
            //     offset: Offset(0, 4),
            //   )
            // ]
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
            child: TextField(
              controller: commentController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "เขียนความคิดเห็น",
                  hintStyle:
                      GoogleFonts.getFont("Bai Jamjuree", color: textColor3),
                  suffixIcon: MediaQuery.of(context).viewInsets.bottom != 0 ||
                          commentController!.text.isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            FocusScope.of(context).requestFocus(_unFocusNode);
                            _commentBloc.add(CreateComment(
                                commentController?.text, widget.postId));
                            commentController!.clear();
                          },
                          icon: const Icon(Icons.send, color: secondaryColor))
                      : null),
              minLines: 1,
              maxLines: 5,
            ),
          ),
        ),
      ),
    );
  }

  SingleChildScrollView _buildBodyContent(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.35,
              decoration: const BoxDecoration(
                  color: primaryColorSubtle,
                  borderRadius: BorderRadiusDirectional.vertical(
                      bottom: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      offset: Offset(0, 4),
                    )
                  ]),
              child: Align(
                  alignment: const AlignmentDirectional(0.675, -0.875),
                  child: Image.asset('assets/images/background_post.png'))),
          Padding(
            padding: const EdgeInsetsDirectional.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  /// Section-Header
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.115,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white),
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            color: textColor3,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.035),
                  Row(children: [
                    Container(
                        height: MediaQuery.of(context).size.height * 0.0425,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: secondaryColor),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10, 0, 10, 0),
                          child: Text(
                            "โพสหมายเลข 124343232",
                            style: GoogleFonts.getFont("Bai Jamjuree",
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        )))
                  ]),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                  /// Section-PostDetail
                  postDetail(context),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),

                  /// section show-ALlComment
                  // Section-Comment
                  _commentDetail(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column _commentDetail(BuildContext context) {
    return Column(
      children: [
        // Sorter
        Row(
          children: [
            SortModal(commentBloc: _commentBloc),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 0,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsetsDirectional.only(
                  bottom: MediaQuery.of(context).size.height * 0.035),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.125,
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadiusDirectional.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 20,
                              color: Color.fromRGBO(170, 212, 204, 0.5),
                              offset: Offset(0, 2),
                            )
                          ]),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "23 Nov 2022",
                                  style: fontsEN12White,
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.more_horiz,
                                      color: textColor3,
                                      size: 24,
                                    ))
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
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    "widget.comment![index]",
                                    style: fontsTH14TextColor2,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1000,
                                    softWrap: false,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.175,
                                  child: Center(
                                    child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: "0",
                                            style: fontsTH14TextColor2),
                                        const TextSpan(text: ' '),
                                        const WidgetSpan(
                                            child: Icon(
                                          Icons.favorite,
                                          color: Colors.black12,
                                          size: 20,
                                        ))
                                      ]),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        Column(children: [
          BlocProvider(
            create: (_) => _commentBloc,
            child: BlocBuilder<CommentBloc, CommentState>(
                builder: (context, state) {
              /// LoadingComment show skeleton
              if (state is LoadingComment) {
                return const SkeletonComment();
              }

              /// comment success
              else if (state is CreatingComment) {
                if (state.comment.isEmpty) {
                  return const SkeletonComment();
                }
                return Column(children: [
                  buildComment(
                      context, state.comment, _commentBloc, widget.userId!),
                  const SkeletonComment()
                ]);
              }

              /// CheckingComment
              else if (state is UpdatingComment ||
                  state is UpdatedComment ||
                  state is DeletingComment ||
                  state is DeletedComment ||
                  state is SortedCommentByDate ||
                  state is SortedCommentByLike ||
                  state is LoadedComment ||
                  state is CommentSuccess ||
                  state is LoadedComment ||
                  state is PinCommentState) {
                return Column(
                  children: [
                    buildComment(
                        context, state.comment, _commentBloc, widget.userId!),
                    const SizedBox(height: 30),
                  ],
                );
              }

              // else
              else {
                return const SkeletonComment();
              }
            }),
          )
        ]),
      ],
    );
  }

  Container postDetail(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Color.fromRGBO(170, 212, 204, 0.8),
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
              height: MediaQuery.of(context).size.height * 0.025,
            ),

            /// Section-Content
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.content ?? "",
                    style: fontsTH16TextColor2,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1000,
                    softWrap: false,
                  ),
                )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),

            /// Section-Tag
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
                  return Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: secondaryColor),
                    child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10, 5, 10, 5),
                        child: Text(
                          widget.category![index],
                          style: fontsTH12White,
                        )),
                  );
                },
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),

            /// Section Chat/Like
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.04,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: secondaryColor),
                  child: Center(
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(text: 'Chat', style: fontsEN16White),
                        const TextSpan(text: '  '),
                        const WidgetSpan(
                            child: Icon(
                          Icons.wechat,
                          size: 20,
                          color: Colors.white,
                        ))
                      ]),
                    ),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                BlocProvider(
                  create: (context) => LikeBloc(),
                  child: BlocBuilder<LikeBloc, LikeState>(
                    builder: (context, state) {
                      return LikeButton(
                        isLiked: widget.postBloc.listPostModel
                            .posts[widget.postIndex!].isLike,
                        likeCount: widget.postBloc.listPostModel
                            .posts[widget.postIndex!].countLike,
                        likeBuilder: (bool isLiked) {
                          return Icon(
                            Icons.favorite,
                            color: isLiked ? heartColor : Colors.black12,
                            size: 30.0,
                          );
                        },
                        onTap: (unLike) async {
                          if (unLike == true) {
                            context.read<LikeBloc>().add(UnlikePost(
                                  postId: widget.postId,
                                ));
                            setState(() {
                              widget.postBloc.listPostModel
                                  .posts[widget.postIndex!].isLike = false;
                              widget.postBloc.listPostModel
                                  .posts[widget.postIndex!].countLike = widget
                                  .postBloc
                                  .listPostModel
                                  .posts[widget.postIndex!]
                                  .countLike! -
                                  1;
                            });
                          } else {
                            context.read<LikeBloc>().add(LikePost(
                                  postId: widget.postId,
                                ));
                            setState(() {
                              widget.postBloc.listPostModel
                                  .posts[widget.postIndex!].isLike = true;
                              widget.postBloc.listPostModel
                                  .posts[widget.postIndex!].countLike = widget
                                  .postBloc
                                  .listPostModel
                                  .posts[widget.postIndex!]
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
    );
  }

  /// manage showToast
  void showToast(String msg) => toast.showToast(
      child: successToast(msg, context), gravity: ToastGravity.TOP);
}
