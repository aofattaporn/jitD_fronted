import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../blocs/post/post_bloc.dart';
import '../../blocs/post/post_state.dart';
import '../../constant.dart';
import '../post/PostBox.dart';
import '../post/ViewPost.dart';

class SearchQuery extends StatefulWidget {
  final List<String> searchHistory;

  const SearchQuery({Key? key, required this.searchHistory}) : super(key: key);

  @override
  State<SearchQuery> createState() => _SearchQueryState();
}

class _SearchQueryState extends State<SearchQuery> {
  final _unFocusNode = FocusNode();
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
    _unFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unFocusNode),
        child: BlocProvider(
          create: (_) => PostBloc(),
          child: BlocBuilder<PostBloc, PostState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15),
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
                              height:
                                  MediaQuery.of(context).size.height * 0.175,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: primaryColor,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.0375,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.vertical(
                                                bottom: Radius.circular(20)),
                                            color: secondaryColor,
                                          )),
                                      const SizedBox(width: 5),
                                      GestureDetector(
                                          onTap: () => Navigator.pop(context),
                                          child: const Icon(
                                            Icons.clear_rounded,
                                            color: backgroundColor2,
                                            size: 25,
                                          )),
                                      const SizedBox(
                                        width: 10,
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 30),
                                        child: Text(
                                          "ค้นหา",
                                          style: GoogleFonts.getFont(
                                              "Bai Jamjuree",
                                              fontSize: 34,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 30),
                                        child: Text(
                                            "เริ่มค้นหาวิธีการแก้ปัญหาของคุณได้เลย !",
                                            style: GoogleFonts.getFont(
                                                "Bai Jamjuree",
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
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
                                    onChanged: (text) {
                                      context
                                          .read<PostBloc>()
                                          .add(GetPostBySearch(text));
                                    },
                                    controller: searchController,
                                    autofocus: true,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        prefixIcon: const Icon(
                                          Icons.search,
                                          color: primaryColor,
                                        ),
                                        hintText: "ค้นหาอะไรบางอย่าง",
                                        hintStyle: GoogleFonts.getFont(
                                            "Bai Jamjuree",
                                            color: textColor3),
                                        suffixIcon: IconButton(
                                          onPressed: searchController?.clear,
                                          splashColor: Colors.transparent,
                                          icon: const Icon(
                                            Icons.cancel_rounded,
                                            color: secondaryColor,
                                            size: 22,
                                          ),
                                        )),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        widget.searchHistory[index],
                                        style: GoogleFonts.getFont(
                                            "Bai Jamjuree",
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
                        BlocBuilder<PostBloc, PostState>(
                          builder: (context, state) {
                            if (state is PostLoadingState) {
                              return Shimmer.fromColors(
                                baseColor: skeletonColor,
                                highlightColor: skeletonHighlightColor,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsetsDirectional.fromSTEB(0, 20, 20, 0),
                                          child: Container(
                                            width: MediaQuery.of(context).size.width * 0.4,
                                            height: MediaQuery.of(context).size.height * 0.04,
                                            decoration: const BoxDecoration(
                                                color: thirterydColor,
                                                borderRadius:
                                                BorderRadius.all(Radius.circular(20))),),
                                        ),
                                      ],
                                    ),
                                    ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        physics: const NeverScrollableScrollPhysics(),
                                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                                        itemCount: 3,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.03),
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
                                            ),
                                          );
                                        }),
                                  ],
                                ),
                              );

                            }
                            else if (state is PostLoadedState)
                              {
                                if (state.allPost.isEmpty)
                                  {
                                    return const Padding(
                                      padding: EdgeInsets.all(50),
                                      child: Text("ไม่มีข้อมูลที่เกี่ยวข้อง"),
                                    );
                                  }
                                else {
                                  return Column(
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsetsDirectional.fromSTEB(0, 20, 20, 0),
                                          child: Container(
                                              width: MediaQuery.of(context).size.width * 0.4,
                                              height: MediaQuery.of(context).size.height * 0.04,
                                              decoration: const BoxDecoration(
                                                  color: thirterydColor,
                                                  borderRadius:
                                                  BorderRadius.all(Radius.circular(20))),
                                              child: Center(
                                                child: RichText(
                                                  text: TextSpan(children: [
                                                    TextSpan(
                                                        text: " เรียงตามความนิยม ",
                                                        style: GoogleFonts.getFont('Bai Jamjuree',
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.bold)),
                                                    const WidgetSpan(
                                                      child: Icon(
                                                        Icons.arrow_drop_down,
                                                        size: 18,
                                                        color: backgroundColor3,
                                                      ),
                                                    ),
                                                  ]),
                                                ),
                                              )),
                                        ),
                                      ],
                                    ),
                                    ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        physics: const NeverScrollableScrollPhysics(),
                                        padding: const EdgeInsets.fromLTRB(5, 20, 5, 0),
                                        itemCount: state.allPost.length,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            child: PostBox(
                                              userId: state.allPost[index].userId ?? "",
                                              postId: state.allPost[index].postId ?? "",
                                              content:
                                              state.allPost[index].content ?? "No Data",
                                              date: state.allPost[index].date ??
                                                  DateTime.now().toString(),
                                              category: state.allPost[index].category ??
                                                  ["Tag1", "Tag2"],
                                            ),
                                            onTap: () {
                                              Navigator.of(context).push(MaterialPageRoute(
                                                  builder: (context) =>
                                                      ViewPost(
                                                        userId:
                                                        state.allPost[index].userId ?? "",
                                                        postId:
                                                        state.allPost[index].postId ?? "",
                                                        content:
                                                        state.allPost[index].content ??
                                                            "No Data",
                                                        date: state.allPost[index].date ??
                                                            DateTime.now().toString(),
                                                        category:
                                                        state.allPost[index].category ??
                                                            ["Tag1", "Tag2"],
                                                      )));
                                            },
                                          );
                                        }),
                                  ],
                                );
                                }
                              }
                            else {
                              return Text(state.props.toString());
                            }
                          },
                        )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      )),
    );
  }
}
