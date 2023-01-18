import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant.dart';

class SearchQuery extends StatefulWidget {
  final List<String> searchHistory;

  const SearchQuery({Key? key, required this.searchHistory}) : super(key: key);

  @override
  State<SearchQuery> createState() => _SearchQueryState();
}

class _SearchQueryState extends State<SearchQuery> {
  TextEditingController? searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    searchController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    height: MediaQuery.of(context).size.height *
                                        0.0375,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                          bottom: Radius.circular(20)),
                                      color: secondaryColor,
                                    )),
                                const SizedBox(width: 5),
                                GestureDetector(
                                    onTap: () => Navigator.pop(context),
                                    child: const Icon(Icons.clear_rounded, color: backgroundColor2,size: 25,)),
                                const SizedBox(width: 10,)
                              ],
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
                            child: TextField(
                              controller: searchController,
                              autofocus: true,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: const Icon(
                                    Icons.search,
                                    color: primaryColor,
                                  ),
                                  hintText: "ค้นหาอะไรบางอย่าง",
                                  hintStyle: GoogleFonts.getFont("Bai Jamjuree",
                                      color: textColor3),
                              suffixIcon: IconButton(
                                onPressed: searchController?.clear,
                                splashColor: Colors.transparent,
                                icon: const Icon(Icons.cancel_rounded, color: secondaryColor, size: 22,),
                              )
                              ),
                            ),
                          )),
                    ],
                  ),
                ),

                if (searchController?.text.isEmpty == true)
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.searchHistory.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.searchHistory[index],
                                  style: GoogleFonts.getFont("Bai Jamjuree",
                                      fontSize: 16),
                                ),
                                const Icon(
                                  Icons.arrow_forward,
                                  color: secondaryColor,
                                  size: 20,
                                ),
                              ],
                            ),
                          );
                        }),
                  )
                else
                  Padding(
                    padding: const EdgeInsets.all(50),
                    child: Text("ไม่มีข้อมูลที่เกี่ยวข้อง"),
                  )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
