import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant.dart';

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
        height: MediaQuery.of(context).size.height * 0.3,
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
                    style: GoogleFonts.getFont("Bai Jamjuree",
                        color: textColor3, fontSize: 12),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
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
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: secondaryColor
                    ),
                    child: Padding(padding: const EdgeInsetsDirectional.fromSTEB(10, 5, 10, 5),
                    child: Text("ปัญหาชีวิต", style: GoogleFonts.getFont("Bai Jamjuree", fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),)),
                  )
                ],

              ),
              Row(

              )
            ],
          ),
        ),
      ),
    );
  }
}
