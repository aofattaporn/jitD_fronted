import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unFocusNode),
        child: Scaffold(
          body: Stack(
            children: [
              Image.asset(
                'assets/images/background.png',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1,
                fit: BoxFit.cover,
              ),
              Container(
                color: Colors.black38,
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: const  <Widget> [
                      SizedBox(height: 80),
                      Text("Sign Up", style: TextStyle(
                        fontFamily: 'Lato',
                        color: Color(0xFFAAD4CC),
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      )),
                      TextField()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
