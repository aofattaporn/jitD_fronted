import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Setting_setting.dart';

class Setting_account extends StatefulWidget {
  const Setting_account({Key? key}) : super(key: key);

  @override
  State<Setting_account> createState() => _Setting_accountState();
}

class _Setting_accountState extends State<Setting_account> {
  bool valNotify1 = true;
  bool valNotify2 = false;
  bool valNotify3 = false;

  onChangeFunction1(bool newValue1) {
    setState(() {
      valNotify1 = newValue1;
    });
  }

  onChangeFunction2(bool newValue2) {
    setState(() {
      valNotify2 = newValue2;
    });
  }
  onChangeFunction3(bool newValue3) {
    setState(() {
      valNotify3 = newValue3;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white ,
        centerTitle: true,
        title: const Text("บัญชี", style: TextStyle(fontSize: 16,
            color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context,
                MaterialPageRoute(builder: (context) => Setting_setting()));
          },
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
            SizedBox(height: 40),
            Row(
              children: [
                Row(
                  children: [

                    SizedBox(width: 10),
                    Text("ข้อมูลส่วนตัว", style: TextStyle(fontSize: 16)),
                  ],
                ),
                Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            SizedBox(height: 40),
            Row(
              children: [
                Row(
                  children: [

                    SizedBox(width: 10),
                    Text("เปลี่ยนรหัสผ่าน", style: TextStyle(fontSize: 16)),
                  ],
                ),
                Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            SizedBox(height: 40),
            Row(
              children: [
                Row(
                  children: [

                    SizedBox(width: 10),
                    Text("ลบบัญชี", style: TextStyle(fontSize: 16)),
                  ],
                ),
                Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            const Divider(height: 20, thickness: 1),
            const SizedBox(height: 10),
            // buildNotificationOption("Theme Dark", valNotify1, onChangeFunction1),
            // buildNotificationOption("Account Active", valNotify2, onChangeFunction2),
            // buildNotificationOption("Opportunity", valNotify3, onChangeFunction3),
            SizedBox(height: 50),
            Center(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                  onPressed: () {},
                  child: Text("ออกจากระบบ", style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 2.2,
                      color: Color.fromARGB(255, 255, 76, 76)
                  )),
                ))
          ],
        ),
      ),
    );
  }

  Padding buildNotificationOption(String title, bool value, Function onChangeMethod){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.grey
          )),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              activeColor: Colors.blue,
              trackColor: Colors.grey,
              value: value,
              onChanged: (bool newValue){
                onChangeMethod(newValue);
              },
            ),
          )
        ],
      ),
    );
  }

  GestureDetector buildAccountOption(BuildContext context, String title) {
    return GestureDetector(
      onTap: (){
        showDialog(context: context, builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text("Option 1"),
                Text("Option 2")
              ],
            ),
            actions: [
              TextButton(onPressed: () {
                Navigator.of(context).pop();
              },
                  child: Text("Close")
              )
            ],
          );
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600]
            )),
            Icon(Icons.arrow_forward_ios, color: Colors.grey,)
          ],
        ),
      ),
    );
  }

}
