import 'package:flutter/material.dart';
import 'package:jitd_client/src/constant.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(top: 110,left: 20),
                child: ElevatedButton(
                  child: Text('การงาน'),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: primaryColor,
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
        ],
      ),
    );
  }
}
