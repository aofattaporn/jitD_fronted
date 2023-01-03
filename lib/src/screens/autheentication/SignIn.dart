import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        key: scaffoldKey,
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unFocusNode),
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/background.png',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1,
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: const AlignmentDirectional(0, -0.75),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sing',
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
                Align(
                  alignment: const AlignmentDirectional(0, -0.55),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(35, 0, 35, 0),
                    child: TextFormField(
                      controller: emailController,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: 'Email',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFF7FD4C5),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFF7FD4C5),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
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
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Color(0xFF3F4247),
                        ),
                      ),
                      style: const TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, -0.38),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(35, 0, 35, 0),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: !passwordVisibility,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: 'Password',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFF7FD4C5),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFF7FD4C5),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x00000000),
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
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Color(0xFF3F4247),
                        ),
                        suffixIcon: InkWell(
                          onTap: () => setState(
                            () => passwordVisibility = !passwordVisibility,
                          ),
                          focusNode: FocusNode(skipTraversal: true),
                          child: Icon(
                            passwordVisibility
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: const Color(0xFF757575),
                            size: 22,
                          ),
                        ),
                      ),
                      style: const TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.74, -0.26),
                  child: Text(
                    'Forgot password ?',
                    style: GoogleFonts.getFont(
                      'Lato',
                      color: const Color(0xFF818181),
                      fontSize: 14,
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, -0.1),
                  child: TextButton(
                    onPressed: () {
                      // Some Event
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFFFFAD65),
                      padding: const EdgeInsets.fromLTRB(36, 16, 36, 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
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
                Align(
                  alignment: const AlignmentDirectional(0, 0.1),
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
                  alignment: AlignmentDirectional(0, 0.1),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.15,
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: const Align(
                      alignment: AlignmentDirectional(0, 0),
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
                const Align(
                  alignment: AlignmentDirectional(0.03, 0.25),
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
                  alignment: const AlignmentDirectional(0, 0.4),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/facebook_icon.png',
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                        child: Image.asset(
                          'assets/images/twitter_icon.png',
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Image.asset(
                        'assets/images/google_icon.png',
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ],
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
                                  Navigator.pop(context);
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
}
