import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jitd_client/src/blocs/dialyQuest/quest_bloc.dart';
import 'package:jitd_client/src/blocs/dialyQuest/quest_event.dart';
import 'package:jitd_client/src/blocs/dialyQuest/quest_state.dart';
import 'package:jitd_client/src/blocs/post/post_bloc.dart';
import 'package:jitd_client/src/blocs/post/post_state.dart';
import 'package:jitd_client/src/blocs/user/user_state.dart';
import 'package:jitd_client/src/constant.dart';
import 'package:jitd_client/src/screens/BookMark.dart';
import 'package:jitd_client/src/screens/Setting/Setting_setting.dart';
import 'package:jitd_client/src/screens/profile/DialogQuest.dart';
import 'package:jitd_client/src/screens/profile/shimmerMyPost.dart';
import 'package:jitd_client/src/screens/profile/shimmerPetName.dart';
import 'package:jitd_client/src/screens/profile/shimmerUserID.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:rive/rive.dart';
import 'package:shimmer/shimmer.dart';

import '../../blocs/user/user_bloc.dart';
import '../../blocs/user/user_event.dart';
import '../../constant/constant_fonts.dart';
import '../test_stress/consultTest.dart';
import '../test_stress/stressTest.dart';
import 'DialogPetName.dart';
import 'buildMyPost.dart';

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

  final happyWord = [
    'อาหารมื้อที่ดีที่สุด คือมื้อที่คุณป้อนครับ',
    'หวังว่าวันนี้จะเป็นวันที่ดีสำหรับเธอนะ',
    'ขอบคุณสำหรับพลังงานแสนอบอุ่นนะ'
  ];

  // declare bloc instance variable
  final UserBloc _userBloc = UserBloc();
  final QuestBloc _questBloc = QuestBloc();

  // final petBlocProvider = BlocProvider<petBloc>(create: (context) => petBloc());
  final PostBloc _postBloc = PostBloc();

  // declare bloc provider
  final authBlocProvider =
      BlocProvider<UserBloc>(create: (context) => UserBloc());
  final postsBlocProvider =
      BlocProvider<PostBloc>(create: (context) => PostBloc());

  @override
  void initState() {
    _userBloc.add(const GetUserByID());
    _postBloc.add(GetMyPost());
    _questBloc.add(const GetMyQuest());
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
        // declare instance
        child: RefreshIndicator(
          onRefresh: () async {
            _userBloc.add(const GetUserByID());
            _postBloc.add(GetMyPost());
          },

          // create multi bloc provider
          child: MultiBlocProvider(
            providers: [postsBlocProvider, authBlocProvider],
            child: BlocBuilder<UserBloc, UserState>(
              builder: (petContext, petsState) {
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      // section #1 profile header + bear img
                      headerProfile(context, petContext),

                      // section #2 group of Icons activity
                      groupActivity(context),

                      // section #3 show all my post
                      bodyShowMyPost(context),
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

  //------  section #1 profile header + bear img ------------------

  Stack headerProfile(BuildContext context, BuildContext petContext) {
    return Stack(
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
              child: BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is GetUserSuccess ||
                      state is UpdatePetNameSuccess) {
                    // show pet name
                    return showPetName(context, state, petContext);
                  } else {
                    // show skeletion
                    return const ShimmerPetName();
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
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).devicePixelRatio * 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //id user + point
                        Row(
                          children: [
                            showUserID(context),
                            showPoints(context),
                          ],
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
                  BlocProvider(
                    create: (context) => _questBloc,
                    child: BlocBuilder<QuestBloc, QuestState>(
                      builder: (context, state) {
                        if (state is GetMyQuestSuccess) {
                          return iconQuest(context, true);
                        } else {
                          return iconQuest(context, false);
                        }
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: MediaQuery.of(context).size.height * 0.04,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: showingMsg ? 1 : 0,
                                color: primaryColorLight,
                                blurRadius: showingMsg ? 20 : 0,
                                blurStyle: BlurStyle.outer)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/images/smile.png',
                            ),
                            BlocProvider(
                              create: (context) => _userBloc,
                              child: BlocBuilder<UserBloc, UserState>(
                                builder: (context, state) {
                                  if (state is GetUserSuccess) {
                                    return petHPLoaded(context, state);
                                  } else {
                                    return petHPLoading(context);
                                  }
                                },
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
                height: MediaQuery.of(context).size.height * 0.5,
                child: Stack(
                  fit: StackFit.loose,
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.width * 0.7,
                      child: RiveAnimation.asset(
                        "assets/images/login_screen_character.riv",
                        fit: BoxFit.cover,
                        stateMachines: const ['State Machine 1'],
                        onInit: (artboard) {
                          controller = StateMachineController.fromArtboard(
                              artboard, "State Machine 1");
                          if (controller == null) return;
                          artboard.addController(controller!);
                          trigSuccess = controller?.findInput("success");
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
    );
  }

  Shimmer petHPLoading(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: skeletonColor,
      highlightColor: skeletonHighlightColor,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.55,
        height: MediaQuery.of(context).size.height * 0.0125,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.black),
      ),
    );
  }

  SizedBox petHPLoaded(BuildContext context, GetUserSuccess state) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.55,
      height: MediaQuery.of(context).size.height * 0.0125,
      child: Shimmer.fromColors(
        baseColor: primaryColor,
        highlightColor: showingMsg ? secondaryColor : primaryColor,
        child: LinearPercentIndicator(
          backgroundColor: Colors.black12,
          progressColor: primaryColor,
          lineHeight: MediaQuery.of(context).size.height * 0.025,
          barRadius: const Radius.circular(8),
          percent: state.user.petHP! * 0.01,
          animation: true,
          animationDuration: 200,
        ),
      ),
    );
  }

  Padding iconQuest(BuildContext context, bool loaded) {
    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              if (loaded) {
                showDialog(
                    context: context,
                    builder: (context) => DialogQuest(
                          questBloc: _questBloc,
                          userBloc: _userBloc,
                        ));
              }
            },
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: primaryColor),
                child: const Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.book,
                    color: Colors.white,
                    size: 26,
                  ),
                )),
          )
        ],
      ),
    );
  }

  Row showPoints(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 4),
          child: Image.asset(
            'assets/images/Point.png',
            height: 20,
          ),
        ),
        BlocProvider(
          create: (_) => _userBloc,
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is GetUserSuccess) {
                return Text(state.user.point.toString());
              } else {
                return const Text("Loading");
              }
            },
          ),
        ),
      ],
    );
  }

  Center showUserID(BuildContext context) {
    return Center(
      child: Container(
        margin:
            EdgeInsets.only(left: MediaQuery.of(context).devicePixelRatio * 5),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white),
        height: MediaQuery.of(context).size.height * 0.04,
        width: MediaQuery.of(context).size.width * 0.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocProvider(
              create: (_) => _userBloc,
              child:
                  BlocBuilder<UserBloc, UserState>(builder: (context, state) {
                if (state is GettingUser) {
                  return const ShmmimerUserID();
                } else if (state is GetUserSuccess ||
                    state is UpdatingPetName ||
                    state is UpdatePetNameSuccess) {
                  String identifyuser = state.user.userID.toString();
                  int maxLength = 10;
                  String conciseUser = (identifyuser.length > maxLength)
                      ? "${identifyuser.substring(0, maxLength)}..."
                      : identifyuser;
                  return Text("ID : $conciseUser");
                } else {
                  return const ShmmimerUserID();
                }
              }),
            ),
          ],
        ),
      ),
    );
  }

  Container showPetName(
      BuildContext context, UserState state, BuildContext petContext) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.045,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      alignment: Alignment.center,
      child: Stack(
        children: [
          Align(
              alignment: AlignmentDirectional.center,
              child: Text(state.user.petName.toString())),
          Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => DialogPetName(
                            textController: textController,
                            userBloc: _userBloc,
                            petContext: petContext,
                            postBloc: _postBloc));
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: primaryColorSubtle,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Padding(
                        padding: EdgeInsets.all(7.0),
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
  }

  //------  section #2 group of Icons activity ------------------

  Container groupActivity(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).devicePixelRatio * 10,
        vertical: MediaQuery.of(context).devicePixelRatio * 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,

        // create all activity button
        children: [
          // button test stress test
          _buttonActivity(context, "ทดสอบ\nความเครียด", 9, _stressBT(context)),

          // button test stress test
          _buttonActivity(context, "\nทดสอบที่ปรึกษา", 0, _consultantBT()),

          // button book mark
          _buttonActivity(context, "\nโพสที่บันทึก", 0, _bookMarkBT(context)),

          // button use point
          _buttonActivity(context, "\nเพิ่มพลังงานบวก", 0, _usePointBT()),
        ],
      ),
    );
  }

  Column _buttonActivity(
      BuildContext context, String title, double margin, Widget widget) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: margin),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: secondaryColor,
          ),
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.15,
          child: widget,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: fontsTH10_Black,
        ),
      ],
    );
  }

  IconButton _stressBT(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.flash_on_rounded),
      color: Colors.white,
      iconSize: MediaQuery.of(context).size.height * 0.05,
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const StressTest()));
      },
    );
  }

  IconButton _consultantBT() {
    return IconButton(
      icon: Image.asset(
        'assets/images/handshake.png',
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ConsultTest()));
      },
    );
  }

  IconButton _bookMarkBT(BuildContext? context) {
    return IconButton(
      icon: const Icon(Icons.bookmark),
      color: Colors.white,
      iconSize: MediaQuery.of(context!).size.height * 0.04,
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const BookMark()));
      },
    );
  }

  IconButton _usePointBT() {
    return IconButton(
      icon: Image.asset(
        'assets/images/smiley.png',
        color: Colors.white,
      ),
      onPressed: () {
        setState(() {
          showingMsg = true;
          Future.delayed(const Duration(milliseconds: 4250), () {
            setState(() {
              showingMsg = false;
            });
          });
        });
        trigSuccess?.change(true);
      },
    );
  }

  //------  section #3 show all my post ------------------

  Column bodyShowMyPost(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(30, 20, 30, 5),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.04,
                decoration: const BoxDecoration(
                    color: thirterydColor,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Center(
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: " เรียงตามความนิยม ", style: fontsTH14White),
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
          child: BlocBuilder<PostBloc, PostState>(builder: (context, state) {
            if (state is PostLoadingState) {
              return const ShimmerMyPost();
            } else if (state is PostLoadedState) {
              if (state.listPostModel.isEmpty) {
                return const Text("ไม่มีโพส");
              } else {
                return Column(
                  children: [
                    BuildMyPost(context, state.listPostModel, _postBloc),
                  ],
                );
              }
            } else {
              return const ShimmerMyPost();
            }
          }),
        ),
      ],
    );
  }

  // create msg box when click use point
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
        child: Center(
            child: Text(
          msgWord,
          textAlign: TextAlign.center,
          style: fontsTH16_black_bold,
        )),
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
