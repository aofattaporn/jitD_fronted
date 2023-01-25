import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jitd_client/src/screens/ProfilePage.dart';
import 'package:jitd_client/src/constant.dart';




class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Bar
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: (){
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const ProfilePage()),
                        );
                      },
                    ),

                    Text(
                      "การตั้งค่า",
                      style: TextStyle(
                          color: textColor1,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),

                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.1,
                    ),
                  ],
                ),
              ),

              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.doorbell),
                    onPressed: (){},
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
