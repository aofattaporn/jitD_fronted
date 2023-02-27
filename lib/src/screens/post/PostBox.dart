import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import 'package:intl/intl.dart';
import '../../constant.dart';
import '../../data/respository/like_repository.dart';
import '../Utilities/PostModal.dart';

class PostBox extends StatelessWidget {
  final String? userId;
  final String? postId;
  final String? content;
  final String? date;
  final String? countComment;
  final String? countLike;
  final bool? isLike;
  final List<String>? category;
  const PostBox(
      {Key? key,
      required this.userId,
      required this.postId,
      required this.content,
      required this.date,
      required this.countComment,
      required this.countLike,
      required this.isLike,
      required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    LikeRepository likeRepository = LikeRepository();
    bool tempIsLike = isLike!;

    return Padding(
      padding: EdgeInsetsDirectional.only(
          bottom: MediaQuery.of(context).size.height * 0.03),
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
                    DateFormat('dd MMM yyyy   HH:mm:ss').format(
                        DateTime.parse(date!)
                            .toUtc()
                            .add(const Duration(hours: 7))),
                    style: GoogleFonts.getFont("Lato",
                        fontSize: 16, color: textColor3),
                  ),
                  PostModal(
                    userId: userId ?? "",
                    postId: postId ?? "",
                    content: content ?? "No Data",
                    date: date ?? DateTime.now().toString(),
                    category: category ?? ["Tag1", "Tag2"],
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "ชื่อผู้ใช้ ${"${userId!.substring(0, 5)}xxx"}",
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

              // Section-Tag ---------------------------------------------------
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.035,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: category!.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        // For click in category on postbox that will redirect to allPostByCategory
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => ViewAllPost(
                        //       categorySelected: category![index],
                        //     )));
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: secondaryColor),
                        child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10, 5, 10, 5),
                            child: Text(
                              category![index],
                              style: GoogleFonts.getFont("Bai Jamjuree",
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                      ),
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
                              text: countComment,
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
                  LikeButton(
                    isLiked: isLike,
                    likeCount: int.parse(countLike!),
                    likeBuilder: (bool isLiked) {
                      return Icon(
                        Icons.favorite,
                        color: isLiked ? heartColor : Colors.black12,
                        size: 30.0,
                      );
                    },
                    onTap: (unLike) async {
                      tempIsLike = !tempIsLike;
                      if (unLike == true) {
                        print(tempIsLike);
                        likeRepository.unlikePost(postId: postId);
                      } else {
                        print(tempIsLike);
                        likeRepository.likePost(postId: postId);
                      }
                      return !unLike;
                    },
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
