import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jitd_client/App.dart';
import 'package:jitd_client/src/blocs/authentication/authen_bloc.dart';
import 'package:jitd_client/src/blocs/authentication/authen_event.dart';
import 'package:jitd_client/src/blocs/authentication/authen_state.dart';
import 'package:jitd_client/src/blocs/post/post_bloc.dart';
import 'package:jitd_client/src/blocs/post/post_state.dart';
import 'package:jitd_client/src/constant.dart';
import 'package:jitd_client/src/screens/Setting/Setting_setting.dart';
import 'package:jitd_client/src/blocs/post/post_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../data/models/post_model.dart';
import 'post/PostBox.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jitd_client/src/screens/post/ViewPost.dart';

import 'package:rive/rive.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final PostBloc _postBloc = PostBloc();
  final AuthenticationBloc _userBloc = AuthenticationBloc();

  @override
  void initState() {
    _userBloc.add(getUserID());
    _postBloc.add(GetMyPost());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: AppBar(
          backgroundColor: primaryColorSubtle,
          elevation: 0,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              //Background Top
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50)),
                  color: primaryColorSubtle,
                ),
                height: MediaQuery.of(context).size.height * 0.5,

                // Widget in Top Background
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).devicePixelRatio * 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //id user
                          Container(
                            margin: EdgeInsets.only(
                                left: MediaQuery.of(context).devicePixelRatio *
                                    5),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.white),
                            height: MediaQuery.of(context).size.height * 0.04,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Container(
                              padding: EdgeInsets.only(
                                left:
                                    MediaQuery.of(context).devicePixelRatio * 6,
                                top:
                                    MediaQuery.of(context).devicePixelRatio * 4,
                              ),
                              child: BlocProvider(
                                create: (_) => _userBloc,
                                child: BlocBuilder<AuthenticationBloc,
                                        AuthenticationState>(
                                    builder: (context, state) {
                                  if (state is GettingUser) {
                                    return Shimmer.fromColors(
                                      baseColor: skeletonColor,
                                      highlightColor: skeletonHighlightColor,
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            right: MediaQuery.of(context)
                                                    .devicePixelRatio *
                                                5.3,
                                            bottom: MediaQuery.of(context)
                                                    .devicePixelRatio *
                                                3),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                5,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5)),
                                              color: skeletonColor),
                                        ),
                                      ),
                                    );
                                  } else if (state is GettedUser) {
                                    String identifyuser =
                                        state.userId.toString();
                                    int maxLength = 10;
                                    String conciseUser = (identifyuser.length >
                                            maxLength)
                                        ? identifyuser.substring(0, maxLength) +
                                            "..."
                                        : identifyuser;
                                    return Text("ID : " + conciseUser);
                                  } else {
                                    return Shimmer.fromColors(
                                      baseColor: skeletonColor,
                                      highlightColor: skeletonHighlightColor,
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            right: MediaQuery.of(context)
                                                    .devicePixelRatio *
                                                5.3,
                                            bottom: MediaQuery.of(context)
                                                    .devicePixelRatio *
                                                3),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                5,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5)),
                                              color: skeletonColor),
                                        ),
                                      ),
                                    );
                                  }
                                }),
                              ),
                            ),
                          ),

                          //burger bar
                          IconButton(
                            icon: Image.asset(
                              'assets/images/burger_bar.png',
                              color: secondaryColorDark,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => Setting_setting()));
                            },
                          ),
                        ],
                      ),
                    ),

                    //Box text
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).devicePixelRatio * 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                      ),
                      height: MediaQuery.of(context).size.height * 0.125,
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),

                    //bear
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.width * 0.6,
                      child: const RiveAnimation.asset(
                          "assets/images/login_screen_character.riv",
                          fit: BoxFit.cover,
                          animations: const ['idle']),
                    ),
                  ],
                ),
              ),

              //Widget Name pet and Image smile
              Container(
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            right: MediaQuery.of(context).devicePixelRatio * 30,
                            top: MediaQuery.of(context).devicePixelRatio * 10,
                          ),
                          child: Container(
                            child: Image.asset(
                              'assets/images/smile.png',
                            ),
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                        ),
                        Container(
                          child: Container(
                            margin: EdgeInsets.only(
                              left:
                                  MediaQuery.of(context).devicePixelRatio * 30,
                              top: MediaQuery.of(context).devicePixelRatio * 10,
                            ),
                            child: Image.asset(
                              'assets/images/veryhappy.png',
                            ),
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                        ),
                      ],
                    ),

                    //name
                    Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).devicePixelRatio * 15,
                          top: MediaQuery.of(context).devicePixelRatio * 30),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: backgroundColor3,
                      ),
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Container(
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).devicePixelRatio * 10),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BlocProvider(
                                create: (_) => _userBloc,
                                child: BlocBuilder<AuthenticationBloc,
                                        AuthenticationState>(
                                    builder: (context, state) {
                                  if (state is GettingUser) {
                                    return Shimmer.fromColors(
                                      baseColor: skeletonColor,
                                      highlightColor: skeletonHighlightColor,
                                      child: Container(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.0217,
                                            decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                color: skeletonColor),
                                          ),
                                        ),
                                      ),
                                    );
                                  } else if (state is GettedUser) {
                                    print(state.petName);
                                    return Text(state.petName.toString());
                                  } else {
                                    return Shimmer.fromColors(
                                      baseColor: skeletonColor,
                                      highlightColor: skeletonHighlightColor,
                                      child: Container(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.0217,
                                            decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                color: skeletonColor),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                }),
                              ),
                              BlocProvider(
                                create: (_) => _userBloc,
                                child: BlocBuilder<AuthenticationBloc,
                                    AuthenticationState>(
                                  builder: (context, state) {
                                    return IconButton(
                                      icon: Icon(
                                        Icons.create_rounded,
                                        color: Colors.black26,
                                      ),
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                                  title:
                                                      Text("Change Name Pet"),
                                                  content: TextField(
                                                    autofocus: true,
                                                    decoration: InputDecoration(
                                                        hintText: "Enter Name"),
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      child: Text("Cancel"),
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                    TextButton(
                                                      child: Text("OK"),
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                  ],
                                                ));
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //Widget will edit to button
              Container(
                child: Stack(
                  children: [
                    //4 btn
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal:
                            MediaQuery.of(context).devicePixelRatio * 10,
                        vertical: MediaQuery.of(context).devicePixelRatio * 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: secondaryColor,
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.flash_on_rounded),
                                  color: Colors.white,
                                  iconSize:
                                      MediaQuery.of(context).size.height * 0.05,
                                  onPressed: () {},
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                width: MediaQuery.of(context).size.width * 0.15,
                              ),
                              Container(
                                child: Text(
                                  "ทดสอบความเครียด",
                                  style: TextStyle(
                                      fontSize: 10, color: textColor1),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: secondaryColor,
                                ),
                                child: IconButton(
                                  icon: Image.asset(
                                    'assets/images/handshake.png',
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                width: MediaQuery.of(context).size.width * 0.15,
                              ),
                              Container(
                                child: Text(
                                  "ทดสอบที่ปรึกษา",
                                  style: TextStyle(
                                      fontSize: 10, color: textColor1),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: secondaryColor,
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.bookmark),
                                  color: Colors.white,
                                  iconSize:
                                      MediaQuery.of(context).size.height * 0.04,
                                  onPressed: () {},
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                width: MediaQuery.of(context).size.width * 0.15,
                              ),
                              Container(
                                child: Text(
                                  "โพสที่บันทึก",
                                  style: TextStyle(
                                      fontSize: 10, color: textColor1),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: secondaryColor,
                                ),
                                child: IconButton(
                                  icon: Image.asset(
                                    'assets/images/smiley.png',
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                width: MediaQuery.of(context).size.width * 0.15,
                              ),
                              Container(
                                child: Text(
                                  "เพิ่มพลังงานบวก",
                                  style: TextStyle(
                                      fontSize: 10, color: textColor1),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //post
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(30, 20, 30, 5),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.04,
                          decoration: const BoxDecoration(
                              color: thirterydColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Center(
                            child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: " เรียงตามความนิยม ",
                                    style: GoogleFonts.getFont('Bai Jamjuree',
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                                const WidgetSpan(
                                  child: Icon(
                                    Icons.arrow_drop_down,
                                    size: 18,
                                    color: backgroundColor3,
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ),
                      ),
                    ],
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
                              Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 20, 20, 20),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 1,
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: skeletonColor),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      } else if (state is PostLoadedState) {
                        if (state.allPost.length == 0) {
                          return const Text("ไม่มีโพส");
                        } else {
                          return Column(
                            children: [
                              _buildPost(context, state.allPost),
                            ],
                          );
                        }
                      } else {
                        return Shimmer.fromColors(
                          baseColor: skeletonColor,
                          highlightColor: skeletonHighlightColor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 20, 20, 20),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 1,
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: skeletonColor),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildPost(BuildContext context, List<PostModel> model) {
  return Column(
    children: [
      ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: model.length,
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
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
