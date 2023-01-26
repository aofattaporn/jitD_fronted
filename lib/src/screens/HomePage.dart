import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jitd_client/src/constant.dart';

import 'package:jitd_client/src/data/models/cat_model.dart';
import '../blocs/counter/counter_bloc.dart';
import '../blocs/counter/counter_event.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jitd_client/src/screens/post/ViewPost.dart';
import '../constant.dart';
import '../data/models/post_model.dart';
import 'post/PostBox.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<PostData> _postData = [
    PostData(
        "เพิ่งตัดสินใจลาออกจากงานเนื่องจากงานที่ทำได้เงินเดือน 9,000บาทงานที่ทำอยู่เกี่ยวกับการ ขาย ของนะคะหากได้ตามเป้าก็จะได้คอมมิชชั่นแต่ก็นั่นแหละค่ะเป้ามันสูงมากเราเลยได้แต่เงินเดือนรู้สึกไม่คุ้มกับความเหนื่อยและความกดดันผมผมควรทำอย่างไรกับชีวิตดีครับตออนนี้จนปัญญามากเลย ไม่มีทางไหน ให้ไปแล้ว",
        '123',
        ['comment1', 'comment2'],
        ['ปัญหาชีวิต', 'อะไรไม่รู้']),
    PostData(
        "ที่บ้านผมมีป้าข้างบ้านคนหนึ่งที่เขามักจะสนใจเรื่องของผมเป็นพิเศษครับ โดยเขาชอบมาถามแม่ผมถึงเรื่องต่างๆนาๆในชีวิตผมละชอบเอาไปใส่ไข่ แต่เขาไม่เคยที่จะสนใจลูกของเขาเลยครับ ส่วนแม่ของผมก็มีบ้างที่สนใจเขา ผมควรทำยังไงกับป้าคนนี้ครับ ยิ่งปล่อยยิ่งแย่",
        '1223',
        ['ผมคิดว่าลองทำความเข้าใจกับคุณแม่กันใหม่นะ ครับลองพูดเหตุผลให้ท่าน ชี้แจงว่าแบบไหนที่จะ ทำให้รู้สึกโอเคทั้งสองฝ่าย และปล่อยผ่านไปได้',
          'ถ้าแม่คุณยังเชื่อคุณอยู่ ก็ปล่อยป้าแกเขา เถอะครับ อย่าไปยุ่งเลย ปวดหัวเปล่าๆ'],
        ['การเรียน']),
    PostData('สวัสดีครับ ผมเรียนอยู่ม.4 ครับ การเรียนของผม ก็ค่อนข้างที่จะดีครับแต่มีวิชาคณิตที่ฉุดคะแนนของผมตลอดเลยครับ ผมเครียดมากเลย ได้เกรด 1 เองครับ',
        '2', [], ['การเรียน', 'การงาน', 'การเรียน','การเรียน','การเรียน','การเรียน',])
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColorSubtle,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          //Background on top
          child: Column(
            children: [
              Container(
                color: primaryColorSubtle,
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.height * 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Widget Box and Text
                        Container(
                          decoration: BoxDecoration(
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
                                top: MediaQuery.of(context).devicePixelRatio * 7,
                                left: MediaQuery.of(context).devicePixelRatio * 5),
                            child: Text(
                              "JIT :D",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(right: MediaQuery.of(context).devicePixelRatio * 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: primaryColor,
                          ),
                          child: IconButton(
                            icon: Image.asset(
                              'assets/images/messenger.png',
                              color: Colors.white,
                            ),
                            onPressed: (){},
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

              //post
              Align(
                alignment: const AlignmentDirectional(0, 1),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.7,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
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
                                width: MediaQuery.of(context).size.width * 0.4,
                                height:
                                MediaQuery.of(context).size.height * 0.04,
                                decoration: const BoxDecoration(
                                    color: thirterydColor,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
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
                                )),
                          ),
                        ],
                      ),
                      Expanded(
                          child: ListView.builder(
                              padding: const EdgeInsetsDirectional.all(20),
                              itemCount: _postData.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  child: PostBox(
                                    content: _postData[index].content,
                                    like: _postData[index].like,
                                    comment: _postData[index].comment,
                                    tag: _postData[index].tag,
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                                        ViewPost(content: _postData[index].content,
                                            like: _postData[index].like,
                                            comment: _postData[index].comment,
                                            tag: _postData[index].tag)));

                                  },
                                );
                              })),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}
