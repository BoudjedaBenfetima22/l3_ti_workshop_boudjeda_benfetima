import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FormFieldCustom extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool isPassword;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;
  final IconData? icono;
  
  const FormFieldCustom({
    this.controller,
    this.hintText,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.icono,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(60),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 25,
            offset: Offset(0, 5),
            spreadRadius: -25,
          ),
        ],
      ),
      margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        validator: validator,
        obscureText: isPassword,
        style: GoogleFonts.poppins(
            fontSize: 15,
            color: Colors.black,
            letterSpacing: 0.24,
            fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Color.fromARGB(255, 87, 103, 107),
          ),
          fillColor: Colors.white,
          filled: true,
          prefixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(20, 11, 10, 8),
            child: FaIcon(
              icono,
              color: Color(0xff235265),
              size: 20,
            ),
          ),
          contentPadding: const EdgeInsets.fromLTRB(1, 18, 1, 18),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(60),
            ),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(60),
            ),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}