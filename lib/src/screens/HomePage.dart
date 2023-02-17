import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jitd_client/src/blocs/post/post_bloc.dart';
import 'package:jitd_client/src/constant.dart';
import 'package:jitd_client/src/screens/Utilities/PostModal.dart';
import 'package:jitd_client/src/screens/Utilities/categoryBox.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jitd_client/src/screens/post/ViewAllPost.dart';
import 'package:jitd_client/src/screens/post/ViewPost.dart';
import 'package:shimmer/shimmer.dart';
import '../blocs/post/post_state.dart';
import '../data/models/post_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PostBloc _postBloc = PostBloc();

  @override
  void initState() {
    _postBloc.add(GetAllPost());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async => _postBloc.add(GetAllPost()),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            //Background on top
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.02,
                  width: MediaQuery.of(context).size.height,
                  color: primaryColorSubtle,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.height * 1,
                  decoration:
                      const BoxDecoration(color: primaryColorSubtle, boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                      offset: Offset(0, 4),
                    )
                  ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Widget Box and Text
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              color: primaryColor,
                            ),
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Container(
                              margin: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).devicePixelRatio * 6,
                                  left: MediaQuery.of(context).devicePixelRatio *
                                      10),
                              child: const Text(
                                "JIT :D",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(
                                right:
                                    MediaQuery.of(context).devicePixelRatio * 5),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              color: secondaryColor,
                            ),
                            child: IconButton(
                              icon: Image.asset(
                                'assets/images/messenger.png',
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                      //Category btn
                      Expanded(
                        child: ListView.builder(
                            itemCount: 6,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Category();
                            }),
                      ),
                    ],
                  ),
                ),
                BlocProvider(
                    create: (_) => _postBloc,
                    child: BlocBuilder<PostBloc, PostState>(
                        builder: (context, state) {
                      if (state is PostLoadingState) {
                        return Shimmer.fromColors(
                          baseColor: skeletonColor,
                          highlightColor: skeletonHighlightColor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 30, 0, 10),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.5,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  decoration: const BoxDecoration(
                                      color: secondaryColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10))),
                                ),
                              ),
                              SingleChildScrollView(
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 20, 0, 10),
                                      child: Container(
                                        width: MediaQuery.of(context).size.width *
                                            0.7,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.215,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            color: skeletonColor),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 20, 0, 10),
                                      child: Container(
                                        width: MediaQuery.of(context).size.width *
                                            0.7,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.215,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            color: skeletonColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    height:
                                        MediaQuery.of(context).size.height * 0.03,
                                    decoration: const BoxDecoration(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(5)),
                                        color: skeletonColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      } else if (state is PostLoadedState) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 30, 0, 10),
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: secondaryColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  child: Text(
                                    "ปัญหาที่เพิ่มมาใหม่",
                                    style: GoogleFonts.getFont("Bai Jamjuree",
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            _buildPostBox(context, state.allPost),
                            GestureDetector(
                              onTap: () => Navigator.of(context)
                                  .push(_createRoute(const ViewAllPost())),
                              child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  alignment: AlignmentDirectional.centerEnd,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Text(
                                      'เพิ่มเติม >>',
                                      style: GoogleFonts.getFont("Bai Jamjuree",
                                          color: textColor2,
                                          fontWeight: FontWeight.w500,
                                          decoration: TextDecoration.underline,
                                          decorationColor: thirterydColor,
                                          decorationThickness: 4),
                                    ),
                                  )),
                            ),
                          ],
                        );
                      } else {
                        return Text(state.props.toString());
                      }
                    })),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildPostBox(BuildContext context, List<PostModel> model) {
  const itemCount = 5;
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.235,
    child: ListView.separated(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: itemCount,
      separatorBuilder: (context, index) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.04,
        );
      },
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Navigator.of(context).push(_createRoute(ViewPost(
            postId: model[index].postId ?? "123",
            userId: model[index].userId ?? "123",
            content: model[index].content ?? "ERROR",
            category: model[index].category ?? ["ERROR"],
            date: model[index].date ?? "404",
          ))),
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: backgroundColor2,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 15,
                      color: Color.fromRGBO(170, 212, 204, 0.5),
                      offset: Offset(0, 2),
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          model[index].date ?? DateTime.now().toString(),
                          style: GoogleFonts.getFont("Lato",
                              fontSize: 12, color: textColor3),
                        ),
                        PostModal(
                          userId: model[index].userId ?? "",
                          postId: model[index].postId ?? "",
                          content: model[index].content ?? "No Data",
                          date: model[index].date ?? DateTime.now().toString(),
                          category: model[index].category ?? ["Tag1", "Tag2"],
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              model[index].content ?? "Error404 Not Found",
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.035,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: model[index].category?.length ?? 0,
                        separatorBuilder: (context, index) {
                          return SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02);
                        },
                        itemBuilder: (BuildContext context, int i) {
                          return Container(
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: secondaryColor),
                            child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10, 5, 10, 5),
                                child: Text(
                                  model[index].category![i],
                                  style: GoogleFonts.getFont("Bai Jamjuree",
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}

Route _createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, -0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
