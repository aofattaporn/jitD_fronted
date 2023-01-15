import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jitd_client/App.dart';
import 'package:jitd_client/src/constant.dart';

import 'package:rive/rive.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: AppBar(
          backgroundColor: primaryColorSubtle,
          elevation: 0,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Background Top
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50)),
                  color: primaryColorSubtle,
                ),
                height: MediaQuery.of(context).size.height * 0.5,

                // Widget in Top Background
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).devicePixelRatio * 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: MediaQuery.of(context).devicePixelRatio *
                                    5),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.white),
                            height: MediaQuery.of(context).size.height * 0.04,
                            width: MediaQuery.of(context).size.width * 0.4,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                right: MediaQuery.of(context).devicePixelRatio *
                                    5),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.white),
                            height: MediaQuery.of(context).size.height * 0.04,
                            width: MediaQuery.of(context).size.width * 0.2,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).devicePixelRatio * 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                      ),
                      height: MediaQuery.of(context).size.height * 0.125,
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.width * 0.6,
                      child: const RiveAnimation.asset(
                          "assets/images/login_screen_character.riv",
                          fit: BoxFit.cover,
                          animations: const ['idle']),
                    ),
                  ],
                ),
              ),

              //Widget Name pet and Image smile
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          right: MediaQuery.of(context).devicePixelRatio * 30,
                          top: MediaQuery.of(context).devicePixelRatio * 10,
                        ),
                        child: Container(
                          child: Image.asset(
                            'assets/images/smile.png',
                          ),
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                      ),

                      Container(
                        child: Container(
                          margin: EdgeInsets.only(
                            left: MediaQuery.of(context).devicePixelRatio * 30,
                            top: MediaQuery.of(context).devicePixelRatio * 10,
                          ),
                          child: Image.asset(
                            'assets/images/veryhappy.png',
                          ),
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                      ),

                    ],
                  ),

                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).devicePixelRatio * 15,
                        top: MediaQuery.of(context).devicePixelRatio * 30),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: backgroundColor3,
                    ),
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "หมีขั้วโลกเหนือ",
                          style: TextStyle(fontSize: 16, color: textColor1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              //Widget will edit to button
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).devicePixelRatio * 10,
                          left: MediaQuery.of(context).devicePixelRatio * 5,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: secondaryColor,
                        ),
                        height: MediaQuery.of(context).size.height * 0.085,
                        width: MediaQuery.of(context).size.width * 0.2,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).devicePixelRatio * 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: secondaryColor,
                        ),
                        height: MediaQuery.of(context).size.height * 0.085,
                        width: MediaQuery.of(context).size.width * 0.2,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).devicePixelRatio * 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: secondaryColor,
                        ),
                        height: MediaQuery.of(context).size.height * 0.085,
                        width: MediaQuery.of(context).size.width * 0.2,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: MediaQuery.of(context).devicePixelRatio * 10,
                          right: MediaQuery.of(context).devicePixelRatio * 5,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: secondaryColor,
                        ),
                        height: MediaQuery.of(context).size.height * 0.085,
                        width: MediaQuery.of(context).size.width * 0.2,
                      ),
                    ],
                  ),
                ],
              ),

            ],
          ),

        ),
      ),
    );
  }
}
