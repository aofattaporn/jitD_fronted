import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jitd_client/src/blocs/category/category_bloc.dart';
import '../../constant.dart';

class CategorySelect extends StatefulWidget {
  const CategorySelect({Key? key}) : super(key: key);

  @override
  CategorySelectState createState() => CategorySelectState();
}

class CategorySelectState extends State<CategorySelect> {
  List<String> category = [
    "การเรียน",
    "การงาน",
    "สุขภาพจิต",
    "ปัญหาชีวิต",
    "ความสัมพันธ์",
    "ครอบครัว",
    "สุขภาพร่างกาย"
  ];
  // List selectedCategory = List.generate(7, (i) => false);
  // List selectedCategoryMap = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      resizeToAvoidBottomInset: false,

      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: const AlignmentDirectional(0, 1),
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
                                  state.selectedCategoryMap.clear();
                                  for (int i = 0; i < category.length; i++) {
                                    if (state.selectedCategory[i] == true) {
                                      state.selectedCategoryMap.add(category[i]);
                                    }
                                  }
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                    textStyle: const TextStyle(fontSize: 16),
                                    padding: const EdgeInsets.fromLTRB(
                                        32, 10, 32, 10),
                                    backgroundColor: thirterydColor,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(40)),
                                    )),
                                child: const Text("ยืนยัน"),
                              )
                            ],
                          ),
                          Row(children: const [
                            Text(
                              'เลือกประเภทของโพส',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),
                          if (state.countSelectedCategory >= 3)
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                                child: Text(
                                  "*คุณสามารเลือกประเภทโพสได้มากสุด 3 ประเภท",
                                  style: fontsTH14_thirteryd,
                                ))
                          else
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                          ListView.separated(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: category.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  if (state.countSelectedCategory < 3) {
                                    if (state.selectedCategory[index] == true) {
                                      context
                                          .read<CategoryBloc>()
                                          .add(SelectedCategoryRemove());
                                    } else {
                                      context
                                          .read<CategoryBloc>()
                                          .add(SelectedCategoryAdd());
                                    }
                                    setState(() {
                                      state.selectedCategory[index] =
                                          !state.selectedCategory[index];
                                    });
                                  } else if (state.countSelectedCategory >= 3 &&
                                      state.selectedCategory[index] == true) {
                                    context
                                        .read<CategoryBloc>()
                                        .add(SelectedCategoryRemove());
                                    setState(() {
                                      state.selectedCategory[index] =
                                          !state.selectedCategory[index];
                                    });
                                  }
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  decoration: BoxDecoration(
                                      color: state.selectedCategory[index] == true
                                          ? primaryColor
                                          : backgroundColor2,
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 10,
                                          color: Color.fromRGBO(0, 0, 0, 0.1),
                                          offset: Offset(0, 4),
                                        )
                                      ]),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 0, 10, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          category[index],
                                          style: fontsTH16_Black,
                                        ),
                                        const Icon(
                                          Icons.add_circle_outline,
                                          color: primaryColor,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.02);
                            },
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}