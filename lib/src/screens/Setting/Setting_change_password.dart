import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Setting_change_password extends StatefulWidget {
  const Setting_change_password({Key? key}) : super(key: key);

  @override
  State<Setting_change_password> createState() =>
      _Setting_change_passwordState();
}

class _Setting_change_passwordState extends State<Setting_change_password> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "เปลี่ยนรหัสผ่าน",
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 30),
          Align(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                obscureText: true,
                /* ... */
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  hintText: 'รหัสผ่านปัจจุบัน',
                  prefixIcon: Icon(Icons.key),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              obscureText: true,
              /* ... */
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                hintText: 'รหัสผ่านใหม่',
                prefixIcon: Icon(Icons.key_off_outlined),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                hintText: 'รหัสผ่านใหม่อีกคร้ัง',
                prefixIcon: Icon(Icons.key_off_outlined),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                hintText: 'รหัสผ่านใหม่อีกคร้ัง',
                prefixIcon: Icon(Icons.key_off_outlined),
              ),
            ),
          ),
          SizedBox(width: 20, height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(const Size(200, 40)),
                backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 255, 180, 77)),
              ),
              child: const Text('อัพเดตรหัสผ่าน'),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(const Size(200, 40)),
                backgroundColor: MaterialStateProperty.all(Colors.white54),
              ),
              child: const Text(
                'ยกเลิก',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          Center(
            child: TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(color: Colors.black12, fontSize: 15),
              ),
              onPressed: null,
              child: const Text('ลืมรหัสผ่าน'),
            ),
          ),
        ],
      ),
    );
  }
}

