import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jitd_client/src/constant.dart';
import 'package:jitd_client/src/screens/Search/SearchQuery.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => SearchState();
}

class SearchState extends State<Search> {
  final List<String> recommendTag = [
    'ปัญหาครอบครัว',
    'สุขภาพร่างกาย',
    'ปัญหาชีวิต',
    'มหาวิทยาลัย',
    'สุขภาพจิตใจ'
  ];
  final List<String> searchHistory = [
    'ชีวิตการทำงาน',
    'ความรัก',
    'การลงทุน',
    'การเปลี่ยนแปลงของชีวิต',
    'สังคมการทำงาน',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header ----------------------------------------------------------
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.2,
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.175,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: primaryColor,
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: AlignmentDirectional.topEnd,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 40),
                              child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height: MediaQuery.of(context).size.height *
                                      0.0375,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(20)),
                                    color: secondaryColor,
                                  )),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Text(
                                  "ค้นหา",
                                  style: GoogleFonts.getFont("Bai Jamjuree",
                                      fontSize: 34,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Text(
                                    "เริ่มค้นหาวิธีการแก้ปัญหาของคุณได้เลย !",
                                    style: GoogleFonts.getFont("Bai Jamjuree",
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    // SearchBar -------------------------------------------------
                    Align(
                      alignment: AlignmentDirectional.bottomCenter,
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.06,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  offset: Offset(0, 4),
                                )
                              ]),
                          child: GestureDetector(
                            onTap: () => Navigator.of(context)
                                .push(_createRoute(SearchQuery(
                              searchHistory: searchHistory,
                            ))),
                            child: TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: const Icon(
                                    Icons.search,
                                    color: primaryColor,
                                  ),
                                  hintText: "ค้นหาอะไรบางอย่าง",
                                  hintStyle: GoogleFonts.getFont("Bai Jamjuree",
                                      color: textColor3)),
                            ),
                          )),
                    )
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Text(
                      "ยอดนิยม",
                      style: GoogleFonts.getFont("Bai Jamjuree",
                          fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              // Recommend

              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: recommendTag.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.065,
                          height: MediaQuery.of(context).size.height * 0.035,
                          decoration: const BoxDecoration(
                            color: thirterydColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(2.5)),
                          ),
                          child: Center(
                              child: Text(
                            (index + 1).toString(),
                            style: GoogleFonts.getFont("Bai Jamjuree",
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.03,
                        ),
                        Text(recommendTag[index],
                            style: GoogleFonts.getFont("Bai Jamjuree",
                                fontSize: 16)),
                        const Spacer(),
                        const Icon(
                          Icons.more_horiz,
                          color: textColor3,
                        )
                      ],
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 25),
                child: Row(
                  children: [
                    Text(
                      "แสดงเพิ่มเติม",
                      style: GoogleFonts.getFont("Bai Jamjuree",
                          color: textColor3),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "รายการค้นหาล่าสุด",
                      style: GoogleFonts.getFont("Bai Jamjuree",
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Text("ล้างค่า",
                        style: GoogleFonts.getFont("Bai Jamjuree",
                            color: textColor3))
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 25),
                child: Container(
                    constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width,
                      minHeight: MediaQuery.of(context).size.height * 0.05,
                    ),
                    decoration: const BoxDecoration(
                        color: backgroundColor2,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Wrap(
                          direction: Axis.horizontal,
                          spacing: 5,
                          runSpacing: 10,
                          children:
                              List.generate(searchHistory.length, (index) {
                            return Container(
                              decoration: const BoxDecoration(
                                  color: thirterydColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  searchHistory[index],
                                  style: GoogleFonts.getFont("Bai Jamjuree",
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            );
                          }),
                        ))),
              ),
            ],
          ),
        ),
      )),
    );
  }

  Route _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, -0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
