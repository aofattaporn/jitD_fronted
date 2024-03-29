import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jitd_client/src/BottomNavigationWidget.dart';
import 'package:jitd_client/src/blocs/authentication/authen_bloc.dart';
import 'package:jitd_client/src/blocs/authentication/authen_state.dart';
import 'package:jitd_client/src/constant.dart';
import 'package:jitd_client/src/screens/tutorials/TutorialPage1.dart';

import '../../blocs/authentication/authen_event.dart';
import '../../ui/DialogMessage.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  TextEditingController? emailController;
  TextEditingController? passwordController;
  late bool passwordVisibility1;
  TextEditingController? passwordConfirmController;
  late bool passwordVisibility2;
  TextEditingController? phoneController;
  final _unFocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // listData = []
    // get data backend
    // listData = [Data]
    emailController = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
    passwordController = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
    passwordVisibility1 = false;
    passwordConfirmController = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
    passwordVisibility2 = false;
    phoneController = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
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
      extendBodyBehindAppBar: false,
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
                  Center(
                    child: Image.asset(
                      'assets/images/background.png',
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 1,
                      fit: BoxFit.cover,
                    ),
                  ),

                  /// Checking BlocListener + Sign Up content
                  BlocListener<AuthenticationBloc, AuthenticationState>(
                    listener: (context, state) {
                      // Case SignUp Loaded
                      if (state is SignUpLoadedState ||
                          state is SigUp3PartySuccess) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const TutorialPage1()),
                            (Route route) => false);
                      } else if (state is SigIn3PartySuccess) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            CupertinoPageRoute(
                                builder: (context) =>
                                    const BottomNavigationWidget()),
                            (Route route) => false);
                      } else if (state is AuthenUpError) {
                        showDialog(
                            context: context,
                            barrierDismissible: false, // user must tap button!
                            builder: (context) {
                              return DialogMessage(
                                  title: state.err_msg, desc: state.err_desc);
                              // return DialogMessage(messag: message);
                            });
                      } else {}
                    },
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(top: 160),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
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
                      Form(
                          child: Expanded(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //   // FORM
                              _formAuth(emailController, false, "Email",
                                  Icons.email, null),
                              _formAuth(
                                  passwordController,
                                  !passwordVisibility1,
                                  "Password",
                                  Icons.lock,
                                  _suffixIcon("passwordVisibility1",
                                      passwordVisibility1)),
                              _formAuth(
                                  passwordConfirmController,
                                  !passwordVisibility2,
                                  "Password Confirm",
                                  Icons.lock,
                                  _suffixIcon("passwordVisibility2",
                                      passwordVisibility2)),

                              ///  Button
                              _buttonSubmit(context),
                            ],
                          ),
                        ),
                      )),
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Center(
                            child: Text("or"),
                          ),

                          // Show Sign up using
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

                          // 3 party
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 1),
                              child: BlocBuilder<AuthenticationBloc,
                                      AuthenticationState>(
                                  builder: (context, state) {
                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _button3Party(context, SignIngoogle(),
                                        "assets/images/google_icon.png"),
                                  ],
                                );
                              }),
                            ),
                          ),
                          Align(
                              alignment: Alignment.center,
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
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              5, 0, 0, 0),
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
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
                              ))
                        ],
                      ))
                    ]),
                  ),

                  Align(
                    alignment: const AlignmentDirectional(-1.01, 1.01),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: const BoxDecoration(
                        color: Color(0xFFAAD4CC),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 10, 0, 0),
                                child: Text(
                                  'What is JIT :D ?',
                                  style: GoogleFonts.getFont(
                                    'Lato',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 36,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0, -0.05),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      5, 30, 5, 0),
                                  child: RichText(
                                    text: const TextSpan(
                                      text: 'เป็นแอปพลิเคชันสำหรับ',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 16),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text:
                                              ' ผู้ที่ต้องการระบายความเครียด\n',
                                          style: TextStyle(
                                              color: thirterydColor,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 16),
                                        ),
                                        TextSpan(
                                          text: 'หรือ',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 16),
                                        ),
                                        TextSpan(
                                          text: ' ผู้ที่ต้องการให้คำปรึกษา ',
                                          style: TextStyle(
                                              color: thirterydColor,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 16),
                                        ),
                                        TextSpan(
                                          text: 'กับกลุ่มผู้ที่มีความเครียด',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ))
          // ),
          ),
    );
  }

  ElevatedButton _button3Party(
      BuildContext context, AuthenticationEvent authEvent, String urlLogo) {
    return ElevatedButton(
      onPressed: () {
        context.read<AuthenticationBloc>().add(authEvent);
      },
      style: ElevatedButton.styleFrom(
          primary: backgroundColor3,
          minimumSize: Size(MediaQuery.of(context).size.width * 0.8,
              MediaQuery.of(context).size.height * 0.05),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          shadowColor: Colors.black45,
          elevation: 5.0),
      child: Row(
        children: [
          Image.asset(
            urlLogo,
            width: 30,
            height: 30,
            fit: BoxFit.cover,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child:
                Text("SignIn with Google", style: TextStyle(color: textColor3)),
          )
        ],
      ),
      // fixedSize: Size.fromHeight(30)
    );
  }

  Padding _buttonSubmit(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 120),
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
          if (state is AuthenCheckingState) {
            return ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 24),
                    minimumSize: const Size.fromHeight(52),
                    primary: thirterydColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )),
                child: const CircularProgressIndicator(color: Colors.white70));
          } else {
            return ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() &&
                      _checkFormFill() == true) {
                    Map<String, dynamic> dataSignIn = {
                      "Email": emailController?.text,
                      "Password": passwordController?.text,
                      "PasswordCF": passwordConfirmController?.text,
                      "Phone": phoneController?.text
                    };

                    context
                        .read<AuthenticationBloc>()
                        .add(SignUpEvent(dataSignIn));
                  }
                },
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    minimumSize: const Size.fromHeight(52),
                    elevation: (_checkFormFill() == true) ? 5 : 0,
                    primary: (_checkFormFill() == true)
                        ? thirterydColor
                        : thirteryColorSubtle,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )),
                child: const Text("Sign Up"));
          }
        }));
  }

  Padding _formAuth(TextEditingController? controller, bool obcuretxt,
      String hint, IconData iconData, InkWell? inkwell) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
        child: TextFormField(
          validator: (value) {
            if (value!.isEmpty == false && hint == "Email") {
              final emailPattern = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
              if (emailPattern.hasMatch(value)) {
                return null;
              } else {
                return "Email not format";
              }
            } else if (value.isEmpty == false && hint == "Password") {
              if (value.length >= 6) {
                return null;
              } else {
                return "Password must more 6";
              }
            } else if (value.isEmpty == false && hint == "Password Confirm") {
              if (value.length >= 6) {
                return null;
              } else {
                return "Password must more 6";
              }
            }
            return null;
          },
          controller: controller,
          obscureText: obcuretxt,
          decoration: InputDecoration(
              isDense: true,
              label: Text(hint, style: const TextStyle(color: textColor3)),
              hintText: hint,
              enabledBorder: statusBorder(primaryColor),
              focusedBorder: statusBorder(primaryColorDark),
              errorBorder: statusBorder(statusColorError),
              focusedErrorBorder: statusBorder(primaryColorDark),
              prefixIcon: Icon(
                iconData,
                color: const Color(0xFF3F4247),
              ),
              suffixIcon: inkwell),
          style: const TextStyle(
            fontFamily: 'Lato',
            fontSize: 16,
          ),
        ));
  }

  OutlineInputBorder statusBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }

  bool? _checkFormFill() {
    if (emailController?.text.toString().trim().isEmpty == true ||
            passwordController?.text.toString().trim().isEmpty == true ||
            passwordConfirmController?.text.toString().trim().isEmpty == true
        // phoneController?.text.toString().trim().isEmpty == false
        ) {
      return false;
    } else {
      return true;
    }
  }

  InkWell _suffixIcon(String fag, bool passwordVisibility) {
    return InkWell(
      onTap: () => setState(() => {
            if (fag == "passwordVisibility1")
              {
                print(passwordVisibility1),
                passwordVisibility1 = !passwordVisibility1
              }
            else if (fag == "passwordVisibility2")
              {passwordVisibility2 = !passwordVisibility2}
          }),
      focusNode: FocusNode(skipTraversal: false),
      child: Icon(
        fag == "passwordVisibility1"
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
}
