import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant.dart';
import '../Utilities/PostModal.dart';

class CommentBox extends StatelessWidget {
  final String? userId;
  final String? commentId;
  final String? content;
  final int? like;
  final String? postId;
  final String? Date;

  const CommentBox(
      {Key? key,
        required this.userId,
        required this.commentId,
        required this.content,
        required this.like,
        required this.postId,
        required this.Date,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          bottom: MediaQuery.of(context).size.height * 0.03),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.25,
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
                    Date?? DateTime.now().toString(),
                    style: GoogleFonts.getFont("Lato",
                        fontSize: 16, color: textColor3),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    userId?? "",
                    style: GoogleFonts.getFont("Bai Jamjuree",
                        color: textColor3, fontSize: 12),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),

              // Section-Content
              Container(
                alignment: Alignment.topLeft,
                height: MediaQuery.of(context).size.height * 0.08,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        content ?? "No Data",
                        style: GoogleFonts.getFont("Bai Jamjuree",
                            fontSize: 16, color: textColor2),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        softWrap: false,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),

              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              // Section-Comments ----------------------------------------------

              Row(
                children: [
                  // Section-Like
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.175,
                    child: Center(
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: '0',
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