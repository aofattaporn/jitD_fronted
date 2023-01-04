import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jitd_client/src/blocs/authentication/authen_bloc.dart';
import 'package:jitd_client/src/blocs/authentication/authen_event.dart';
import 'package:jitd_client/src/blocs/authentication/authen_state.dart';
import 'package:jitd_client/src/constant.dart';

class SignUp_custom extends StatefulWidget {
  const SignUp_custom({Key? key}) : super(key: key);

  @override
  SignUp_customState createState() => SignUp_customState();
}

class SignUp_customState extends State<SignUp_custom> {
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
              Center(
                child: Image.asset(
                  'assets/images/background.png',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1,
                  fit: BoxFit.cover,
                ),
              ),

              /// ALL CONTENT
              BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (context, state) {
                return Column(
                  children: [
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

                    /// FORM
                    Expanded(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            // FORM
                            FormAuth(emailController, "Email", Icons.email),
                            FormAuth(
                                passwordController, "Password", Icons.lock),
                            FormAuth(passwordConfirmController,
                                "Password Confirm", Icons.lock),

                            // Button
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: TextButton(
                                onPressed: () {
                                  // Some Event here
                                  if (_formKey.currentState?.validate() ==
                                          true &&
                                      _checkFormFill() == true) {
                                    Map<String, dynamic> dataSignIn = {
                                      "Email": emailController?.text,
                                      "Password": passwordController?.text,
                                      "PasswordCF":
                                          passwordConfirmController?.text,
                                      "Phone": phoneController?.text
                                    };
                                    context
                                        .read<AuthenticationBloc>()
                                        .add(SignUpEvent(dataSignIn));
                                  }
                                },
                                style: TextButton.styleFrom(
                                    backgroundColor: (_checkFormFill() == true)
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

                            const Center(
                              child: Text("or"),
                            ),

                            // Show Sign up using
                            const Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding:
                                    EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 15.0),
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
                    ),

                    /// Button
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
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

  Padding FormAuth(
      TextEditingController? controller, String hint, IconData iconData) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
        child: TextFormField(
          validator: (value) {

            return null;
          },
          controller: controller,
          obscureText: false,
          decoration: InputDecoration(
            isDense: true,
            hintText: hint,
            enabledBorder: statusBorder(primaryColor),
            focusedBorder: statusBorder(primaryColorDark),
            errorBorder: statusBorder(statusColorError),
            focusedErrorBorder: statusBorder(primaryColorDark),
            prefixIcon: Icon(
              iconData,
              color: Color(0xFF3F4247),
            ),
          ),
          style: const TextStyle(
            fontFamily: 'Lato',
            fontSize: 16,
          ),
        ));
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
    if (emailController?.text.toString().trim().isEmpty != true &&
            passwordController?.text.toString().trim().isEmpty != true &&
            passwordConfirmController?.text.toString().trim().isEmpty != true
        // phoneController?.text.toString().trim().isEmpty == false
        ) {
      return true;
    } else
      return false;
  }
}
