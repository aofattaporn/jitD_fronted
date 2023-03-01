import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jitd_client/src/blocs/comment/comment_bloc.dart';
import 'package:jitd_client/src/blocs/comment/comment_state.dart';

import '../../constant.dart';
import '../../constant/constant_fonts.dart';

class SortModal extends StatefulWidget {
  final String? userId;
  final CommentBloc commentBloc;

  const SortModal({Key? key, required this.userId, required this.commentBloc})
      : super(key: key);

  @override
  State<SortModal> createState() => _SortModalState();
}

class _SortModalState extends State<SortModal> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final currentID = user?.uid;

    return TextButton(
      child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.height * 0.04,
          decoration: const BoxDecoration(
              color: thirterydColor,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Center(
            child: BlocProvider.value(
              value: widget.commentBloc,
              child: BlocBuilder<CommentBloc, CommentState>(
                builder: (context, state) {
                  return RichText(
                    text: TextSpan(children: [
                      TextSpan(text: state.sortby, style: fontsTH14White),
                      const WidgetSpan(
                        child: Icon(
                          Icons.arrow_drop_down,
                          size: 18,
                          color: backgroundColor3,
                        ),
                      ),
                    ]),
                  );
                }
              ),
            ),
          )),
      onPressed: () {
        showModalBottomSheet(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            context: context,
            builder: (BuildContext context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.01,
                        decoration: BoxDecoration(
                            color: textColor3,
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Text(
                    "เรียงตามความต้องการ",
                    style: GoogleFonts.getFont("Bai Jamjuree",
                        fontSize: 24, color: thirterydColor),
                  ),
                  Text(
                    "คุณสามารถเรียงในสิ่งที่คุณต้องการได้",
                    style: GoogleFonts.getFont("Bai Jamjuree",
                        fontSize: 16, color: textColor3),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  GestureDetector(
                    child: Text("เรียงตามความนิยม",
                        style:
                            GoogleFonts.getFont("Bai Jamjuree", fontSize: 16)),
                    onTap: () {
                      Navigator.pop(context);
                      widget.commentBloc.add(SortCommentByLike("เรียงตามความนิยม"));
                    },
                  ),
                  Divider(height: 20, thickness: 1),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  GestureDetector(
                    child: Text("เรียงตามโพสล่าสุด",
                        style:
                        GoogleFonts.getFont("Bai Jamjuree", fontSize: 16)),
                    onTap: () {
                      Navigator.pop(context);
                      widget.commentBloc.add(SortCommentByDate("เรียงตามโพสล่าสุด"));
                    },
                  ),
                  Divider(height: 20, thickness: 1),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                ],
              );
            });
      },
    );
  }
}
