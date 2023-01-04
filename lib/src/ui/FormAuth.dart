import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class FormAuth extends StatelessWidget {
  const FormAuth({
    Key? key,
    required this.controller,
    required this.icons
  }) : super(key: key);

  final TextEditingController? controller;
  final IconData? icons;


@override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 35, vertical: 5),
        child: TextField(
          controller: controller,
          obscureText: false,
          decoration: InputDecoration(
              isDense: true,
              hintText: "Email",
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
              suffixIcon: null),
          style: const TextStyle(
            fontFamily: 'Lato',
            fontSize: 16,
          ),
        ));
  }
}
