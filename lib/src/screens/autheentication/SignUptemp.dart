import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jitd_client/src/blocs/authentication/authen_bloc.dart';
import 'package:jitd_client/src/blocs/authentication/authen_state.dart';
import 'package:jitd_client/src/constant.dart';

import 'SignUp.dart';

class SignUpTemp extends StatefulWidget {
  const SignUpTemp({Key? key}) : super(key: key);

  @override
  SignUpTempState createState() => SignUpTempState();
}

class SignUpTempState extends State<SignUpTemp> {
  TextEditingController? emailController;
  TextEditingController? passwordController;
  late bool passwordVisibility1;
  TextEditingController? passwordConfirmController;
  late bool passwordVisibility2;
  TextEditingController? phoneController;
  final _unFocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _fromKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility1 = false;
    passwordConfirmController = TextEditingController();
    passwordVisibility2 = false;
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    emailController?.dispose();
    passwordController?.dispose();
    passwordConfirmController?.dispose();
    phoneController?.dispose();
    _unFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      key: scaffoldKey,
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (_) => AuthenticationBloc(),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unFocusNode),
          child: Stack(
            children: [
              /// Background
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Image.asset(
                  'assets/images/background.png',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1,
                  fit: BoxFit.cover,
                ),
              ),

              /// Header
              BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (context, state) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(top: 160),
                      // const EdgeInsetsDirectional.fromSTEB(0, 120, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: const [
                          Expanded(
                            child: Text(
                              'Sign',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontFamily: 'Lato',
                                // color: Color(0xFFAAD4CC),
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '  Up',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                color: Color(0xFF7AAAAF),
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          /// FORM
                          Form(
                              key: _fromKey,
                              child: Column(
                                children: [
                                  /// InputField 1  (Email)
                                  InputField_custom(0, emailController!, false,
                                      'Email', Icons.email, null),

                                  /// InputField 1  (Email)
                                  InputField_custom(
                                      -0.4,
                                      passwordController!,
                                      !passwordVisibility1,
                                      'Password',
                                      Icons.lock,
                                      _suffixIcon("passwordVisibility1",
                                          passwordVisibility1)),

                                  /// InputField 3  (Password Confirm)
                                  InputField_custom(
                                      -0.25,
                                      passwordConfirmController!,
                                      !passwordVisibility2,
                                      'Confirm Password',
                                      Icons.lock,
                                      _suffixIcon("passwordVisibility2",
                                          passwordVisibility2)),

                                  /// InputField 4  (Phone)
                                  InputField_custom(-0.1, phoneController!,
                                      false, 'Phone Number', Icons.phone, null),
                                ],
                              )),

                          /// Button
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Align(
                              alignment: const AlignmentDirectional(0, 0.23),
                              child: TextButton(
                                onPressed: () {
                                  if (_fromKey.currentState?.validate() ==
                                          true &&
                                      _checkFormFill() == true) {
                                    print("_checkFormFill() == true");
                                    // Some Event here
                                    // Map<String, dynamic> dataSignIn = {
                                    //   "Email": emailController?.text,
                                    //   "Password": passwordController?.text,
                                    //   "PasswordCF":
                                    //       passwordConfirmController?.text,
                                    //   "Phone": phoneController?.text
                                    // };
                                    //
                                    // context
                                    //     .read<AuthenticationBloc>()
                                    //     .add(SignUpEvent(dataSignIn));
                                  } else {
                                    print("_checkFormFill() == false");

                                    print("Empty");
                                  }
                                },
                                style: TextButton.styleFrom(
                                    backgroundColor: (_checkFormFill() != true)
                                        ? thirterydColor
                                        : thirteryColorSubtle,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 36, vertical: 16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const Center(
                            child: Text("or"),
                          ),

                          /// Show Sign up using
                          const Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 15.0),
                              child: Text(
                                'Sign up using social networks',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  color: Color(0xFF818181),
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),

                          /// 3 party
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Button_3Party(
                                      'assets/images/facebook_icon.png'),
                                  Button_3Party(
                                      'assets/images/twitter_icon.png'),
                                  Button_3Party(
                                      'assets/images/google_icon.png'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Already have an account ?',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    color: Color(0xFF818181),
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      5, 0, 0, 0),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                const SignUpCustom()),
                                      );
                                    },
                                    child: const Text(
                                      'Sign in here',
                                      style: TextStyle(
                                        fontFamily: 'Lato',
                                        color: thirterydColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }),
            ],
          ),
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
              print("sssssssssssssss");
              if (passwordController?.text.toString().trim() !=
                  passwordController?.text.toString().trim()) {
                return "Please type password again";
              } else {
                return "eqiula";
              }
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

  InkWell _suffixIcon(String fag, bool passwordVisibility) {
    return InkWell(
      onTap: () => setState(() => {
            if (fag == "passwordVisibility1")
              {passwordVisibility1 = !passwordVisibility1}
            else if (fag == "passwordVisibility2")
              {passwordVisibility2 = !passwordVisibility2}
          }),
      focusNode: FocusNode(skipTraversal: true),
      child: Icon(
        passwordVisibility == passwordVisibility1
            ? passwordVisibility1
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined
            : passwordVisibility2
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
        color: const Color(0xFF757575),
        size: 22,
      ),
    );
  }

  bool? _checkFormFill() {
    if (emailController?.text.toString().trim().isEmpty == true ||
        passwordController?.text.toString().trim().isEmpty == true ||
        passwordConfirmController?.text.toString().trim().isEmpty == true) {
      return false;
    } else {
      print("case1 ");
      return true;
    }
  }
}
