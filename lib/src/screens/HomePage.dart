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
        child: Stack(
          children: [
            Container(
              color: primaryColorSubtle,
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Padding(
              padding: EdgeInsets.only(top: 0),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color: primaryColor,
                ),
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.7,
                padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.02, horizontal: MediaQuery.of(context).size.width * 0.05),
                child: const Text(
                  "JIT :D",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     Container(
            //       child: Image.asset(
            //         "assets/images/messenger.png",
            //         height: 40,
            //       ),
            //     )
            //   ],
            // ),
            Expanded(
              child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                return Category();
              }),
            ),
          ],
        ),
      ),
    );
  }
}
