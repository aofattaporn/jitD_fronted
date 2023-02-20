import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../BottomNavigationWidget.dart';
import '../../blocs/authentication/authen_bloc.dart';
import '../../blocs/authentication/authen_event.dart';
import '../../blocs/authentication/authen_state.dart';
import '../../constant.dart';
import '../../ui/DialogMessage.dart';
import 'SignUp.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  SignInState createState() => SignInState();
}

class SignInState extends State<SignIn> {
  TextEditingController? emailController;
  TextEditingController? passwordController;
  late bool passwordVisibility;
  final _unFocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
    passwordController = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
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
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      key: scaffoldKey,
      body: BlocProvider(
        create: (_) => AuthenticationBloc(),
        child: BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (BuildContext context, state) {
            // Case SignUp Loaded
            if (state is SignUpLoadedState || state is SigUp3PartySuccess) {
              Navigator.pushAndRemoveUntil(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => const BottomNavigationWidget()),
                  (Route route) => false);
            } else if (state is SigIn3PartySuccess) {
              Navigator.pushAndRemoveUntil(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => const BottomNavigationWidget()),
                  (Route route) => false);
            } else if (state is AuthenUpError) {
              showDialog(
                  context: context,
                  barrierDismissible: false, // user must tap button!
                  builder: (context) {
                    return DialogMessage(
                        title: state.err_msg, desc: state.err_desc);
                    // return DialogMessage(message: message);
                  });
            } else {}
          },
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unFocusNode),
            child: Stack(
              children: [
                /// background image
                Image.asset(
                  'assets/images/background.png',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1,
                  fit: BoxFit.cover,
                ),

                /// label sign in and sign up
                Align(
                  alignment: const AlignmentDirectional(0, -0.60),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sign',
                        style: GoogleFonts.getFont(
                          'Lato',
                          color: const Color(0xFFAAD4CC),
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: Text(
                          'In',
                          style: GoogleFonts.getFont(
                            'Lato',
                            color: const Color(0xFF7AAAAF),
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                /// Form
                Align(
                  alignment: const AlignmentDirectional(0, -0.40),
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.28),
                      child: Column(
                        children: [
                          //  FORM
                          Align(
                            child: _formAuth(emailController, false, "Email",
                                Icons.email, null),
                          ),

                          Align(
                              child: _formAuth(
                                  passwordController,
                                  !passwordVisibility,
                                  "Password",
                                  Icons.lock,
                                  _suffixIcon())),

                          /// forget password
                          Align(
                            alignment: const AlignmentDirectional(0.74, -0.08),
                            child: Text(
                              'Forgot password ?',
                              style: GoogleFonts.getFont(
                                'Lato',
                                color: const Color(0xFF818181),
                                fontSize: 14,
                              ),
                            ),
                          ),

                          // Button
                          Align(
                            alignment: const AlignmentDirectional(0, 0.05),
                            child: _buttonSubmit(context),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                /// or text
                Align(
                  alignment: const AlignmentDirectional(0, 0.3),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: const [
                        Divider(
                          thickness: 3,
                          color: Color(0xFFD9D9D9),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  // ignore: prefer_const_constructors
                  alignment: AlignmentDirectional(0, 0.3),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.15,
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: const Align(
                      child: Text(
                        'or',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Color(0xFF818181),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),

                /// New Here ?
                const Align(
                  alignment: AlignmentDirectional(0.03, 0.38),
                  child: Text(
                    'Sign up using social networks',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      color: Color(0xFF818181),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.03, 0.5),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 1),
                    child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
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
                                'New Here ?',
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
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) =>
                                              const SignUp()));
                                },
                                child: Text(
                                  'Sign up',
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.getFont(
                                    'Lato',
                                    color: const Color(0xFFFFAD65),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    5, 0, 0, 0),
                                child: Text(
                                  'and discover a great community !',
                                  style: GoogleFonts.getFont(
                                    'Lato',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
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
            ),
          ),
        ),
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

  Padding _formAuth(TextEditingController? controller, bool obsText,
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
          obscureText: obsText,
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
    if (emailController?.text.toString().trim().isEmpty != false ||
        passwordController?.text.toString().trim().isEmpty != false) {
      return false;
    } else {
      return true;
    }
  }

  InkWell _suffixIcon() {
    return InkWell(
      onTap: () => setState(() => {
            print(passwordVisibility),
            this.passwordVisibility = !this.passwordVisibility
          }),
      focusNode: FocusNode(skipTraversal: true),
      child: Icon(
        this.passwordVisibility
            ? Icons.visibility_outlined
            : Icons.visibility_off_outlined,
        color: const Color(0xFF757575),
        size: 22,
      ),
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
                    };

                    context
                        .read<AuthenticationBloc>()
                        .add(SignInEvent(dataSignIn));
                  } else {}
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
                child: const Text("Sign In"));
          }
        }));
  }
}
