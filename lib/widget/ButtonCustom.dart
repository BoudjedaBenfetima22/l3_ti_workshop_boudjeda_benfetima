import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonCustom extends StatelessWidget {
  final String text;
  final Color color;
  final double borderRadius;
  final Color textColor;
  final FontWeight fontWeight;
  final double fontSize;
  final VoidCallback? onPressed;

  ButtonCustom({
    this.color = const Color(0xFF97BCBB),
    this.borderRadius = 18.0,
    this.textColor = Colors.white,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 18,
    this.onPressed,
    this.text = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(

       padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
       margin: EdgeInsets.symmetric(horizontal: 110, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 174, 216, 235).withOpacity(0.6),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 2),
          ),
        ],
        color: color,
      ),
      child: TextButton(
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontFamily: 'Pacifico',
            color: textColor,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
