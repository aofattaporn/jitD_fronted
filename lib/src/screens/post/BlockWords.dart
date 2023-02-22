import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jitd_client/src/blocs/category/category_bloc.dart';
import 'package:jitd_client/src/screens/post/CreatePost.dart';
import '../../blocs/post/post_bloc.dart';
import '../../constant.dart';

class BlockWords extends StatefulWidget {
  const BlockWords({Key? key}) : super(key: key);

  @override
  BlockWordsState createState() => BlockWordsState();
}

class BlockWordsState extends State<BlockWords> {
  List<String> category = [
    "การเรียน",
    "การงาน",
    "สุขภาพจิต",
    "ปัญหาชีวิต",
    "ความสัมพันธ์",
    "ครอบครัว",
    "สุขภาพร่างกาย"
  ];
  List selectedCategory = List.generate(7, (i) => false);
  List selected = List.generate(7, (i) => false);
  List selectedCategoryMap = [];

  @override
  Widget build(BuildContext context) {
    final categoryBloc =
        BlocProvider<CategoryBloc>(create: (context) => CategoryBloc());

    return Scaffold(
      backgroundColor: primaryColor,
      // resizeToAvoidBottomInset: false,

      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: const AlignmentDirectional(0, 1),
              child: MultiBlocProvider(
                providers: [categoryBloc],
                child: BlocBuilder<CategoryBloc, CategoryState>(
                  builder: (context, state) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.85,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(50),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.all(20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.arrow_back),
                                  onPressed: () {
                                    print("Testing");
                                    Navigator.pop(context);
                                  },
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    print(state.countSelectedCategory);
                                    // Navigator.of(context).push(_createRoute(const CreatePost()));
                                  },
                                  style: ElevatedButton.styleFrom(
                                      textStyle: const TextStyle(fontSize: 16),
                                      padding: const EdgeInsets.fromLTRB(
                                          32, 10, 32, 10),
                                      backgroundColor: thirterydColor,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(40)),
                                      )),
                                  child: const Text("ยืนยัน"),
                                )
                              ],
                            ),
                            Row(children: const [
                              Text(
                                'แก้ไขคำที่ต้องการบล็อค',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ]),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}