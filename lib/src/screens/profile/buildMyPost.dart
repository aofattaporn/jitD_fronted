import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/models/post_model.dart';
import '../post/PostBox.dart';
import '../post/ViewPost.dart';

Widget BuildMyPost(BuildContext context, List<PostModel> model) {
  return Column(
    children: [
      ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: model.length,
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: GestureDetector(
              child: PostBox(
                userId: model[index].userId ?? "",
                postId: model[index].postId ?? "",
                content: model[index].content ?? "No Data",
                date: model[index].date ?? DateTime.now().toString(),
                category: model[index].category ?? ["Tag1", "Tag2"],
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ViewPost(
                          userId: model[index].userId ?? "",
                          postId: model[index].postId ?? "",
                          content: model[index].content ?? "No Data",
                          date: model[index].date ?? DateTime.now().toString(),
                          category: model[index].category ?? ["Tag1", "Tag2"],
                        )));
              },
            ),
          );
        },
      ),
    ],
  );
}
