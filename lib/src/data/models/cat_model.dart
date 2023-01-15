import 'package:flutter/material.dart';
import 'package:jitd_client/src/constant.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).devicePixelRatio*8,
                    left: MediaQuery.of(context).devicePixelRatio*6),
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
