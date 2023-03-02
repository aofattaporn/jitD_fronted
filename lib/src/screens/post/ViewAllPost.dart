 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jitd_client/src/screens/Utilities/SortPostModal.dart';
import 'package:jitd_client/src/screens/post/ViewPost.dart';

import '../../blocs/post/post_bloc.dart';
import '../../blocs/post/post_state.dart';
import '../../constant.dart';
import '../home/shrimmerAllPost.dart';
import 'PostBox.dart';

class ViewAllPost extends StatefulWidget {
  final String? categorySelected;

  const ViewAllPost({Key? key, this.categorySelected}) : super(key: key);

  @override
  ViewAllPostState createState() => ViewAllPostState();
}

class ViewAllPostState extends State<ViewAllPost> {
  late List filteredList;
  final _unFocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final PostBloc _postBloc = PostBloc();

  @override
  void initState() {
    _postBloc.add(GetAllPost());

    super.initState();
  }

  @override
  void dispose() {
    _unFocusNode.dispose();
    // _postBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unFocusNode),
          child: RefreshIndicator(
            onRefresh: () async => _postBloc.add(GetAllPost()),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // header on top of view all post
                  showHeaderAllPost(context),

                  // show all post
                  createBodyAllPost(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container showHeaderAllPost(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: const BoxDecoration(
        color: primaryColorSubtle,
      ),
      child: Stack(
        children: [
          Align(
            alignment: const AlignmentDirectional(1, -0.5),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.07,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: const BoxDecoration(
                color: primaryColorDark,
                borderRadius:
                    BorderRadius.horizontal(left: Radius.circular(10)),
              ),
            ),
          ),
          Align(
              alignment: const AlignmentDirectional(-0.85, -0.45),
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: textColor3,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              )),
          Align(
            alignment: const AlignmentDirectional(0.0, -0.35),
            child: Text(
              'โพสทั้งหมด',
              style: GoogleFonts.getFont(
                'Bai Jamjuree',
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Align(
              alignment: const AlignmentDirectional(-0.75, 0.8),
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.055,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.categorySelected ?? "ปัญหาที่เพิ่มมาใหม่",
                            style: GoogleFonts.getFont('Bai Jamjuree',
                                color: textColor2,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                        const CircleAvatar(
                          radius: 12,
                          backgroundColor: secondaryColorSubtle,
                          child: Icon(
                            Icons.keyboard_arrow_up,
                            size: 25,
                            color: backgroundColor3,
                          ),
                        )
                      ],
                    ),
                  )))),
        ],
      ),
    );
  }

  BlocProvider<PostBloc> createBodyAllPost() {
    return BlocProvider(
      create: (_) => _postBloc,
      child: BlocListener<PostBloc, PostState>(
        listener: (context, state) {
          if (state is PostDeletingState) {
            showDialog(
                context: context,
                builder: (context) {
                  return const CupertinoAlertDialog(
                    title: Text("Deleting Your Post..."),
                  );
                });
          } else if (state is PostDeletedState || state is UpdatedPost) {
            Navigator.pop(context,
                MaterialPageRoute(builder: (context) => const ViewAllPost()));
          }
        },
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostLoadingState) {
              return const shrimmerAllPost();
            } else if (state is PostLoadedState ||
                state is PostDeletedState ||
                state is SortedPostByLike ||
                state is SortedPostByDate ||
                state is UpdatedPost) {
              if (widget.categorySelected == null) {
                filteredList = state.listPostModel;
              } else {
                filteredList = state.listPostModel
                    .where((element) =>
                        element.category!.contains(widget.categorySelected))
                    .toList();
              }

              return Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SortPostModal(
                          postBloc: _postBloc),
                    ],
                  ),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      itemCount: filteredList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          child: PostBox(
                            userId: filteredList[index].userId ?? "",
                            postId: filteredList[index].postId ?? "",
                            content: filteredList[index].content ?? "No Data",
                            date: filteredList[index].date ??
                                DateTime.now().toString(),
                            category: filteredList[index].category ??
                                ["Tag1", "Tag2"],
                            countComment:
                                filteredList[index].countComment.toString(),
                            countLike: filteredList[index].countLike.toString(),
                            isLike: filteredList[index].isLike,
                            postBloc: _postBloc,
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ViewPost(
                                      userId: filteredList[index].userId ?? "",
                                      postId: filteredList[index].postId ?? "",
                                      content: filteredList[index].content ??
                                          "No Data",
                                      date: filteredList[index].date ??
                                          DateTime.now().toString(),
                                      category: filteredList[index].category ??
                                          ["Tag1", "Tag2"],
                                      countComment: filteredList[index]
                                          .countComment
                                          .toString(),
                                      countLike: filteredList[index]
                                          .countLike
                                          .toString(),
                                      isLike: filteredList[index].isLike,
                                      postBloc: _postBloc,
                                    )));
                          },
                        );
                      }),
                ],
              );
            } else {
              return Text(state.props.toString());
            }
          },
        ),
      ),
    );
  }
}
