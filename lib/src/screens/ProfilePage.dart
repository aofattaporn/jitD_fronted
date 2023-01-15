import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jitd_client/src/constant.dart';

import 'package:rive/rive.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

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
          child: Stack(
            children: [
              Container(
                color: primaryColorSubtle,
                height: MediaQuery.of(context).size.height * 0.4,
              ),

              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).devicePixelRatio * 13,
                    top: MediaQuery.of(context).devicePixelRatio * 0.5),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                  ),
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.85,

                ),
              ),

              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).devicePixelRatio * 42,
                    left: MediaQuery.of(context).devicePixelRatio * 20),
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.width * 0.6,
                child: const RiveAnimation.asset(
                    "assets/images/login_screen_character.riv",
                    fit: BoxFit.cover,
                    animations: const ['idle']),
              ),

              Center(
                child: Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).devicePixelRatio * 160),
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
              ),

              Container(
                margin: EdgeInsets.only(
                    right: MediaQuery.of(context).devicePixelRatio * 115,
                    top: MediaQuery.of(context).devicePixelRatio * 100),
                child: Center(
                  child: Image.asset(
                    'assets/images/smile.png',
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.width * 0.7,
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).devicePixelRatio * 115,
                    top: MediaQuery.of(context).devicePixelRatio * 100),
                child: Center(
                  child: Image.asset(
                    'assets/images/veryhappy.png',
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.width * 0.7,
                  ),
                ),
              ),

            ],
          ),

        ),
      ),
    );
  }
}
