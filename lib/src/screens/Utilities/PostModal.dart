import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant.dart';

class PostModal extends StatelessWidget {
  const PostModal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20))),
            context: context,
            builder: (BuildContext context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height *
                        0.025,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width *
                            0.3,
                        height:
                        MediaQuery.of(context).size.height *
                            0.01,
                        decoration: BoxDecoration(
                            color: textColor3,
                            borderRadius:
                            BorderRadius.circular(15)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height:
                    MediaQuery.of(context).size.height * 0.05,
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: Row(
                      children: [
                        Padding(
                          padding:
                          const EdgeInsetsDirectional.fromSTEB(
                              30, 0, 20, 0),
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10,
                                    color: Color.fromRGBO(
                                        0, 0, 0, 0.1),
                                    offset: Offset(0, 4),
                                  )
                                ],
                                borderRadius:
                                BorderRadiusDirectional.all(
                                    Radius.circular(10))),
                            child: const Padding(
                                padding:
                                EdgeInsetsDirectional.all(8),
                                child: Icon(
                                  Icons.edit,
                                  size: 28,
                                  color: textColor2,
                                )),
                          ),
                        ),
                        Text(
                          "แก้ไขโพสต์",
                          style: GoogleFonts.getFont("Bai Jamjuree",
                              fontSize: 18, color: textColor2),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height:
                    MediaQuery.of(context).size.height * 0.035,
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: Row(
                      children: [
                        Padding(
                          padding:
                          const EdgeInsetsDirectional.fromSTEB(
                              30, 0, 20, 0),
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10,
                                    color: Color.fromRGBO(
                                        0, 0, 0, 0.1),
                                    offset: Offset(0, 4),
                                  )
                                ],
                                borderRadius:
                                BorderRadiusDirectional.all(
                                    Radius.circular(10))),
                            child: const Padding(
                                padding:
                                EdgeInsetsDirectional.all(8),
                                child: Icon(
                                  Icons.save_rounded,
                                  size: 28,
                                  color: textColor2,
                                )),
                          ),
                        ),
                        Text(
                          "บันทึกโพสต์",
                          style: GoogleFonts.getFont("Bai Jamjuree",
                              fontSize: 18, color: textColor2),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height:
                    MediaQuery.of(context).size.height * 0.035,
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: Row(
                      children: [
                        Padding(
                          padding:
                          const EdgeInsetsDirectional.fromSTEB(
                              30, 0, 20, 0),
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10,
                                    color: Color.fromRGBO(
                                        0, 0, 0, 0.1),
                                    offset: Offset(0, 4),
                                  )
                                ],
                                borderRadius:
                                BorderRadiusDirectional.all(
                                    Radius.circular(10))),
                            child: const Padding(
                                padding:
                                EdgeInsetsDirectional.all(8),
                                child: Icon(
                                  Icons.delete,
                                  size: 28,
                                  color: textColor2,
                                )),
                          ),
                        ),
                        Text(
                          "ลบโพสต์",
                          style: GoogleFonts.getFont("Bai Jamjuree",
                              fontSize: 18, color: textColor2),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height:
                    MediaQuery.of(context).size.height * 0.035,
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: Row(
                      children: [
                        Padding(
                          padding:
                          const EdgeInsetsDirectional.fromSTEB(
                              30, 0, 20, 0),
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 10,
                                    color: Color.fromRGBO(
                                        0, 0, 0, 0.1),
                                    offset: Offset(0, 4),
                                  )
                                ],
                                borderRadius:
                                BorderRadiusDirectional.all(
                                    Radius.circular(10))),
                            child: const Padding(
                                padding:
                                EdgeInsetsDirectional.all(8),
                                child: Icon(
                                  Icons.notifications_off,
                                  size: 28,
                                  color: textColor2,
                                )),
                          ),
                        ),
                        Text(
                          "ปิดการแจ้งเตือนสำหรับโพสต์นี้",
                          style: GoogleFonts.getFont("Bai Jamjuree",
                              fontSize: 18, color: textColor2),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.085),


                ],
              );
            },
          );
        },
        icon: const Icon(
          Icons.more_horiz,
          color: textColor3,
          size: 30,
        ));
  }
}
