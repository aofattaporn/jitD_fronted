import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jitd_client/src/blocs/post/post_bloc.dart';

import '../../data/models/post_model.dart';
import '../post/PostBox.dart';
import '../post/ViewPost.dart';

Widget BuildMyPost(
    BuildContext context, ListHomePageModel model, PostBloc postBloc) {
  return Column(
    children: [
      ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: model.postDate!.length,
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: GestureDetector(
              child: PostBox(
                  userId: model.postDate![index].userId ?? "",
                  postId: model.postDate![index].postId ?? "",
                  content: model.postDate![index].content ?? "No Data",
                  date: model.postDate![index].date ?? DateTime.now().toString(),
                  category: model.postDate![index].category ?? ["Tag1", "Tag2"],
                  countComment: model.postDate![index].countComment.toString(),
                  countLike: model.postDate![index].countLike.toString(),
                  isLike: model.postDate![index].isLike,
                  isBookmark: model.postDate![index].isBookmark,
                  postBloc: postBloc, postIndex: index,),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ViewPost(
                        userId: model.postDate![index].userId ?? "",
                        postId: model.postDate![index].postId ?? "",
                        content: model.postDate![index].content ?? "No Data",
                        date: model.postDate![index].date ?? DateTime.now().toString(),
                        category: model.postDate![index].category ?? ["Tag1", "Tag2"],
                        countComment: model.postDate![index].countComment.toString(),
                        countLike: model.postDate![index].countLike.toString(),
                        isLike: model.postDate![index].isLike,
                      isBookmark: model.postDate![index].isBookmark,
                      postBloc: postBloc, postIndex: index,)));
              },
            ),
          );
        },
      ),
    ],
  );
}
