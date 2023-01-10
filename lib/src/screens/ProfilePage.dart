import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jitd_client/src/constant.dart';


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
        child: Stack(
          children: [
            Container(
              color: primaryColorSubtle,
              height: MediaQuery.of(context).size.height * 0.4,
            ),

            Padding(
              padding: EdgeInsets.only(left: 30,top: 20),
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
              margin: EdgeInsets.only(top: 120,left: 45),
              child: Image.asset(
                  'assets/images/bear.png'),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.width * 0.7,
            ),


            Center(
              child: Container(
                margin: EdgeInsets.only(top: 170),
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
              margin: EdgeInsets.only(right: 300,top: 20),
              child: Center(
                child: Image.asset(
                  'assets/images/smile.png',
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.width * 0.7,
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 300,top: 20),
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
    );
  }
}
