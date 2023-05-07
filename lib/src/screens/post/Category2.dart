import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jitd_client/src/blocs/post/post_state.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../blocs/post/post_bloc.dart';
import '../../constant.dart';
import '../../constant/constant_fonts.dart';
import '../../data/models/post_model.dart';

class Category2 extends StatefulWidget {
  final List<String>? category;
  final PostBloc postBloc;
  final String postID;

  const Category2(
      {Key? key,
      required this.category,
      required this.postBloc,
      required this.postID})
      : super(key: key);

  @override
  Category2State createState() => Category2State();
}

class Category2State extends State<Category2> {
  TextEditingController? textController;
  final panelController = PanelController();
  final PostBloc postBloc2 = PostBloc();
  List<String> category = [
    "การเรียน",
    "การงาน",
    "สุขภาพจิต",
    "ปัญหาชีวิต",
    "ความสัมพันธ์",
    "ครอบครัว",
    "สุขภาพร่างกาย"
  ];
  late List<String> myList = [];

  @override
  void initState() {
    // initial category og post
    postBloc2.add(InitialSelectCat(widget.category!));

    super.initState();
    // textController = TextEditingController(text: widget.content);
  }

  @override
  void dispose() {
    // textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List<PostDate> listPost = widget.postBloc.listHomePageModel.postDate!;
    int i = getIndex(listPost, widget.postID);

    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: width * 0.08),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(50)),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: height * 0.025, horizontal: width * 0.07),
            child: MultiBlocProvider(
              providers: [
                BlocProvider<PostBloc>(
                  create: (context) => postBloc2,
                ),
                BlocProvider.value(
                  value: widget.postBloc,
                )
              ],
              child: MultiBlocListener(
                listeners: [
                  BlocListener<PostBloc, PostState>(
                    bloc: widget.postBloc,
                    listener: (context, state) {
                      if (state is EditCategorySuccess) {
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                  BlocListener<PostBloc, PostState>(
                    bloc: postBloc2,
                    listener: (context, state) {
                      if (state is SelectedCatSuccess) {
                        myList = state.category.toList();
                      }
                    },
                  ),
                ],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // header
                    header(),

                    showCategory(width, height, i),

                    // select category
                    selectCategory(height, i)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox selectCategory(double height, int i) {
    return SizedBox(
      height: height * 0.5,
      child: BlocProvider<PostBloc>(
        create: (context) => postBloc2,
        child: BlocBuilder<PostBloc, PostState>(builder: (context, state) {
          if (state is SelectCatMaxCategory) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "*คุณสามารเลือกประเภทโพสได้มากสุด 3 ประเภท",
                      style: fontsTH14_thirteryd,
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: category.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _category(index, state, true, category[index]);
                    },
                  ),
                ),
              ],
            );
          }
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(""),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: category.length,
                  itemBuilder: (BuildContext context, int index) {
                    bool slected = checkClick(category[index]);
                    return _category(index, state, slected, category[index]);
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Container _category(
      int index, PostState state, bool selected, String newcat) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Card(
            color: (selected) ? primaryColorSubtle : Colors.white,
            shadowColor: (selected) ? primaryColorSubtle : backgroundColor2,
            elevation: (selected) ? 0 : 2,
            child: ListTile(
                title: Text(category[index]),
                // check funtion to ckick and add
                onTap: () {
                  if (selected) {
                    postBloc2.add(RemoveCategory(newcat, myList));
                  } else {
                    postBloc2.add(AddCategory(newcat, myList));
                  }
                },
                textColor: secondaryColor,
                trailing: (!selected)
                    ? Icon(
                        Icons.add_circle_rounded,
                        color: (selected) ? primaryColor : secondaryColor,
                      )
                    : null)));
  }

  Container showCategory(double width, double height, int i) {
    return Container(
      width: width,
      margin: EdgeInsets.symmetric(vertical: height * 0.03),
      height: height * 0.08,
      padding: EdgeInsets.symmetric(
          vertical: height * 0.02, horizontal: width * 0.05),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor3,
      ),
      child: BlocProvider<PostBloc>(
        create: (context) => postBloc2,
        child: BlocBuilder<PostBloc, PostState>(builder: (context, state) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.category.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: thirterydColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(horizontal: 20)),
                  onPressed: () {
                    // remove category
                    context
                        .read<PostBloc>()
                        .add(RemoveCategory(state.category[index], myList));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(state.category[index]),
                      const Icon(Icons.close)
                    ],
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }

  int getIndex(List<PostDate> listPost, String postID) {
    for (int i = 0; i < listPost.length; i++) {
      if (listPost[i].postId == postID) {
        return i;
      }
    }
    return 0;
  }

  bool checkClick(String category) {
    for (var element in myList) {
      if (element == category) {
        return true;
      }
    }
    return false;
  }

  Row header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.close)),
        ElevatedButton(
            onPressed: () {
              widget.postBloc.add(UpdateCategory(widget.postID, myList));
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: thirterydColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
            child: BlocBuilder<PostBloc, PostState>(
                bloc: widget.postBloc,
                builder: (context, state) {
                  if (state is WillEditCategory) {
                    return const CircularProgressIndicator();
                  } else {
                    return Text(
                      "แก้ไขประเภทของโพส",
                      style: fontsTH16White,
                    );
                  }
                }))
      ],
    );
  }
}
