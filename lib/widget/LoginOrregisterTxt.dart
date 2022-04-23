import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Texto extends StatelessWidget {
  final String text;
  final String text1;

  final VoidCallback? onTap;

  Texto({
    this.text1 = '',
    this.onTap,
    this.text = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(fontFamily: 'Itim', color: Colors.black54),
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              text1,
              style: TextStyle(
                  fontFamily: 'Itim',
                  color: Color.fromARGB(255, 30, 65, 83),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
