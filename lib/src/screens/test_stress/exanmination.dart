import 'package:flutter/material.dart';
import '../../constant.dart';
import '../../constant.dart';
import '../../constant.dart';

// Map<int, bool> buttons = {
//   0: false,
//   1: false,
//   2: false,
//   3: false,
//   4: false,
// };

class Examination extends StatefulWidget {
  const Examination({Key? key}) : super(key: key);

  @override
  State<Examination> createState() => _ExaminationState();
}

Color _colorContainer = Color.fromARGB(255, 122, 170, 175);

class _ExaminationState extends State<Examination> {
  //Color color = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "แบบทดสอบความเครียด",
          style: TextStyle(
              fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                // color: Colors.lightBlue,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 40),
                  child: Center(
                    child: SizedBox(
                      height: 50,
                      child: Text(
                        "ในช่วง 2 สัปดาห์ที่ผ่านมารวมทั้งวันนี้\n "
                        "ท่านมีอาการเหล่านี้บ่อยแค่ไหน",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(height: 1, thickness: 1),
              Stack(
                children: [
                  const Align(
                    alignment: AlignmentDirectional(0.6, -1),
                    child: Padding(
                      padding: EdgeInsets.only(top: 110),
                    ),
                  ),
                  Column(
                    children: [
                      Stack(
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    color: backgroundColor2,
                                    border: Border.all(
                                        color: const Color.fromRGBO(
                                            207, 229, 225, 1),
                                        width: 5)),
                                child: Column(
                                  children: [
                                    Center(
                                      child: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                    Text(
                                      "8. พูดช้า ทำอะไรช้าลง จนคนอื่นสังเกตเห็นได้ ",
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    Text("หรือกระสับกระส่าาย "),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    Text(
                                      "ไม่สามารถอยู่นิ่งได้เหมือนที่เคย",
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.035,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Material(
                                      child: Ink(
                                        child: InkWell(
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.08,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(20)),
                                              color: _colorContainer,
                                              border: Border.all(
                                                  color: Color.fromARGB(
                                                      255, 122, 170, 175),
                                                  width: 5),
                                            ),
                                            child: Center(
                                              child: Text("ไม่มีเลย"),
                                            ),
                                            //color: _colorContainer,
                                          ),
                                          onTap: () {
                                            setState(
                                              () {
                                                _colorContainer =
                                                    _colorContainer ==
                                                            Colors.white
                                                        ? Color.fromARGB(
                                                            255, 122, 170, 175)
                                                        : Colors.white;
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Material(
                                  child: Ink(
                                    child: InkWell(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.08,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20)),
                                          color: _colorContainer,
                                          border: Border.all(
                                              color: Color.fromARGB(
                                                  255, 122, 170, 175),
                                              width: 5),
                                        ),
                                        child: Center(
                                          child: Text("ไม่มีเลย"),
                                        ),
                                        //color: _colorContainer,
                                      ),
                                      onTap: () {
                                        setState(
                                          () {
                                            _colorContainer =
                                                _colorContainer == Colors.white
                                                    ? Color.fromARGB(
                                                        255, 122, 170, 175)
                                                    : Colors.white;
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Material(
                                      child: Ink(
                                        child: InkWell(
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.08,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(20)),
                                              color: _colorContainer,
                                              border: Border.all(
                                                  color: Color.fromARGB(
                                                      255, 122, 170, 175),
                                                  width: 5),
                                            ),
                                            child: Center(
                                              child: Text("ไม่มีเลย"),
                                            ),
                                            //color: _colorContainer,
                                          ),
                                          onTap: () {
                                            setState(
                                              () {
                                                _colorContainer =
                                                    _colorContainer ==
                                                            Colors.white
                                                        ? Color.fromARGB(
                                                            255, 122, 170, 175)
                                                        : Colors.white;
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Material(
                                  child: Ink(
                                    child: InkWell(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.08,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20)),
                                          color: _colorContainer,
                                          border: Border.all(
                                              color: Color.fromARGB(
                                                  255, 122, 170, 175),
                                              width: 5),
                                        ),
                                        child: Center(
                                          child: Text("ไม่มีเลย"),
                                        ),
                                        //color: _colorContainer,
                                      ),
                                      onTap: () {
                                        setState(
                                          () {
                                            _colorContainer =
                                                _colorContainer == Colors.white
                                                    ? Color.fromARGB(
                                                        255, 122, 170, 175)
                                                    : Colors.white;
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: primaryColor,
                            minimumSize: const Size(87, 41),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))
                            // fixedSize: Size.fromHeight(30)
                            ),
                        child: const Text(
                          "ต่อไป",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Stack(
                        children: [
                          Image.asset(
                            'assets/images/Exam.png',
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.19,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
