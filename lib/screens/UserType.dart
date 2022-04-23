import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/screens/signup_page_agency.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/screens/signuppageclient.dart';
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
            margin: EdgeInsets.symmetric(horizontal: 60, vertical: 30),
            decoration: BoxDecoration(
              color: Color.fromARGB(133, 188, 204, 203),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 174, 216, 235).withOpacity(0.6),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              icon: Image.asset('assets/client.png'),
              iconSize: 200,
             onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupPageClient()),
                      );
                    },
            ),
          ),
          SizedBox(
            height:30,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            decoration: BoxDecoration(
              color: Color.fromARGB(133, 188, 204, 203),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 174, 216, 235).withOpacity(0.6),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              icon: Image.asset('assets/real-estate.png'),
              iconSize: 200,
              onPressed: () { 
                  Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupPageAgency()),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
