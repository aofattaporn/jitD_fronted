import 'package:flutter/material.dart';
import 'package:jitd_client/src/constant.dart';

class CategoryBox extends StatelessWidget {
  const CategoryBox({super.key});

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
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: primaryColor,
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('การงาน'),
                ),
              ),
        ],
      ),
    );
  }
}
