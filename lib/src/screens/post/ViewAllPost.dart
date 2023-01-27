import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jitd_client/src/screens/post/ViewPost.dart';
import '../../constant.dart';
import '../../data/models/post_model.dart';
import 'PostBox.dart';

class ViewAllPost extends StatefulWidget {
  final List<PostModel> model;

  const ViewAllPost({Key? key, required this.model}): super(key: key);

  @override
  ViewAllPostState createState() => ViewAllPostState();
}

class ViewAllPostState extends State<ViewAllPost> {
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
            child: Column(
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
                              onPressed: () {
                                Navigator.pop(context);
                              },
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
                          alignment: const AlignmentDirectional(-0.75, 0.8),
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
                                        text: "ปัญหาที่เพิ่มมาใหม่    ",
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
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 20, 20, 0),
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
                          )),
                    ),
                  ],
                ),
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),

                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    itemCount: widget.model.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: PostBox(
                          userId: widget.model[index].userId ?? "",
                          postId: widget.model[index].postId ?? "",
                          content: widget.model[index].content ?? "No Data",
                          date: widget.model[index].date ?? DateTime.now().toString(),
                          category: widget.model[index].category ?? ["Tag1", "Tag2"],
                        ),
                        onTap: () {
                          // Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                          //     ViewPost(content: _postData[index].content,
                          //       : _postData[index].comment,
                          //       category: _postData[index].tag)));
                        },
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
