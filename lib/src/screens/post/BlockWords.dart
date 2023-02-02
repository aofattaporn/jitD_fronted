import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../blocs/post/post_bloc.dart';
import '../../constant.dart';

class BlockWords extends StatefulWidget {
  const BlockWords({Key? key}) : super(key: key);

  @override
  BlockWordsState createState() => BlockWordsState();
}

class BlockWordsState extends State<BlockWords> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      // resizeToAvoidBottomInset: false,

      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: const AlignmentDirectional(0, 1),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.85,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: Stack(
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(1, -0.95),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 16),
                              padding:
                                  const EdgeInsets.fromLTRB(32, 10, 32, 10),
                              // backgroundColor: thirterydColor,
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                              )),
                          child: const Text("ยืนยัน"),
                        ),
                      ),
                      Align(
                          alignment: AlignmentDirectional(-1, -0.95),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () {
                              print("Testing");
                              Navigator.pop(context);
                            },
                          )),

                      const Align(
                        alignment: AlignmentDirectional(-0.75, -0.8),
                        child: Text(
                          'แก้ไขคำที่ต้องการบล็อค',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, -0.65),
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2,
                                    offset: Offset(2, 4))
                              ],
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.transparent)),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: TextField(
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromARGB(255, 179, 179, 179)),
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                // border: InputBorder.none,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide.none),
                                prefixIcon: Icon(Icons.search),
                                labelText: ("ค้นหาประเภทได้เลย!"),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
