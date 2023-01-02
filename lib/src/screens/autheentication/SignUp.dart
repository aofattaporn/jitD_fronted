import 'package:flutter/material.dart';
import 'package:jitd_client/src/constant.dart';

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
        // key: scaffoldKey,
        // resizeToAvoidBottomInset: false,
        // backgroundColor: const Color(0xFFAAD4CC),
        body: SafeArea(
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
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 80, 0, 0),
                      child: Container(
                        // color: Colors.lightBlue,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: const [
                            Expanded(
                              child: Text(
                                'Sign',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  color: Color(0xFFAAD4CC),
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
                    ),

                    /// InputField 1  (Email)
                    InputField_custom(
                        0, emailController!, false, 'Email', Icons.email, null),

                    /// InputField 1  (Email)
                    InputField_custom(
                        -0.4,
                        passwordController!,
                        !passwordVisibility1,
                        'Password',
                        Icons.lock,
                        SuffixIcon("passwordVisibility1", passwordVisibility1)),

                    /// InputField 3  (Password Confirm)
                    InputField_custom(
                        -0.25,
                        passwordConfirmController!,
                        !passwordVisibility2,
                        'Confirm Password',
                        Icons.lock,
                        SuffixIcon("passwordVisibility2", passwordVisibility2)),

                    /// InputField 4  (Phone)
                    InputField_custom(-0.1, phoneController!, false, 'Phone Number',
                        Icons.phone, null),

                    /// Button
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0.23),
                        child: TextButton(
                          onPressed: () {
                            // Some Event here
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: const Color(0xFFFFAD65),
                              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
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

                    /// or string
                    Column(
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.15,
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Container(
                              // color: Colors.greenAccent,
                              child: Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Stack(
                                    children: const [
                                      Text(
                                        'or',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF818181),
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                            ),
                          ),
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
                                Button_3Party('assets/images/facebook_icon.png'),
                                Button_3Party('assets/images/twitter_icon.png'),
                                Button_3Party('assets/images/google_icon.png'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    /// Footer
                    Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: Image.asset(
                        'assets/images/signup_image.png',
                        width: 220,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),

                    Align(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Already have an account ?',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontFamily: 'Lato',
                                color: Color(0xFF818181),
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                              child: Text(
                                'Sign in here',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  color: Color(0xFFFFAD65),
                                  fontWeight: FontWeight.bold,
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
            ),
          ),
        ));
  }

  Padding Button_3Party(String imgURL) {
    return Padding(
      padding:const EdgeInsets.symmetric(vertical: 0, horizontal: 8.0),
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

  InkWell SuffixIcon(String fag, bool passwordVisibility) {
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
}