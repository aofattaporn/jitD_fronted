import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constant.dart';
import '../../data/models/post_model.dart';
import 'PostBox.dart';

class ViewPost extends StatefulWidget {
  const ViewPost({Key? key}) : super(key: key);

  @override
  ViewPostState createState() => ViewPostState();
}

class ViewPostState extends State<ViewPost> {
  final _unFocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final List<PostData> _postData = [
    PostData(
        "เพิ่งตัดสินใจลาออกจากงานเนื่องจากงานที่ทำได้เงินเดือน 9,000บาทงานที่ทำอยู่เกี่ยวกับการ ขาย ของนะคะหากได้ตามเป้าก็จะได้คอมมิชชั่นแต่ก็นั่นแหละค่ะเป้ามันสูงมากเราเลยได้แต่เงินเดือนรู้สึกไม่คุ้มกับความเหนื่อยและความกดดันผมผมควรทำอย่างไรกับชีวิตดีครับตออนนี้จนปัญญามากเลย ไม่มีทางไหน ให้ไปแล้ว",
        '123',
        ['comment1', 'comment2'],
        ['ปัญหาชีวิต', 'อะไรไม่รู้']),
    PostData(
        "ที่บ้านผมมีป้าข้างบ้านคนหนึ่งที่เขามักจะสนใจเรื่องของผมเป็นพิเศษครับ โดยเขาชอบมาถามแม่ผมถึงเรื่องต่างๆนาๆในชีวิตผมละชอบเอาไปใส่ไข่ แต่เขาไม่เคยที่จะสนใจลูกของเขาเลยครับ ส่วนแม่ของผมก็มีบ้างที่สนใจเขา ผมควรทำยังไงกับป้าคนนี้ครับ ยิ่งปล่อยยิ่งแย่",
        '1223',
        ['comment3', 'comment4'],
        ['การเรียน'])
  ];

  @override
  void dispose() {
    _unFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: primaryColorSubtle,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unFocusNode),
          child: Stack(
            children: [
              Container(
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
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(10)),
                        ),
                      ),
                    ),
                    Align(
                        alignment: const AlignmentDirectional(-0.85, -0.45),
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
                            onPressed: () {},
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
                        alignment: const AlignmentDirectional(-0.75, 1),
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: MediaQuery.of(context).size.height * 0.055,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.white),
                            child: Center(
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "ปัญหาที่คล้ายกัน    ",
                                      style: GoogleFonts.getFont('Bai Jamjuree',
                                          color: textColor2,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  const WidgetSpan(
                                      child: CircleAvatar(
                                    radius: 12,
                                    backgroundColor: secondaryColorSubtle,
                                    child: Icon(
                                      Icons.keyboard_arrow_up,
                                      size: 25,
                                      color: backgroundColor3,
                                    ),
                                  )),
                                ]),
                              ),
                            ))),
                  ],
                ),
              ),

              // Main (Show all post here)
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
                                return PostBox(
                                  content: _postData[index].content,
                                  like: _postData[index].like,
                                  comment: _postData[index].comment,
                                  tag: _postData[index].tag,
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
