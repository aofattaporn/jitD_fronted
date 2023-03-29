import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jitd_client/src/constant/constant_fonts.dart';

import '../../blocs/comment/comment_bloc.dart';
import '../../data/models/comment_model.dart';
import '../comment/CommentBox.dart';

Widget buildComment(
    BuildContext context, List<CommentModel> model, CommentBloc commentBloc, String postUserId) {
  if (model.isEmpty) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          // color: Colors.blue,
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.235,
          child: Center(
            child:
                Text("No comment in this post", style: fontsEN20ThirteryBold),
          ),
        ),
        const SizedBox(
          height: 100,
        )
      ],
    );
  }
  return Column(
    children: [
      ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: model.length,
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).devicePixelRatio * 25,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: GestureDetector(
                child: CommentBox(
                  userId: model[index].userId ?? "",
                  commentId: model[index].commentId ?? "",
                  content: model[index].content ?? "No Data",
                  countLike: model[index].countLike,
                  postId: model[index].postId ?? "",
                  date: model[index].Date ?? DateTime.now().toString(),
                  isLike: model[index].isLike,
                  isPin: model[index].isPin,
                  commentIndex: index.toString(),
                  postUserId: postUserId,
                  commentBloc: commentBloc,
                ),
              ),
            );
          }),
      // SkeletonComment()
    ],
  );
}
