import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jitd_client/src/blocs/homepage/homepage_bloc.dart';
import 'package:jitd_client/src/blocs/homepage/homepage_event.dart';
import 'package:jitd_client/src/blocs/homepage/homepage_state.dart';

import '../constant.dart';
import '../data/models/post_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomepageBloc _homepageBloc = HomepageBloc();

  @override
  void initState() {
    _homepageBloc.add(LoadHomePageEvent());
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
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.height * 1,
                decoration: const BoxDecoration(
                    color: primaryColorSubtle,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color.fromRGBO(
                            0, 0, 0, 0.25),
                        offset: Offset(0, 4),
                      )
                    ]
                ),
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
                                top: MediaQuery.of(context).devicePixelRatio * 7,
                                left: MediaQuery.of(context).devicePixelRatio * 5),
                            child: const Text(
                              "JIT :D",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold),
                            ),
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
                            return CategoryBox();
                          }),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03,),

              BlocProvider(
                create: (context) => _homepageBloc,
                child: BlocBuilder<HomepageBloc, HomepageState>(builder: (context, state) {
                  if (state is HomePageLoadingState) {
                    return Text("Loading");
                  } else if (state is HomePageLoadedState) {
                    return _buildPostBox(context, state.allPost);
                  } else {
                    return Text(state.props.toString());
                  }
                })
              )

              //Post Data Here

            ],
          ),
        ),

      ),
    );
  }
}

Widget _buildPostBox(BuildContext context, PostModel model) {
  return Container(child: Text(model.content ?? "Content is null"),);
}

class CategoryBox extends StatelessWidget {
  const CategoryBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).devicePixelRatio*8,
                left: MediaQuery.of(context).devicePixelRatio*6),
            child: ElevatedButton(
              style: TextButton.styleFrom(
                backgroundColor: primaryColor,
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {},
              child: const Text('การงาน'),
            ),
          ),
        ],
      ),
    );
  }
}
