import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jitd_client/src/blocs/post/post_bloc.dart';
import 'package:jitd_client/src/blocs/post/post_state.dart';
import 'package:jitd_client/src/screens/home/shrimmerAllPost.dart';
import 'package:jitd_client/src/screens/post/PostBox.dart';
import 'package:jitd_client/src/screens/post/ViewPost.dart';
import 'package:jitd_client/src/screens/profile/buildMyPost.dart';
import 'package:jitd_client/src/screens/profile/shimmerMyPost.dart';

import '../constant.dart';

class BookMark extends StatefulWidget {
  // final String? userId;
  // final String? postId;
  // final String? content;
  // final String? date;
  // final String? countComment;
  // final String? countLike;
  // final bool? isLike;
  // final bool? tempIsLike;
  // final List<String>? category;
  // final PostBloc postBloc;

  const BookMark(
      {Key? key,
      // required this.userId,
      // required this.postId,
      // required this.content,
      // required this.date,
      // required this.countComment,
      // required this.countLike,
      // required this.isLike,
      // this.tempIsLike,
      // required this.category,
      // required this.postBloc
      })
      : super(key: key);

  @override
  BookMarkState createState() => BookMarkState();
}

class BookMarkState extends State<BookMark> {
  final _unFocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final PostBloc _postBloc = PostBloc();

  @override
  void dispose() {
    _unFocusNode.dispose();
    super.dispose();
  }

  @override
  void initState(){
    _postBloc.add(GetMyBookMark());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unFocusNode),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.3,
                  decoration: const BoxDecoration(
                    color: backgroundColor3,
                  ),
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height*0.2,
                        decoration: const BoxDecoration(
                          color: primaryColorSubtle,
                        ),
                      ),
                      Align(
                        alignment: Alignment(1, -0.65),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.07,
                          height: MediaQuery.of(context).size.height * 0.15,
                          decoration: const BoxDecoration(
                            color: primaryColorDark,
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(10)),
                          ),
                        ),
                      ),
                      Align(
                          alignment: const AlignmentDirectional(-0.9, -0.65),
                          child: Container(
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
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
                        alignment: Alignment(-1, 0.5),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.height * 0.125,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              color: secondaryColor),
                          child: Align(
                            alignment: Alignment(-0.6, 0.2),
                            child: Text(
                              'โพสที่บันทึก',
                              style: GoogleFonts.getFont(
                                'Bai Jamjuree',
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(0.25, 0.19),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.08,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                              color: Colors.white),
                          child: const Icon(
                            Icons.bookmark,
                            size: 40,
                            color: thirterydColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                BlocProvider(
                  create: (_) => _postBloc,
                  child: BlocListener<PostBloc, PostState>(
                    listener: (context, state){
                      if(state is DeletingBookMarkState){
                        showDialog(
                            context: context,
                            builder: (context){
                              return const CupertinoAlertDialog(
                                title: Text("Remove your Bookmark")
                              );
                            });
                      }else if (state is DeletedBookMarkState){
                        Navigator.pop(context,
                            MaterialPageRoute(
                                builder: (context) => const BookMark()));
                      }
                    },
                    child: BlocBuilder<PostBloc, PostState>(
                      builder: (context, state){
                        if(state is BookMarkLoadingState){
                          return const ShimmerMyPost();
                        }else if (state is BookMarkLoadedState){
                          if(state.listPostModel.isEmpty){
                            return const Text("No BookMark");
                          }else{
                            return Column(
                              children: [
                                /// build my bookmark
                                BuildMyPost(
                                    context, state.listPostModel, _postBloc),
                              ],
                            );
                          }
                        }else{
                          return const ShimmerMyPost();
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
