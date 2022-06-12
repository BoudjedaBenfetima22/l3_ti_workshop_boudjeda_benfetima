import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/screens/Agency/loginpageAgency.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/screens/Agency/signup_page_agency.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/screens/client/loginpageclient.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/screens/client/signuppageclient.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/widget/ButtonCustom.dart';

class Type extends StatefulWidget {
  const Type({Key? key}) : super(key: key);

  @override
  State<Type> createState() => _TypeState();
}

class _TypeState extends State<Type> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F8F9),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
           SizedBox(height: 150,),
          SizedBox(
            child:Text (
        "Let's Get Started ",
        style: GoogleFonts.poppins(
            fontSize: 30,
            color: Color.fromARGB(243, 50, 98, 117),
            letterSpacing: 0.5,
            fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 130,),
          ButtonCustom(
            color: Color(0xff235265),
            borderRadius: 32.0,
            textColor: Color.fromARGB(255, 253, 255, 255),
            fontWeight: FontWeight.w500,
            fontSize: 26,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            text: '  Client  ',
          ),
          SizedBox(
            height: 25,
          ),
          ButtonCustom(
            color: Color(0xff235265),
            borderRadius: 32.0,
            textColor: Color.fromARGB(255, 253, 255, 255),
            fontWeight: FontWeight.w500,
            fontSize: 26,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>
                  LoginPageA()),
              );
            },
            text: 'Agency',
          ),
        ],
      ),
      
    );
  }
}
