import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jitd_client/src/blocs/pet/petBloc.dart';
import 'package:jitd_client/src/screens/tutorials/TutorialPage3.dart';
import 'package:jitd_client/src/screens/tutorials/TutorialPage5.dart';
import 'package:rive/rive.dart';

import '../../constant.dart';
import '../../ui/DialogMessage.dart';

class TutorialPage2 extends StatefulWidget {
  const TutorialPage2({Key? key}) : super(key: key);

  @override
  State<TutorialPage2> createState() => _TutorialPage2State();
}

class _TutorialPage2State extends State<TutorialPage2> {


  TextEditingController? textController;
  @override
  void initState() {
    super.initState();
    textController = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
        // resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: primaryColorSubtle,
          elevation: 0,
        ),
        backgroundColor: secondaryColor,
        body: BlocProvider(
          create: (_) => petBloc(),
          child: BlocListener<petBloc, petState>(
            listener: (BuildContext context, state) {
              if (state is LoadedNamingPet) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TutorialPage3()));
              }
              else if (state is ErrorNamingPet) {
                showDialog(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (context) {
                      return DialogMessage(
                          title: "กรุณาตั้งชื่อสัตว์เลี้ยงของคุณ", desc: "คุณต้องตั้งชื่อสัตว์เลี้ยงของคุณก่อนกดปุ่มถัดไป");
                      // return DialogMessage(message: message);
                    });
              } else{}
            },
              child: SafeArea(
                  child: Stack(
                    children: [
                      /// top-content
                      Container(
                        height: MediaQuery.of(context).size.height * 0.54,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(50),
                                bottomRight: Radius.circular(50)),
                            color: primaryColorSubtle),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              /// JIT:D label
                              SizedBox(
                                  //color: Colors.green,
                                  height: MediaQuery.of(context).size.height * 0.1,
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    child: Text("JIT :D",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 64,
                                            fontWeight: FontWeight.bold)),
                                  )),


                              Expanded(
                                child: Stack(
                                  children: [
                                    /// content backgrround
                                    // if (!isKeyboard)
                                    Align(
                                      alignment: const Alignment(0, -0.8),
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal:
                                                MediaQuery.of(context).size.height *
                                                    0.03),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(30),
                                            color: Colors.white),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical:
                                                  MediaQuery.of(context).size.height *
                                                      0.02,
                                              horizontal:
                                                  MediaQuery.of(context).size.width *
                                                      0.05),
                                          child: RichText(
                                            textAlign: TextAlign.center,
                                            text: const TextSpan(
                                                text:
                                                    "สวัสดีคนที่น่ารัก ยินดีต้อนรับครับ!!!เราเป็น สัตว์เลี้ยงของคุณ ที่จะอยู่เคียงข้างคุณตราบนานแสนนานวันนี้เจอปัญหามาหนักมากใช่ไหม มาระบายกับเราสิเราสัญญาว่าจะฟังอย่างตั้งใจเลยอยากเล่าให้เราฟังแล้วใช่ไหมล่ะ แต่มากอดก่อนเล่าเร็ว",
                                                style: TextStyle(
                                                    fontSize: 16, color: textColor1)),
                                          ),
                                        ),
                                      ),
                                    ),

                                    if(!isKeyboard)/// Bear
                                    Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                              // color: Colors.amber,
                                              height:
                                                  MediaQuery.of(context).size.height *
                                                      0.23,
                                              width: MediaQuery.of(context).size.width *
                                                  0.6,
                                              child: const RiveAnimation.asset(
                                                  "assets/images/login_screen_character.riv",
                                                  fit: BoxFit.cover,
                                                  animations: ['idle'])),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // if(!isKeyboard)
                      const Align(
                        alignment: Alignment(0, 0.37),
                        child: Text("ตั้งชื่อผมน่ารักๆ เท่ากับตัวคุณเลยนะ :)", style: TextStyle(fontSize: 16, color: backgroundColor3, fontWeight: FontWeight.w600),),
                      ),

                      Align(
                        alignment: const Alignment(0, 0.55),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: MediaQuery.of(context).size.height * 0.02,
                              horizontal: MediaQuery.of(context).size.width * 0.08),
                          child: TextField(
                            controller: textController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 3,
                                  )),
                              filled: true,
                              fillColor: Colors.white,
                              //contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                            ),
                          ),
                        ),
                      ),

                      if (!isKeyboard)
                      Align(
                        alignment: const Alignment(0, 0.65),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // cucle 1
                            _curcle_page(thirterydColor),
                            const SizedBox(width: 10),
                            // cucle 1
                            _curcle_page(thirterydColor),
                            const SizedBox(width: 10),
                            // cucle 1
                            _curcle_page(Colors.white70),
                            const SizedBox(width: 10),
                            // cucle 1
                            _curcle_page(Colors.white70),
                          ],
                        ),
                      ),

                      Align(
                        alignment: const Alignment(0, 0.85),
                        child: BlocBuilder<petBloc, petState>(
                          builder: (context, state) {
                            if(state is LoadingNamingPet){
                              return ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      primary: thirterydColor,
                                      minimumSize: const Size(100, 40),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5))
                                    // fixedSize: Size.fromHeight(30)
                                  ),
                                  child: const CircularProgressIndicator(color: Colors.white70));
                            }
                            else{
                              return ElevatedButton(
                                  onPressed: () {
                                    context.read<petBloc>().add(
                                        NamingPetEvent(
                                          textController?.text));
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: thirterydColor,
                                      minimumSize: const Size(100, 40),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5))
                                    // fixedSize: Size.fromHeight(30)
                                  ),
                                  child: const Text("ถัดไป",
                                      style: TextStyle(fontWeight: FontWeight.bold)));
                            }
                          }
                        ),
                      ),
                    ],
                  ),
              )
          )
          ),
        );
  }

  /// curcle-page
  Container _curcle_page(Color colorData) {
    return Container(
      height: 15,
      width: 15,
      decoration:
          BoxDecoration(color: colorData, shape: BoxShape.circle, boxShadow: [
        BoxShadow(color: Colors.black12, offset: Offset(0, 3), blurRadius: 4)
      ]),
      // decoration:
    );
  }
}
