import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../constant.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  CreatePostState createState() => CreatePostState();
}

class CreatePostState extends State<CreatePost> {
  List<String> privacyDropdown = ['สาธารณะ', 'ส่วนตัว'];
  List<String> chatDropdown = ['เปิด', 'ปิด'];
  String? selectPrivacyDropdown = 'สาธารณะ';
  String? selectChatDropdown = 'เปิด';

  TextEditingController? textController;
  final _unFocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final panelController = PanelController();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    _unFocusNode.dispose();
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: primaryColor,
        // resizeToAvoidBottomInset: false,

        // This is a Panel
        body: SlidingUpPanel(
          // defaultPanelState: PanelState.OPEN,
          controller: panelController,
          color: Colors.transparent,
          maxHeight: MediaQuery.of(context).size.height * 0.37,
          minHeight: MediaQuery.of(context).size.height * 0.1,
          // For Open Panel
          panel: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.025,),
                  buildDragHandle(),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.085,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          const WidgetSpan(
                              child: Icon(
                                Icons.lock,
                                size: 19,
                                color: textColor3,
                              )),
                          TextSpan(
                              text: "แก้ไขคำที่ต้องการบล็อค",
                              style: GoogleFonts.getFont(
                                'Bai Jamjuree',
                                color: textColor3,
                                fontSize: 16
                              ))
                        ]),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: const TextSpan(children: [
                          WidgetSpan(
                              child: Icon(
                                Icons.person_search,
                                size: 19,
                                color: textColor3,
                              )),
                          TextSpan(
                              text: "แก้ไขระดับผู้ให้คำปรึกษาที่เห็นโพสได้",
                              style: TextStyle(color: textColor3, fontSize: 18))
                        ]),
                      ),
                    ],
                  )
                ],
              )),

          // For collapsed panel
          collapsed: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(_unFocusNode);
              panelController.open();
            },
            // onTap: panelController.open,
            child: Container(
              color: backgroundColor2,
              child: Center(
                child: RichText(
                  text: TextSpan(children: [
                    const WidgetSpan(
                        child: Icon(
                      Icons.settings,
                      size: 20,
                      color: textColor3,
                    )),
                    TextSpan(
                        text: "ตั้งค่าโพสเพิ่มเติม",
                        style: GoogleFonts.getFont("Bai Jamjuree", fontSize: 18, color: textColor3))
                  ]),
                ),
              ),
            ),
          ),

          // This is a Main App
          body: SafeArea(
            child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(_unFocusNode);
                  panelController.close();
                },
              child: Stack(
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
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Stack(
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(1, -0.95),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    textStyle: const TextStyle(fontSize: 16),
                                    padding: const EdgeInsets.fromLTRB(
                                        32, 10, 32, 10),
                                    backgroundColor: thirterydColor,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(40)),
                                    )),
                                child: const Text("โพส"),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0, -0.75),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.35,
                                    height: MediaQuery.of(context).size.height *
                                        0.04,
                                    decoration: const BoxDecoration(
                                      color: backgroundColor3,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
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
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    height: MediaQuery.of(context).size.height *
                                        0.04,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: secondaryColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: DropdownButtonFormField<String>(
                                      decoration: const InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: secondaryColor)),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: secondaryColor)),
                                        errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: secondaryColor)),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: secondaryColor)),
                                      ),
                                      dropdownColor: secondaryColor,
                                      icon: const Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.white, // <-- SEE HERE
                                      ),
                                      value: selectPrivacyDropdown,
                                      items: privacyDropdown
                                          .map((item) =>
                                              DropdownMenuItem<String>(
                                                value: item,
                                                child: Text(item,
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.white)),
                                              ))
                                          .toList(),
                                      onChanged: (item) => setState(() {
                                        selectPrivacyDropdown = item;
                                      }),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0, -0.3),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                child: Scrollbar(
                                  child: TextFormField(
                                    onTap: () => panelController.close(),
                                    controller: textController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'มีอะไรอยากจะบอกบ้าง',
                                      hintStyle:
                                          const TextStyle(color: textColor3),
                                      enabledBorder: buildUnderlineInputBorder(),
                                      focusedBorder: buildUnderlineInputBorder(),
                                      errorBorder: buildUnderlineInputBorder(),
                                      focusedErrorBorder:
                                          buildUnderlineInputBorder(),
                                    ),
                                    maxLines: null,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0, 0.5),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    height: MediaQuery.of(context).size.height *
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
                                      borderRadius: BorderRadius.circular(10),
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
                                ],
                              ),
                            ),
                            Align(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment:
                                          const AlignmentDirectional(0, 0.65),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFFF8FAFA),
                                        ),
                                        child: Stack(
                                          children: [],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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
          ),
        ));
  }

  UnderlineInputBorder buildUnderlineInputBorder() {
    return const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
        width: 1,
      ),
    );
  }

  Widget buildDragHandle() => GestureDetector(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.01,
              decoration: BoxDecoration(
                  color: textColor3, borderRadius: BorderRadius.circular(15)),
            ),
          ],
        ),
        onTap: () {},
      );
}
