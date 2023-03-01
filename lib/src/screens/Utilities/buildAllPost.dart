// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:jitd_client/src/blocs/post/post_bloc.dart';
// import 'package:jitd_client/src/constant.dart';
// import 'package:jitd_client/src/screens/Utilities/PostModal.dart';
// import 'package:jitd_client/src/screens/Utilities/categoryBox.dart';
// import 'package:jitd_client/src/screens/post/ViewAllPost.dart';
// import 'package:jitd_client/src/screens/post/ViewPost.dart';
// import 'package:shimmer/shimmer.dart';
//
// import '../../data/models/post_model.dart';
//
// Widget buildPostBox(BuildContext context, List<PostModel> model) {
//   const itemCount = 5;
//   return SizedBox(
//     height: MediaQuery.of(context).size.height * 0.235,
//     child: ListView.separated(
//       padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//       shrinkWrap: true,
//       scrollDirection: Axis.horizontal,
//       itemCount: model.length < itemCount ? model.length : itemCount,
//       separatorBuilder: (context, index) {
//         return SizedBox(
//           width: MediaQuery.of(context).size.width * 0.04,
//         );
//       },
//       itemBuilder: (context, index) {
//         return GestureDetector(
//           onTap: () => Navigator.of(context).push( createRoute(ViewPost(
//               postId: model[index].postId ?? "123",
//               userId: model[index].userId ?? "123",
//               content: model[index].content ?? "ERROR",
//               category: model[index].category ?? ["ERROR"],
//               date: model[index].date ?? "404",
//               countComment: model[index].countComment.toString(),
//               countLike: model[index].countLike.toString(),
//               isLike: model[index].isLike))),
//           child: Padding(
//             padding: const EdgeInsets.only(top: 10, bottom: 10),
//             child: Container(
//               width: MediaQuery.of(context).size.width * 0.7,
//               decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                   color: backgroundColor2,
//                   boxShadow: [
//                     BoxShadow(
//                       blurRadius: 15,
//                       color: Color.fromRGBO(170, 212, 204, 0.5),
//                       offset: Offset(0, 2),
//                     )
//                   ]),
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 15, right: 5),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           DataFormat('dd MMM yyyy   HH:mm:ss').format(
//                               DateTime.parse(model[index].date!)
//                                   .toUtc()
//                                   .add(const Duration(hours: 7))),
//                           style: GoogleFonts.getFont("Lato",
//                               fontSize: 12, color: textColor3),
//                         ),
//                         PostModal(
//                           userId: model[index].userId ?? "",
//                           postId: model[index].postId ?? "",
//                           content: model[index].content ?? "No Data",
//                           date: model[index].date ?? DateTime.now().toString(),
//                           category: model[index].category ?? ["Tag1", "Tag2"],
//                         ),
//                       ],
//                     ),
//                     Container(
//                       alignment: Alignment.topLeft,
//                       height: MediaQuery.of(context).size.height * 0.08,
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: Text(
//                               model[index].content ?? "Error404 Not Found",
//                               style: GoogleFonts.getFont("Bai Jamjuree",
//                                   fontSize: 16, color: textColor2),
//                               overflow: TextOverflow.ellipsis,
//                               maxLines: 3,
//                               softWrap: false,
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: MediaQuery.of(context).size.height * 0.01),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height * 0.035,
//                       child: ListView.separated(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: model[index].category?.length ?? 0,
//                         separatorBuilder: (context, index) {
//                           return SizedBox(
//                               width: MediaQuery.of(context).size.width * 0.02);
//                         },
//                         itemBuilder: (BuildContext context, int i) {
//                           return Container(
//                             decoration: const BoxDecoration(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(10)),
//                                 color: secondaryColor),
//                             child: Padding(
//                                 padding: const EdgeInsetsDirectional.fromSTEB(
//                                     10, 5, 10, 5),
//                                 child: Text(
//                                   model[index].category![i],
//                                   style: GoogleFonts.getFont("Bai Jamjuree",
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white),
//                                 )),
//                           );
//                         },
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     ),
//   );
// }
