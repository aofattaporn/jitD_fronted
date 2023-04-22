import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jitd_client/src/blocs/user/user_event.dart';

import '../../blocs/post/post_bloc.dart';
import '../../blocs/user/user_bloc.dart';
import '../../constant.dart';

class DialogReport extends StatelessWidget {
  const DialogReport({Key? key}) : super(key: key);

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
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Column(
              children: [
                Text(
                  "\nรายงาน",
                  style: GoogleFonts.getFont("Bai Jamjuree",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: textColor2),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),

                RadioListTile(
                    value: 1,
                    title: Text("เนื้อหาไม่เหมาะสม"),
                    activeColor: thirterydColor,
                    groupValue: 1,
                    onChanged: (val){}
                ),
                RadioListTile(
                    value: 1,
                    title: Text("เนื้อหาไม่เหมาะสม"),
                    activeColor: thirterydColor,
                    groupValue: 1,
                    onChanged: (val){}
                ),
                RadioListTile(
                    value: 1,
                    title: Text("เนื้อหาไม่เหมาะสม"),
                    activeColor: thirterydColor,
                    groupValue: 1,
                    onChanged: (val){}
                ),
                RadioListTile(
                    value: 1,
                    title: Text("เนื้อหาไม่เหมาะสม"),
                    activeColor: thirterydColor,
                    groupValue: 1,
                    onChanged: (val){}
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.035,
                    decoration: BoxDecoration(
                        color: thirterydColor,
                        borderRadius: BorderRadius.circular(10)),
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      "ยืนยัน",
                      style: fontsTH14_white,
                    ),
                  ),
                )
              ],
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
