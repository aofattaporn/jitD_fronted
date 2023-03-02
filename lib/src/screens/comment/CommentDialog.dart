import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jitd_client/src/blocs/comment/comment_bloc.dart';
import 'package:jitd_client/src/blocs/user/user_event.dart';
import '../../constant.dart';

class CommentDialog extends StatelessWidget{
  final String? userId;
  final String? postId;
  final String? commentId;
  final String? content;
  final String? date;
  final TextEditingController? commentController;
  final CommentBloc commentBloc;

  const CommentDialog(
      {Key? key,
        required this.userId,
        required this.postId,
        required this.commentId,
        required this.content,
        required this.date,
        required this.commentController,
        required this.commentBloc})
      : super(key: key);

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
                  "\nแก้ไขความคิดเห็นของคุณ",
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
                      controller: commentController,
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
      ),);
  }
}

// showDialog(
//   context: context,
//   builder: (context) => AlertDialog(
//     title: Text("Edit comment"),
//     content: TextFormField(
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'กรุณากรอกข้อความ';
//         }
//         return null;
//       },
//       controller: commentController,
//       autofocus: true,
//       obscureText: false,
//       decoration: const InputDecoration(
//         hintText: 'คอมเมนต์ให้พลังงานบวกกัน',
//         hintStyle: TextStyle(
//           color: textColor3,
//         ),
//       ),
//       minLines: 1,
//       maxLines: 5,
//     ),
//     actions: [
//       TextButton(
//         child: Text("Cancel"),
//         onPressed: () {
//           Navigator.pop(context);
//         },
//       ),
//       TextButton(
//         child: Text("Save"),
//         onPressed: () {
//           widget.commentBloc.add(UpdatingMyComment(
//               commentController!.text,
//               widget.date,
//               widget.postId,
//               widget.commentId));
//           // Do something with the edited comment, like sending it to the server or updating it in the UI
//           Navigator.pop(context);
//         },
//       ),
//     ],
//   ),
// );

