import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jitd_client/src/constant.dart';

import 'package:jitd_client/src/data/models/cat_model.dart';
import '../blocs/counter/counter_bloc.dart';
import '../blocs/counter/counter_event.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
          child: Container(
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
                      decoration: BoxDecoration(
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
                        child: Text(
                          "JIT :D",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 48,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(right: MediaQuery.of(context).devicePixelRatio * 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: primaryColor,
                      ),
                      child: IconButton(
                        icon: Image.asset(
                          'assets/images/messenger.png',
                          color: Colors.white,
                        ),
                        onPressed: (){},
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
        ),

      ),
    );
  }
}
