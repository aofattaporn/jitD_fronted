import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant.dart';

Widget successToast(String msg, BuildContext context) => Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: const BoxDecoration(
          color: statusColorSuccess,
          borderRadius: BorderRadiusDirectional.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Color.fromRGBO(170, 212, 204, 0.5),
              offset: Offset(0, 2),
            )
          ]),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.check_circle,
              color: Colors.white,
              size: 30,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.02),
            Text(
              msg,
              style: GoogleFonts.getFont("Bai Jamjuree",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.01),
            const VerticalDivider(
              thickness: 1,
              width: 20,
              color: Colors.black,
            ),
            const CircleAvatar(
                backgroundColor: Color.fromRGBO(102, 204, 144, 1),
                child: Icon(
                  Icons.cancel_rounded,
                  color: Colors.white,
                  size: 24,
                ))
          ],
        ),
      ),
    );
