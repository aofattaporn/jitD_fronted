import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant.dart';
import 'ViewAllPost.dart';

class AllCategory extends StatefulWidget {
  final String? categorySelected;
  const AllCategory({Key? key, this.categorySelected}) : super(key: key);

  @override
  State<AllCategory> createState() => _AllCategoryState();
}

class _AllCategoryState extends State<AllCategory> {
  List<String> category = [
    "การเรียน",
    "การงาน",
    "สุขภาพจิต",
    "ปัญหาชีวิต",
    "ความสัมพันธ์",
    "ครอบครัว",
    "สุขภาพร่างกาย"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: primaryColorSubtle,
          ),
          child: Column(
            children: [
              showHeaderAllPost(context),
              SizedBox(height: MediaQuery.of(context).size.height * 0.075),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.55,
                  decoration: BoxDecoration(
                      color: secondaryColorSubtle,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Wrap(
                        direction: Axis.horizontal,
                        spacing: 10,
                        runSpacing: 10,
                        children: List.generate(category.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ViewAllPost(
                                    categorySelected: category[index],
                                  )));
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(10))),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                child: Text(
                                  category[index],
                                  style: GoogleFonts.getFont("Bai Jamjuree",
                                      color: Colors.black, fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          );
                        }),
                      ))
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container showHeaderAllPost(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: const BoxDecoration(
        color: primaryColorSubtle,
      ),
      child: Stack(
        children: [
          Align(
            alignment: const AlignmentDirectional(1, -0.5),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.07,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: const BoxDecoration(
                color: primaryColorDark,
                borderRadius:
                    BorderRadius.horizontal(left: Radius.circular(10)),
              ),
            ),
          ),
          Align(
              alignment: const AlignmentDirectional(-0.85, -0.45),
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: textColor3,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              )),
          Align(
            alignment: const AlignmentDirectional(0.0, -0.35),
            child: Text(
              'โพสทั้งหมด',
              style: GoogleFonts.getFont(
                'Bai Jamjuree',
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Align(
              alignment: const AlignmentDirectional(-0.75, 0.8),
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.055,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.categorySelected ?? "ปัญหาที่เพิ่มมาใหม่",
                            style: GoogleFonts.getFont('Bai Jamjuree',
                                color: textColor2,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                        const CircleAvatar(
                          radius: 12,
                          backgroundColor: secondaryColorSubtle,
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            size: 25,
                            color: backgroundColor3,
                          ),
                        )
                      ],
                    ),
                  )))),
        ],
      ),
    );
  }
}
