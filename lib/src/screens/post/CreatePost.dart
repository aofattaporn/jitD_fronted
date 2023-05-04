import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jitd_client/src/blocs/post/post_state.dart';
import 'package:jitd_client/src/screens/post/Category.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/category/category_bloc.dart';
import '../../blocs/post/post_bloc.dart';
import '../../constant.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  CreatePostState createState() => CreatePostState();
}

class CreatePostState extends State<CreatePost> {
  TextEditingController? textController;
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  final _unFocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final toast = FToast();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    toast.init(context);
  }

  @override
  void dispose() {
    _unFocusNode.dispose();
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categoryBloc =
        BlocProvider<CategoryBloc>(create: (context) => CategoryBloc());
    final postBloc = BlocProvider(create: (_) => PostBloc());

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: primaryColor,
      // resizeToAvoidBottomInset: false,

      // This is a Panel
      body: MultiBlocProvider(
          providers: [postBloc, categoryBloc],
          child: BlocListener<PostBloc, PostState>(
              listener: (BuildContext context, state) {
                if (state is PostSuccess) {
                  Navigator.pop(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreatePost()));
                  showToast("สถานะการโพสสำเร็จ");
                }
              },
              child: SafeArea(
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(_unFocusNode);
                  },
                  child: BlocBuilder<CategoryBloc, CategoryState>(
                    builder: (context, state) {
                      return Stack(
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0, 1),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.85,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(50),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              Navigator.pop(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const CreatePost()));
                                            },
                                            icon: const Icon(
                                              Icons.cancel_rounded,
                                              size: 40,
                                              color: textColor2,
                                            )),
                                        BlocBuilder<CategoryBloc,
                                            CategoryState>(
                                          builder: (contexts, states) {
                                            return BlocBuilder<PostBloc,
                                                    PostState>(
                                                builder: (context, state) {
                                              if (state is CheckingPost) {
                                                return ElevatedButton(
                                                    onPressed: () {},
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            textStyle:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        16),
                                                            padding:
                                                                const EdgeInsets
                                                                        .fromLTRB(
                                                                    32,
                                                                    0,
                                                                    32,
                                                                    0),
                                                            backgroundColor:
                                                                thirterydColor,
                                                            shape:
                                                                const RoundedRectangleBorder(
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          40)),
                                                            )),
                                                    child:
                                                        const CircularProgressIndicator(
                                                            color: Colors
                                                                .white70));
                                              } else {
                                                return ElevatedButton(
                                                  onPressed: () {
                                                    if (keyForm.currentState!
                                                            .validate() &&
                                                        states.countSelectedCategory !=
                                                            0) {
                                                      keyForm.currentState!
                                                          .save();
                                                      context
                                                          .read<PostBloc>()
                                                          .add(CreatingPost(
                                                              textController
                                                                  ?.text,
                                                              true,
                                                              states
                                                                  .selectedCategoryMap));
                                                    }
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          textStyle:
                                                              const TextStyle(
                                                                  fontSize: 16),
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  32, 0, 32, 0),
                                                          backgroundColor:
                                                              thirterydColor,
                                                          shape:
                                                              const RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            40)),
                                                          )),
                                                  child: Text(
                                                    "โพส",
                                                    style: GoogleFonts.getFont(
                                                        "Bai Jamjuree",
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                );
                                              }
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.0125),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.35,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.04,
                                          decoration: const BoxDecoration(
                                            color: backgroundColor3,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              'user id : 1242413',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFF666666),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.325,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.04,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          decoration: BoxDecoration(
                                            color: secondaryColor,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: RichText(
                                              text: TextSpan(children: [
                                                const WidgetSpan(
                                                    child: Icon(
                                                  Icons.public,
                                                  size: 16,
                                                  color: Colors.white,
                                                )),
                                                TextSpan(
                                                    text: '  สาธารณะ',
                                                    style: GoogleFonts.getFont(
                                                        'Bai Jamjuree',
                                                        fontSize: 14,
                                                        color: Colors.white)),
                                                const TextSpan(text: '  '),
                                                const WidgetSpan(
                                                    child: Icon(
                                                  Icons.arrow_drop_down,
                                                  size: 18,
                                                  color: Colors.white,
                                                ))
                                              ]),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.0125),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.28,
                                      child: Scrollbar(
                                        child: Form(
                                          key: keyForm,
                                          child: TextFormField(
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'กรุณากรอกข้อความ';
                                              } else {
                                                return null;
                                              }
                                            },
                                            controller: textController,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              hintText: 'มีอะไรอยากจะบอกบ้าง',
                                              hintStyle: const TextStyle(
                                                  color: textColor3),
                                              enabledBorder:
                                                  buildUnderlineInputBorder(),
                                              focusedBorder:
                                                  buildUnderlineInputBorder(),
                                              errorBorder:
                                                  buildUnderlineInputBorder(),
                                              focusedErrorBorder:
                                                  buildUnderlineInputBorder(),
                                            ),
                                            maxLines: null,
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (state.countSelectedCategory == 0)
                                      Row(
                                        children: [
                                          Text(
                                            "กรุณาเลือกประเภทของโพส*",
                                            style: fontsTH14_thirteryd,
                                          )
                                        ],
                                      ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        GestureDetector(
                                          onTap: () => Navigator.of(context)
                                              .push(MaterialPageRoute(
                                                  builder: (_) =>
                                                      BlocProvider.value(
                                                        value: BlocProvider.of<
                                                                CategoryBloc>(
                                                            context),
                                                        child:
                                                            const CategorySelect(),
                                                      ))),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.45,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.04,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFAAD4CC),
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurRadius: 20,
                                                  color: Color(0x80AAD4CC),
                                                  offset: Offset(0, 2),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              shape: BoxShape.rectangle,
                                            ),
                                            child: Center(
                                              child: Text(
                                                'เลือกประเภทที่เกี่ยวข้อง+',
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.getFont(
                                                  'Lato',
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.0225),
                                    if (state.selectedCategoryMap.isNotEmpty)
                                      Container(
                                        color: backgroundColor3,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.06,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ListView.separated(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: state
                                                .selectedCategoryMap.length,
                                            separatorBuilder: (context, index) {
                                              return SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.03);
                                            },
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 0, bottom: 0),
                                                child: Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          20)),
                                                          color:
                                                              thirterydColor),
                                                  child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                              10, 5, 10, 5),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            state.selectedCategoryMap[
                                                                index],
                                                            style: GoogleFonts.getFont(
                                                                "Bai Jamjuree",
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ],
                                                      )),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      )
                                    else if (state.selectedCategoryMap.isEmpty)
                                      Row(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.85,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            color: backgroundColor3,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "    กรุณาระบุประเภทของโพส",
                                                  style: fontsTH16_Grey,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              )),
        ),
    );
  }

  UnderlineInputBorder buildUnderlineInputBorder() {
    return const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
        width: 1,
      ),
    );
  }

  Widget buildDragHandle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * 0.01,
          decoration: BoxDecoration(
              color: textColor3, borderRadius: BorderRadius.circular(15)),
        ),
      ],
    );
  }

  Route _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  void showToast(String msg) => toast.showToast(
        child: successToast(msg),
        gravity: ToastGravity.TOP,
      );

  Widget successToast(String msg) => Container(
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
        color: statusColorSuccess,
        child: IntrinsicHeight(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.check_circle,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.05),
              Text(
                msg,
                style: GoogleFonts.getFont("Bai Jamjuree",
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.015),
              const VerticalDivider(
                thickness: 1,
                width: 20,
                color: Colors.black,
              ),
              const CircleAvatar(
                  backgroundColor: Color.fromRGBO(102, 204, 144, 1),
                  child: Icon(
                    Icons.cancel_rounded,
                    color: Colors.white,
                    size: 30,
                  ))
            ],
          ),
        ),
      );
}
