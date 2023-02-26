import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../blocs/authentication/authen_bloc.dart';
import '../../blocs/pet/petBloc.dart';
import '../../blocs/post/post_bloc.dart';
import '../../constant.dart';

class DialogPetName extends StatelessWidget {
  const DialogPetName(
      {Key? key,
      required this.textController,
      required AuthenticationBloc userBloc,
      required this.petContext,
      required this.postBloc})
      : _userBloc = userBloc,
        super(key: key);

  final TextEditingController? textController;
  final AuthenticationBloc _userBloc;
  final PostBloc postBloc;
  final BuildContext petContext;

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
            height: MediaQuery.of(context).size.height * 0.195,
            decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Column(
              children: [
                Text(
                  "\nแก้ไขชื่อสัตว์เลี้ยงของคุณ",
                  style: GoogleFonts.getFont("Bai Jamjuree",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: textColor2),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 17, 30, 5),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.04,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: TextField(
                      autofocus: true,
                      controller: textController,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    petContext
                        .read<petBloc>()
                        .add(NamingPetEvent(textController?.text));
                    // _userBloc.add(getUserID());
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
