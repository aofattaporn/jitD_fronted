import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';

class ConsultantLevel extends StatefulWidget {
  const ConsultantLevel({Key? key}) : super(key: key);

  @override
  State<ConsultantLevel> createState() => _ConsultantLevelState();
}

class _ConsultantLevelState extends State<ConsultantLevel> {
  int _selectedLevel = 0;

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
                          onPressed: () {
                            Navigator.pop(context);
                          },
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
                        alignment: AlignmentDirectional(-0.9, -0.8),
                        child: Text(
                          'แก้ไขระดับ',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: textColor3),
                        ),
                      ),
                      const Align(
                        alignment: AlignmentDirectional(-0.75, -0.7),
                        child: Text(
                          'ผู้ให้คำปรึกษาที่เห็นโพสได้',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Align(
                          alignment: AlignmentDirectional(0, -0.45),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.12,
                            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2, color: primaryColorLight),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Text(
                              'การเลือกระดับผู้ให้คำปรึกษาที่เห็นโพสจะเป็นตัวช่วยในการคัดกรองผู้ที่จะเข้ามาคอมเมนต์ในโพสของคุณให้มีประสิทธิภาพมากยิ่งขึ้นโดยระดับของผู้ให้คำปรึกษาจะมีคุณภาพมากขึ้นตามลำดับ',
                              style: TextStyle(
                                  color: textColor3,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      Container(
                        color: Colors.transparent,
                        child: Padding(
                          padding: EdgeInsets.only(top: 290),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(),
                              ListTile(
                                title: Text('ระดับที่ 0'),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                          (states) => thirteryColorLight),
                                  value: 0,
                                  groupValue: _selectedLevel,
                                  onChanged: (int? value) {
                                    setState(() {
                                      _selectedLevel = value!;
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: Text('ระดับที่ 1'),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                          (states) => thirteryColorLight),
                                  value: 1,
                                  groupValue: _selectedLevel,
                                  onChanged: (int? value) {
                                    setState(() {
                                      _selectedLevel = value!;
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: Text('ระดับที่ 2'),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                          (states) => thirteryColorLight),
                                  value: 2,
                                  groupValue: _selectedLevel,
                                  onChanged: (int? value) {
                                    setState(() {
                                      _selectedLevel = value!;
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  'ระดับที่ 3',
                                  style: TextStyle(
                                      color: textColor1, fontSize: 16),
                                ),
                                leading: Radio(
                                  fillColor: MaterialStateColor.resolveWith(
                                          (states) => thirteryColorLight),
                                  value: 3,
                                  groupValue: _selectedLevel,
                                  onChanged: (int? value) {
                                    setState(() {
                                      _selectedLevel = value!;
                                    });
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
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
