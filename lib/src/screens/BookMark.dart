import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jitd_client/src/blocs/post/post_bloc.dart';
import 'package:jitd_client/src/screens/post/PostBox.dart';
import 'package:jitd_client/src/screens/post/ViewPost.dart';

import '../constant.dart';

class BookMark extends StatefulWidget {
  const BookMark({Key? key}) : super(key: key);

  @override
  BookMarkState createState() => BookMarkState();
}

class BookMarkState extends State<BookMark> {
  final _unFocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _unFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unFocusNode),
          child: SingleChildScrollView(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Stack(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: const BoxDecoration(
                          color: primaryColorSubtle,
                        )),
                    Align(
                      alignment: const AlignmentDirectional(1, -0.95),
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
                        alignment: const AlignmentDirectional(-0.85, -0.85),
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
                      alignment: const AlignmentDirectional(-1, -0.65),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.height * 0.125,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            color: secondaryColor),
                        child: Align(
                          alignment: const AlignmentDirectional(-0.7, 0),
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
                      alignment: AlignmentDirectional(0.25, -0.67),
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
                    Align(
                      alignment: AlignmentDirectional(0, -0.05),
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              child: PostBox(
                                userId: "123456",
                                postId: "121567",
                                content:
                                    "ที่ทำงานปัจจุบันให้เงินเดือน 17000 แต่ผมต้องใช้เวลาเดินทางไปทำงาน 1 ชั่วโมงเทียบอีกที่ให้เงินเดือน 15000 แต่อยู่ใกล้บ้าน ทุกคนคิดว่าผมควรย้ายไหมครับ",
                                date: DateTime.now().toString(),
                                category: ["การงาน"],
                                countComment: '0',
                                countLike: '0',
                                isLike: false,
                                postBloc: PostBloc(),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ViewPost(
                                          userId: "123456",
                                          postId: "121567",
                                          content:
                                              "ที่ทำงานปัจจุบันให้เงินเดือน 17000 แต่ผมต้องใช้เวลาเดินทางไปทำงาน 1 ชั่วโมงเทียบอีกที่ให้เงินเดือน 15000 แต่อยู่ใกล้บ้าน ทุกคนคิดว่าผมควรย้ายไหมครับ",
                                          date: DateTime.now().toString(),
                                          category: ["การงาน"],
                                          countComment: '0',
                                          countLike: '',
                                          isLike: false,
                                          postBloc: PostBloc(),
                                        )));
                              },
                            );
                          }),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
