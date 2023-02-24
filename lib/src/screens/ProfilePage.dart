import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jitd_client/src/blocs/authentication/authen_bloc.dart';
import 'package:jitd_client/src/blocs/authentication/authen_event.dart';
import 'package:jitd_client/src/blocs/authentication/authen_state.dart';
import 'package:jitd_client/src/blocs/post/post_bloc.dart';
import 'package:jitd_client/src/blocs/post/post_state.dart';
import 'package:jitd_client/src/blocs/pet/petBloc.dart';
import 'package:jitd_client/src/constant.dart';
import 'package:jitd_client/src/screens/Setting/Setting_setting.dart';
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
  TextEditingController? textController;
  StateMachineController? controller;
  SMIInput<bool>? trigSuccess;
  bool showingMsg = false;

  final happyWord = ['อาหารมื้อที่ดีที่สุด คือมื้อที่คุณป้อนครับ', 'หวังว่าวันนี้จะเป็นวันที่ดีสำหรับเธอนะ', 'ขอบคุณสำหรับพลังงานแสนอบอุ่นนะ'];
  final PostBloc _postBloc = PostBloc();
  final postsBlocProvider =
      BlocProvider<PostBloc>(create: (context) => PostBloc());
  final AuthenticationBloc _userBloc = AuthenticationBloc();
  final authBlocProvider = BlocProvider<AuthenticationBloc>(
      create: (context) => AuthenticationBloc());
  final petBlocProvider = BlocProvider<petBloc>(create: (context) => petBloc());

  @override
  void initState() {
    _userBloc.add(getUserID());
    _postBloc.add(GetMyPost());
    super.initState();
    textController = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: AppBar(
          backgroundColor: primaryColorSubtle,
          elevation: 0,
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            _userBloc.add(getUserID());
            _postBloc.add(GetMyPost());
          },
          child: MultiBlocProvider(
            providers: [postsBlocProvider, authBlocProvider, petBlocProvider],
            child: BlocBuilder<petBloc, petState>(
              builder: (petContext, petsState) {
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      //Background Top
                      Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.575,
                            color: primaryColorLight,
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: BlocProvider(
                                create: (_) => _userBloc,
                                child: BlocBuilder<AuthenticationBloc,
                                    AuthenticationState>(
                                  builder: (context, state) {
                                    if (state is GettedUser) {
                                      return Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.045,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        alignment: Alignment.center,
                                        child: Stack(
                                          children: [
                                            Align(
                                                alignment:
                                                    AlignmentDirectional.center,
                                                child: Text(
                                                    state.petName.toString())),
                                            Align(
                                                alignment: AlignmentDirectional
                                                    .centerEnd,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 10.0),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      showDialog(
                                                          context: context,
                                                          builder:
                                                              (context) =>
                                                                  Dialog(
                                                                    insetPadding:
                                                                        const EdgeInsets.all(
                                                                            20),
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    child:
                                                                        Stack(
                                                                      clipBehavior:
                                                                          Clip.none,
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      children: [
                                                                        Container(
                                                                          width: MediaQuery.of(context)
                                                                              .size
                                                                              .width,
                                                                          height:
                                                                              MediaQuery.of(context).size.height * 0.195,
                                                                          decoration: const BoxDecoration(
                                                                              color: primaryColor,
                                                                              borderRadius: BorderRadius.all(Radius.circular(30))),
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              Text(
                                                                                "\nแก้ไขชื่อสัตว์เลี้ยงของคุณ",
                                                                                style: GoogleFonts.getFont("Bai Jamjuree", fontSize: 18, fontWeight: FontWeight.bold, color: textColor2),
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsets.fromLTRB(30, 17, 30, 5),
                                                                                child: Container(
                                                                                  height: MediaQuery.of(context).size.height * 0.04,
                                                                                  width: MediaQuery.of(context).size.width,
                                                                                  decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
                                                                                  child: TextField(
                                                                                    autofocus: true,
                                                                                    controller: textController,
                                                                                    maxLines: 1,
                                                                                    textAlign: TextAlign.center,
                                                                                    decoration: const InputDecoration(
                                                                                      border: OutlineInputBorder(
                                                                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                                                                        borderSide: BorderSide.none,
                                                                                      ),
                                                                                      filled: true,
                                                                                      fillColor: Colors.white,
                                                                                    ),
                                                                                    style: const TextStyle(fontSize: 14),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              TextButton(
                                                                                onPressed: () {
                                                                                  petContext.read<petBloc>().add(NamingPetEvent(textController?.text));
                                                                                  _userBloc.add(getUserID());
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: Container(
                                                                                  width: MediaQuery.of(context).size.width * 0.2,
                                                                                  height: MediaQuery.of(context).size.height * 0.035,
                                                                                  decoration: BoxDecoration(color: thirterydColor, borderRadius: BorderRadius.circular(10)),
                                                                                  alignment: AlignmentDirectional.center,
                                                                                  child: Text(
                                                                                    "ยืนยัน",
                                                                                    style: fontsTH14_white,
                                                                                  ),
                                                                                ),
                                                                              )
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Positioned(
                                                                            top:
                                                                                -20,
                                                                            right:
                                                                                10,
                                                                            child:
                                                                                RawMaterialButton(
                                                                              onPressed: () => Navigator.pop(context),
                                                                              fillColor: statusColorErrorLight,
                                                                              padding: const EdgeInsets.all(11),
                                                                              shape: const CircleBorder(),
                                                                              child: Text(
                                                                                "X",
                                                                                style: GoogleFonts.getFont("Lato", color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                                                                              ),
                                                                            ))
                                                                      ],
                                                                    ),
                                                                  ));
                                                    },
                                                    child: Container(
                                                        decoration: BoxDecoration(
                                                            color:
                                                                primaryColorSubtle,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  7.0),
                                                          child: Icon(
                                                            Icons.edit,
                                                            size: 16,
                                                          ),
                                                        )),
                                                  ),
                                                )),
                                          ],
                                        ),
                                      );
                                    } else {
                                      return Shimmer.fromColors(
                                        baseColor: skeletonColor,
                                        highlightColor: skeletonHighlightColor,
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.7,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.045,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(50),
                                  bottomLeft: Radius.circular(50)),
                              color: primaryColorSubtle,
                            ),
                            height: MediaQuery.of(context).size.height * 0.5,

                            // Widget in Top Background
                            child: Stack(
                              children: [
                                Column(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .devicePixelRatio *
                                              4),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          //id user
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: MediaQuery.of(context)
                                                        .devicePixelRatio *
                                                    5),
                                            decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                color: Colors.white),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.04,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                left: MediaQuery.of(context)
                                                        .devicePixelRatio *
                                                    6,
                                                top: MediaQuery.of(context)
                                                        .devicePixelRatio *
                                                    4,
                                              ),
                                              child: BlocProvider(
                                                create: (_) => _userBloc,
                                                child: BlocBuilder<
                                                        AuthenticationBloc,
                                                        AuthenticationState>(
                                                    builder: (context, state) {
                                                  if (state is GettingUser) {
                                                    return Shimmer.fromColors(
                                                      baseColor: skeletonColor,
                                                      highlightColor:
                                                          skeletonHighlightColor,
                                                      child: Container(
                                                        padding: EdgeInsets.only(
                                                            right: MediaQuery.of(
                                                                        context)
                                                                    .devicePixelRatio *
                                                                5.3,
                                                            bottom: MediaQuery.of(
                                                                        context)
                                                                    .devicePixelRatio *
                                                                3),
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            5,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.5,
                                                        child: Container(
                                                          decoration: const BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(Radius
                                                                          .circular(
                                                                              5)),
                                                              color:
                                                                  skeletonColor),
                                                        ),
                                                      ),
                                                    );
                                                  } else if (state
                                                      is GettedUser) {
                                                    String identifyuser =
                                                        state.userId.toString();
                                                    int maxLength = 10;
                                                    String conciseUser =
                                                        (identifyuser.length >
                                                                maxLength)
                                                            ? "${identifyuser.substring(0, maxLength)}..."
                                                            : identifyuser;
                                                    return Text(
                                                        "ID : $conciseUser");
                                                  } else {
                                                    return Shimmer.fromColors(
                                                      baseColor: skeletonColor,
                                                      highlightColor:
                                                          skeletonHighlightColor,
                                                      child: Container(
                                                        padding: EdgeInsets.only(
                                                            right: MediaQuery.of(
                                                                        context)
                                                                    .devicePixelRatio *
                                                                5.3,
                                                            bottom: MediaQuery.of(
                                                                        context)
                                                                    .devicePixelRatio *
                                                                3),
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            5,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.5,
                                                        child: Container(
                                                          decoration: const BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(Radius
                                                                          .circular(
                                                                              5)),
                                                              color:
                                                                  skeletonColor),
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
                                                      builder: (context) =>
                                                          const Setting_setting()));
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 6),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: primaryColor),
                                              child: const Padding(
                                                padding: EdgeInsets.all(5),
                                                child: Icon(
                                                  Icons.book,
                                                  color: Colors.white,
                                                  size: 26,
                                                ),
                                              ))
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.75,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  spreadRadius:
                                                      showingMsg ? 1 : 0,
                                                  color: primaryColorLight,
                                                  blurRadius:
                                                      showingMsg ? 20 : 0,
                                                  blurStyle: BlurStyle.outer)
                                            ]),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Image.asset(
                                                'assets/images/smile.png',
                                              ),
                                              Shimmer.fromColors(
                                                baseColor: primaryColor,
                                                highlightColor: showingMsg ? secondaryColor : primaryColor,
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.55,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.0125,
                                                  decoration: BoxDecoration(
                                                      color: primaryColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                ),
                                              ),
                                              Image.asset(
                                                'assets/images/veryhappy.png',
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),

                                    //Box text
                                    showingMsg ? buildMsgBox(context) : Column()
                                  ],
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 1,
                                  height:
                                      MediaQuery.of(context).size.height * 0.5,
                                  child: Stack(
                                    fit: StackFit.loose,
                                    alignment:
                                        AlignmentDirectional.bottomCenter,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        child: RiveAnimation.asset(
                                          "assets/images/login_screen_character.riv",
                                          fit: BoxFit.cover,
                                          stateMachines: const [
                                            'State Machine 1'
                                          ],
                                          onInit: (artboard) {
                                            controller = StateMachineController
                                                .fromArtboard(artboard,
                                                    "State Machine 1");
                                            if (controller == null) return;
                                            artboard.addController(controller!);
                                            trigSuccess = controller
                                                ?.findInput("success");
                                          },
                                          // animations: ['idle'],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),

                      //Widget will edit to button
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).devicePixelRatio * 10,
                          vertical:
                              MediaQuery.of(context).devicePixelRatio * 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: secondaryColor,
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  child: IconButton(
                                    icon: const Icon(Icons.flash_on_rounded),
                                    color: Colors.white,
                                    iconSize:
                                        MediaQuery.of(context).size.height *
                                            0.05,
                                    onPressed: () {},
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "ทดสอบ\nความเครียด",
                                    textAlign: TextAlign.center,
                                    style: fontsTH10_Black,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: secondaryColor,
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  child: IconButton(
                                    icon: Image.asset(
                                      'assets/images/handshake.png',
                                      color: Colors.white,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                                Text(
                                  "\nทดสอบที่ปรึกษา",
                                  style: fontsTH10_Black,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: secondaryColor,
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  child: IconButton(
                                    icon: const Icon(Icons.bookmark),
                                    color: Colors.white,
                                    iconSize:
                                        MediaQuery.of(context).size.height *
                                            0.04,
                                    onPressed: () {},
                                  ),
                                ),
                                Text(
                                  "\nโพสที่บันทึก",
                                  style: fontsTH10_Black,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: secondaryColor,
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  width:
                                      MediaQuery.of(context).size.width * 0.15,
                                  child: IconButton(
                                    icon: Image.asset(
                                      'assets/images/smiley.png',
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        showingMsg = true;
                                        Future.delayed(
                                            const Duration(milliseconds: 4250),
                                            () {
                                          setState(() {
                                            showingMsg = false;
                                          });
                                        });
                                      });
                                      trigSuccess?.change(true);
                                    },
                                  ),
                                ),
                                Text(
                                  "\nเพิ่มพลังงานบวก",
                                  style: fontsTH10_Black,
                                ),
                              ],
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
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    30, 20, 30, 5),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
                                  decoration: const BoxDecoration(
                                      color: thirterydColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Center(
                                    child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: " เรียงตามความนิยม ",
                                            style: GoogleFonts.getFont(
                                                'Bai Jamjuree',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 20, 20, 20),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              1,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.3,
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              color: skeletonColor),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else if (state is PostLoadedState) {
                                if (state.allPost.isEmpty) {
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 20, 20, 20),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              1,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.3,
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              color: skeletonColor),
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
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Column buildMsgBox(BuildContext context) {
    final random = Random();
    var msgWord = happyWord[random.nextInt(happyWord.length)];

    return Column(children: [
      Container(
        margin:
            EdgeInsets.only(top: MediaQuery.of(context).devicePixelRatio * 5),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white,
        ),
        height: MediaQuery.of(context).size.height * 0.095,
        width: MediaQuery.of(context).size.width * 0.75,
        child: Center(child: Text(msgWord, textAlign: TextAlign.center, style: fontsTH16_black_bold,)),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 75),
        child: Align(
          alignment: AlignmentDirectional.topEnd,
          child: Image.asset(
            'assets/images/triangle.png',
          ),
        ),
      )
    ]);
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
