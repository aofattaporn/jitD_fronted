import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';

class SignIn_CT extends StatefulWidget {
  const SignIn_CT({Key? key}) : super(key: key);

  @override
  SignInState createState() => SignInState();
}

class SignInState extends State<SignIn_CT> {
  TextEditingController? emailController;
  TextEditingController? passwordController;
  late bool passwordVisibility;
  final _unFocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  void dispose() {
    _unFocusNode.dispose();
    emailController?.dispose();
    passwordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unFocusNode),
      child: SafeArea(
        child: Stack(
            children: [
              // Image.asset(
              //   'assets/images/background.png',
              //   width: MediaQuery.of(context).size.width,
              //   height: MediaQuery.of(context).size.height * 1,
              //   fit: BoxFit.cover,
              // ),
              Container(
                color: Colors.white,
                child: Align(

                  alignment: Alignment.center,
                  child: Column(

                    children: <Widget>[
                      SizedBox(height: 80),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Sign Up",
                            style: TextStyle(
                              fontFamily: 'Lato',
                              color: Color(0xFFAAD4CC),
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Container(
                        color: Colors.amber,
                        child: Column(
                          children: [
                            // InputField_custom(0, emailController!, false,
                            //     'Email', Icons.email, null),
                            // InputField_custom(
                            //     -0.4,
                            //     passwordController!,
                            //     !passwordVisibility,
                            //     'Password',
                            //     Icons.lock,
                            //     SuffixIcon(passwordVisibility)),
                            // Padding(
                            //   padding: const EdgeInsets.symmetric(
                            //       vertical: 0, horizontal: 30),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.end,
                            //     children: [
                            //       TextButton(
                            //           onPressed: () {},
                            //           child: const Text("Forgget password?",
                            //               style: TextStyle(color: textColor3))),
                            //     ],
                            //   ),
                            // ),



                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
  }

  Padding Button_3Party(String imgURL) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8.0),
      child: Image.asset(
        imgURL,
        width: 40,
        height: 40,
        fit: BoxFit.cover,
      ),
    );
  }

  Align InputField_custom(double align, TextEditingController controller,
      bool obcuretxt, String hitntxt, IconData icons, InkWell? inkWell) {
    return Align(
      alignment: AlignmentDirectional(0, align),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 35),
        child: TextFormField(
          validator: (value) {
            if (value?.isEmpty != true) {
              return null;
            } else {
              return 'Please add text';
            }
          },
          controller: controller,
          obscureText: obcuretxt,
          decoration: InputDecoration(
              isDense: true,
              hintText: hitntxt,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xFF7FD4C5),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: primaryColorDark,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: statusColorError,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0x00000000),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: Icon(
                icons,
                color: Color(0xFF3F4247),
              ),
              suffixIcon: inkWell),
          style: const TextStyle(
            fontFamily: 'Lato',
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  InkWell SuffixIcon(bool passwordVisibility) {
    return InkWell(
      onTap: () => setState(() => {passwordVisibility = !passwordVisibility}),
      focusNode: FocusNode(skipTraversal: true),
      child: Icon(
        passwordVisibility
            ? Icons.visibility_outlined
            : Icons.visibility_off_outlined,
        color: const Color(0xFF757575),
        size: 22,
      ),
    );
  }
}
