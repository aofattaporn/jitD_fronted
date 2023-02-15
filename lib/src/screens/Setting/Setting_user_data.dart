import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Setting_userdata extends StatefulWidget {
  const Setting_userdata({Key? key}) : super(key: key);

  @override
  State<Setting_userdata> createState() => _Setting_userdataState();
}

class _Setting_userdataState extends State<Setting_userdata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "ข้อมูลส่วนตัว",
          style: TextStyle(
              fontSize: 16, color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            const Text(
                "ป้อนข้อมูลส่วนตัวของคุณ ถึงแม้บัญชีนี้จะใช้สำหรับธุรกิจ สัตว์เลั้ยงหรือสิ่งอื่นๆ ก็ตาม ข้อมูลนี้จะไม่ปรากฏบนโปรไฟล์สาธารณะของคุณ\n\n\n"
                    "To keep yout account secure, don’t enter an email or phone number that belongs to someone else.",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    //letterSpacing: 2.2,
                    color: Color.fromARGB(255, 143, 175, 178))),
            const SizedBox(height: 40),
            //Text("Email", style: TextStyle(fontSize: 18, color: Colors.black),),
            Align(
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  //babel text
                  hintText: "Enter your email" ,
                  //hint text
                  prefixIcon: Icon(Icons.people),
                  //prefix iocn
                  hintStyle:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  //hint text style
                  labelStyle: TextStyle(
                      fontSize: 18, color: Colors.black), //label style
                ),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  //babel text
                  hintText: "Enter your Phone Number",
                  //hint text
                  prefixIcon: Icon(Icons.phone),
                  //prefix iocn
                  hintStyle:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  //hint text style
                  labelStyle: TextStyle(
                      fontSize: 18, color: Colors.black), //label style
                ),
              ),
            ),
            // Container(
            //     padding: const EdgeInsets.all(40.0),
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: <Widget>[
            //         TextField(
            //           decoration:
            //               InputDecoration(labelText: "Enter your number"),
            //           keyboardType: TextInputType.number,
            //           inputFormatters: <TextInputFormatter>[
            //             FilteringTextInputFormatter.digitsOnly
            //           ], // Only numbers can be entered
            //         ),
            //       ],
            //     )),
            const SizedBox(height: 20),
            Align(
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Gender",
                  //babel text
                  hintText: "Enter your gender",
                  //hint text
                  prefixIcon: Icon(Icons.transgender),
                  //prefix iocn
                  hintStyle:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  //hint text style
                  labelStyle: TextStyle(
                      fontSize: 18, color: Colors.black), //label style
                ),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Birthday",
                  //babel text
                  hintText: "Enter your birthdat",
                  //hint text
                  prefixIcon: Icon(Icons.cake),
                  //prefix iocn
                  hintStyle:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  //hint text style
                  labelStyle: TextStyle(
                      fontSize: 18, color: Colors.black), //label style
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
