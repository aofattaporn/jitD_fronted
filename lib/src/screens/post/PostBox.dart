import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant.dart';
import '../Utilities/PostModal.dart';

class PostBox extends StatelessWidget {
  final String content;
  final String like;
  final List<String>? comment;
  final List<String> tag;

  const PostBox(
      {super.key,
      required this.content,
      required this.like,
      this.comment,
      required this.tag});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          top: MediaQuery.of(context).size.height * 0.03),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.31,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: Color.fromRGBO(0, 0, 0, 0.1),
                offset: Offset(0, 4),
              )
            ]),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20, 5, 20, 10),
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
                  const PostModal()
                ],
              ),
              Row(
                children: [
                  Text(
                    "ผู้ใช้ STOXX",
                    style: GoogleFonts.getFont("Bai Jamjuree",
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
                      content,
                      style: GoogleFonts.getFont("Bai Jamjuree",
                          fontSize: 16, color: textColor2),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      softWrap: false,
                    ),
                  )
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),

              // Section-Tag ---------------------------------------------------
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.035,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: tag.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: secondaryColor),
                      child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10, 5, 10, 5),
                          child: Text(
                            tag[index],
                            style: GoogleFonts.getFont("Bai Jamjuree",
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                    );
                  },
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),

              // Section-Comments ----------------------------------------------
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.03,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: primaryColor),
                    child: Center(
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: comment?.length.toString(),
                              style: GoogleFonts.getFont('Lato',
                                  fontSize: 16, color: Colors.white)),
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
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.175,
                    child: Center(
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: like,
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
    );
  }
}