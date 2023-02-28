import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jitd_client/src/blocs/dialyQuest/quest_bloc.dart';
import 'package:jitd_client/src/blocs/user/user_event.dart';

import '../../blocs/post/post_bloc.dart';
import '../../blocs/user/user_bloc.dart';
import '../../constant.dart';

class DialogQuest extends StatelessWidget {
  const DialogQuest({super.key});


  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(20),
      backgroundColor: Colors.transparent,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: const BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: thirterydColor),
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Daily Quest",
                          style: fontsENG20_White_Bold,
                        )),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                  Text("data"),
                  Text(
                    "ทำภารกิจ และ รับคะแนน\nเพื่อให้แก่สัตว์เลี้ยงของคุณได้เลย",
                    style: fontsTH16_black_bold,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: primaryColorLight),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),

                      child: Column(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width,
                              height:
                                  MediaQuery.of(context).size.height * 0.085,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: primaryColorSubtle)),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.0125),
                          Container(
                              width: MediaQuery.of(context).size.width,
                              height:
                                  MediaQuery.of(context).size.height * 0.085,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: primaryColorSubtle)),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.0125),
                          Container(
                              width: MediaQuery.of(context).size.width,
                              height:
                                  MediaQuery.of(context).size.height * 0.085,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: primaryColorSubtle)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              top: -20,
              right: 10,
              child: RawMaterialButton(
                onPressed: () => Navigator.pop(context),
                fillColor: statusColorErrorLight,
                padding: const EdgeInsets.all(11),
                shape: const CircleBorder(),
                child: Text(
                  "X",
                  style: GoogleFonts.getFont("Lato",
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ))
        ],
      ),
    );
  }
}
