import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/screens/UserType.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/screens/editprofile.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/widget/ButtonCustom.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ProfilePageA extends StatefulWidget {
  @override
  _ProfilePageAState createState() => _ProfilePageAState();
}

class _ProfilePageAState extends State<ProfilePageA> {
  bool showPassword = false;
 var data;
  
  
  @override
  void initState(){
    
    _getUserInfo()async{
      SharedPreferences localStorage=await SharedPreferences.getInstance();
       var userJson = localStorage.getString('user');
      var user = json.decode(userJson!);
      setState(() {
         data=user;
      });
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
         icon: Icon(
            Icons.edit,
            color: Color(0xff235265),
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => EditProfilePage()));
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
  
              SizedBox(
                height: 15,
              ),
              
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/real-estate.png'))),
                    ),
                    
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              buildTextField("Username", "Immo", Icons.person),
              SizedBox(
                height: 35,
              ),
              buildTextField("E-mail", "immo@gmail.com", Icons.email_rounded),
              SizedBox(
                height: 25,
              ),
              buildTextField("Phone number", "0550963508", Icons.phone),
              SizedBox(
                height: 25,
              ),
              buildTextField("Wilaya", "Constantine", Icons.location_city),
              SizedBox(
                height: 25,
              ),
                ButtonCustom(
                  text: 'LogOut',
            color: Color(0xff235265),
            borderRadius: 32.0,
            textColor: Color.fromARGB(255, 253, 255, 255),
            fontWeight: FontWeight.bold,
            fontSize: 18,
            onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>Type() ));
                },),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, IconData icon) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 30 ,vertical:10 ),
        child: Row(    
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
 Icon(
      icon,
      color:  Color(0xff235265),
      size: 30.0,
    ),
            const SizedBox(width: 20,),
            Text(
              placeholder,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500 ,height: 1.4),
            ),
          ],
        ),
        decoration: BoxDecoration(
              color: Color.fromARGB(255, 232, 236, 248),
              borderRadius: BorderRadius.all(Radius.circular(40)),
              
            ),
      );
  }
}
