import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jitd_client/src/blocs/post/post_bloc.dart';
import 'package:jitd_client/src/constant.dart';

import 'package:jitd_client/src/data/models/cat_model.dart';
import '../blocs/counter/counter_bloc.dart';
import '../blocs/counter/counter_event.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jitd_client/src/screens/post/ViewPost.dart';
import '../blocs/post/post_state.dart';
import '../constant.dart';
import '../data/models/post_model.dart';
import 'post/PostBox.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PostBloc _postBloc = PostBloc();

  @override
  void initState() {
    _postBloc.add(GetAllPost());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColorSubtle,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          //Background on top
          child: Column(
            children: [
              Container(
                color: primaryColorSubtle,
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.height * 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Widget Box and Text
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            color: primaryColor,
                          ),
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Container(
                            margin: EdgeInsets.only(
                                top:
                                    MediaQuery.of(context).devicePixelRatio * 7,
                                left: MediaQuery.of(context).devicePixelRatio *
                                    5),
                            child: const Text(
                              "JIT :D",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(
                              right:
                                  MediaQuery.of(context).devicePixelRatio * 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: primaryColor,
                          ),
                          child: IconButton(
                            icon: Image.asset(
                              'assets/images/messenger.png',
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),

                    //Category btn
                    Expanded(
                      child: ListView.builder(
                          itemCount: 6,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Category();
                          }),
                    ),
                  ],
                ),
              ),
              BlocProvider(
                  create: (_) => _postBloc,
                  child: BlocBuilder<PostBloc, PostState>(
                      builder: (context, state) {
                    if (state is PostLoadingState) {
                      return const Text("Loading Skeleton Layout");
                    } else if (state is PostLoadedState) {
                      return _buildPostBox(context, state.allPost);
                    } else {
                      return Text(state.props.toString());
                    }
                  }))
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildPostBox(BuildContext context, List<PostModel> model) {
  // return Text("data");
  print(model[0].date);
  return ListView.builder(
    scrollDirection: Axis.vertical,
    itemCount: model.length,
    shrinkWrap: true,
    itemBuilder: (context, index) {
      return Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              color:  primaryColorSubtle,
                child: Column(
                  children: [
                    Text("postId: ${model[index].postId}"),
                    Text("content: ${model[index].content}"),
                    Text("date: ${model[index].date}"),
                    Text("category: ${model[index].category.toString()}"),
                  ],
                )
            )
          ],
        ),
      );
    },
  );
}
