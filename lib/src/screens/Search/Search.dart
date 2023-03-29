import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jitd_client/src/constant.dart';
import 'package:jitd_client/src/constant/constant_fonts.dart';
import 'package:jitd_client/src/screens/Search/SearchQuery.dart';

import '../post/ViewAllPost.dart';

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
                      "มีโอกาสพบได้บ่อย",
                      style: GoogleFonts.getFont("Bai Jamjuree",
                          fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),


              // Recommend
              Container(
                // color: backgroundColor2,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Center(
                  child: Column(
                    children: [
                      buildCategory(context, '1','ปัญหาครอบครัว'),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.001,
                      ),
                      buildCategory(context, '2','สุขภาพร่างกาย'),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.001,
                      ),
                      buildCategory(context, '3','ปัญหาชีวิต'),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.001,
                      ),
                      buildCategory(context, '4','มหาวิทยาลัย'),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.001,
                      ),
                      buildCategory(context, '5','สุขภาพจิต'),
                    ],
                  ),
                ),
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
              
              Center(
                child: Image.asset(
                    'assets/images/searchPage.png',
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  Widget buildCategory(BuildContext context , String number, String cate) {
    return SizedBox(
                      width: MediaQuery.of(context).size.width*1,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: backgroundColor3,
                          elevation: 0,
                        ),
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ViewAllPost(
                                categorySelected: cate,
                              )));
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 20, 0),
                              child: Container(
                                width: MediaQuery.of(context).size.width*0.08,
                                height: MediaQuery.of(context).size.height*0.04,
                                decoration: const BoxDecoration(
                                  color: thirterydColor,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 10,
                                      color: Color.fromRGBO(0, 0, 0, 0.1),
                                      offset: Offset(0, 4),
                                    )
                                  ],
                                  borderRadius: BorderRadiusDirectional.all(
                                   Radius.circular(10)
                                  )
                                ),
                                child: Padding(
                                    padding: EdgeInsetsDirectional.all(5),
                                    child: Center(
                                      child: Text(
                                        number,
                                        style: GoogleFonts.getFont("Bai Jamjuree",
                                            fontSize: 18, color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                      ),
                                    )),
                              ),
                            ),
                            Text(
                              cate,
                              style: GoogleFonts.getFont("Bai Jamjuree",
                                  fontSize: 18, color: textColor2, fontWeight:
                              FontWeight.bold),
                            ),
                            // const Icon(
                            //   Icons.more_horiz,
                            //   color: primaryColorSubtle,
                            //   size: 30,
                            // ),
                          ],
                        ),
                      ),
                    );
  }

  Padding serachGenerate() {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Wrap(
          direction: Axis.horizontal,
          spacing: 5,
          runSpacing: 10,
          children: List.generate(searchHistory.length, (index) {
            return Container(
              decoration: const BoxDecoration(
                  color: thirterydColor,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  searchHistory[index],
                  style: GoogleFonts.getFont("Bai Jamjuree",
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            );
          }),
        ));
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
