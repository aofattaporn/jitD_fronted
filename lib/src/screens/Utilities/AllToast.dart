import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant.dart';

Widget successToast(String msg, BuildContext context) => Container(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
      color: statusColorSuccess,
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.check_circle,
              color: Colors.white,
              size: 30,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.05),
            Text(
              msg,
              style: GoogleFonts.getFont("Bai Jamjuree",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.015),
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
                  size: 50,
                ))
          ],
        ),
      ),
    );
