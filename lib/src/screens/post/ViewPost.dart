import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant.dart';

class ViewPost extends StatefulWidget {
  final String content;
  final String like;
  final List<String>? comment;
  final List<String> tag;

  const ViewPost(
      {Key? key,
      required this.content,
      required this.like,
      this.comment,
      required this.tag})
      : super(key: key);

  @override
  ViewPostState createState() => ViewPostState();
}

class ViewPostState extends State<ViewPost> {
  final _unFocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _unFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background_post.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        key: scaffoldKey,
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unFocusNode),
            child: Padding(
              padding: const EdgeInsetsDirectional.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  // Section-Header
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.115,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white),
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            color: textColor3,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.035),
                  Row(children: [
                    Container(
                        height: MediaQuery.of(context).size.height * 0.0425,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: secondaryColor),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10, 0, 10, 0),
                          child: Text(
                            "โพสหมายเลข 124343232",
                            style: GoogleFonts.getFont("Sarabun",
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        )))
                  ]),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                  // Section-PostDetail
                  Container(
                    decoration:
                        const BoxDecoration(
                            color: Colors.white, 
                            borderRadius: BorderRadiusDirectional.all(Radius.circular(10)),
                            boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Color.fromRGBO(170, 212, 204, 0.8),
                        offset: Offset(0, 4),
                      )
                    ]),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 5, 20, 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "23 Nov 2022",
                                style: GoogleFonts.getFont("Lato",
                                    fontSize: 16, color: textColor3),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.more_horiz,
                                    color: textColor3,
                                    size: 30,
                                  ))
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "ผู้ใช้ STOXX",
                                style: GoogleFonts.getFont("Sarabun",
                                    color: textColor3, fontSize: 12),
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),

                          // Section-Content
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  widget.content,
                                  style: GoogleFonts.getFont("Sarabun",
                                      fontSize: 16, color: textColor2),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1000,
                                  softWrap: false,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),

                          // Section-Tag ---------------------------------------------------
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.035,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.tag.length,
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.02);
                              },
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: secondaryColor),
                                  child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              10, 5, 10, 5),
                                      child: Text(
                                        widget.tag[index],
                                        style: GoogleFonts.getFont(
                                            "Sarabun",
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      )),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),

                          // Section-Comments ----------------------------------------------
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    color: primaryColor),
                                child: Center(
                                  child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text:
                                              widget.comment?.length.toString(),
                                          style: GoogleFonts.getFont('Lato',
                                              fontSize: 16,
                                              color: Colors.white)),
                                      const TextSpan(text: '  '),
                                      const WidgetSpan(
                                          child: Icon(
                                        Icons.chat,
                                        size: 16,
                                        color: Colors.white,
                                      ))
                                    ]),
                                  ),
                                ),
                              ),

                              // Section-Like
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.175,
                                child: Center(
                                  child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: widget.like,
                                          style: GoogleFonts.getFont('Lato',
                                              fontSize: 18, color: textColor2)),
                                      const TextSpan(text: ' '),
                                      const WidgetSpan(
                                          child: Icon(
                                        Icons.favorite,
                                        color: Colors.black12,
                                        size: 22,
                                      ))
                                    ]),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),

                  // Section-Comment
                  Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
