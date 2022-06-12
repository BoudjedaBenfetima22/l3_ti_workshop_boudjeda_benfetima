import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/helpers/Api.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/screens/Agency/loginpageAgency.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/screens/client/loginpageclient.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/widget/TextFormField.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/widget/ButtonCustom.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/widget/LoginOrregisterTxt.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';

class SignupPageAgency extends StatefulWidget {
  @override
  _SignupPageAgencyState createState() => _SignupPageAgencyState();
}

class _SignupPageAgencyState extends State<SignupPageAgency> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController passcontroller = new TextEditingController();
  TextEditingController phonecontroller = new TextEditingController();
  TextEditingController agencynamecontroller = new TextEditingController();
  TextEditingController adresscontroller = new TextEditingController();
var email;
var password;
var phone;
var name;
var adresse;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F8F9),
      body: _buildSignupLayout(),
    );
  }

  Widget _buildSignupLayout() {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 60,
            ),
            SizedBox(
              child: Text(
                'Welcome!',
                style: GoogleFonts.poppins(
                    fontSize: 25,
                    color: Color(0xff235265),
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height:10,
            ),
            SizedBox(
              child: Text(
                'Create Your Account',
                style: GoogleFonts.poppins(
                    fontSize: 23,
                    color: Color.fromARGB(243, 50, 98, 117),
                    letterSpacing: 0.24,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FormFieldCustom(
              controller: agencynamecontroller,
              hintText: 'Agency name',
              keyboardType: TextInputType.text,
              isPassword: false,
              icono: FontAwesomeIcons.building,
              validator: (val) => val!.isEmpty ? "enter a valid name" : null,
            ),
            SizedBox(
              height: 8.0,
            ),
            FormFieldCustom(
              controller: adresscontroller,
              hintText: ' Adress',
              keyboardType: TextInputType.text,
              isPassword: false,
              icono: FontAwesomeIcons.locationDot,
              validator: (val) => val!.isEmpty ? "enter a valid adress" : null,
            ),
            SizedBox(
              height: 8.0,
            ),
            FormFieldCustom(
                controller: phonecontroller,
                hintText: 'Phone Number',
                keyboardType: TextInputType.phone,
                isPassword: false,
                icono: FontAwesomeIcons.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Text is empty';
                  }
                }),
            SizedBox(
              height: 8.0,
            ),
            FormFieldCustom(
              controller: emailcontroller,
              hintText: 'Email adresse',
              keyboardType: TextInputType.emailAddress,
              isPassword: false,
              icono: FontAwesomeIcons.envelope,
              validator: (val) => val!.isEmpty || !val.contains("@")
                  ? "enter a valid eamil"
                  : null,
            ),
            SizedBox(
              height: 8.0,
            ),
            FormFieldCustom(
                controller: passcontroller,
                hintText: 'Password',
                isPassword: true,
                icono: FontAwesomeIcons.userLock,
                validator: (passvalue) {
                  if (passvalue == null || passvalue.isEmpty) {
                    return 'Text is empty';
                  } else if (passvalue.length < 8) {
                    return "Password must be atleast 8 characters long";
                  } else {
                    return null;
                  }
                }),
           Row(children: [ 
             SizedBox(width: 110,),
             Text('Add Avatar', style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Color(0xff235265),
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.bold),),
             IconButton(onPressed:getImageGallery
            
          , icon: Icon(FontAwesomeIcons.image,color: Color(0xff235265),)),
             ],),
             ButtonCustom(
              color: Color(0xff235265),
              borderRadius: 32.0,
              textColor: Color.fromARGB(255, 253, 255, 255),
              fontWeight: FontWeight.bold,
              fontSize: 18,
              onPressed: () {
                Register();
              },
              text: 'Sign Up',
            ),
            Texto(
              text1: 'Login',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPageA()));
              },
              text: "Already have an account ?",
            ),
          ],
        ),
      ),
    );
  }
  _showMsg(msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    ));
  }

File ?_image;
  final picker = ImagePicker();
  Future getImageGallery() async {
    var pickeFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickeFile != null) {
        _image = File(pickeFile.path);
      } else {
        print("No Image selected");
      }
    });
  }
  void Register() async {
    // setState(() {
    //   _isLoading = true;
    // });
var email=emailcontroller.text;
var password=passcontroller.text;
var phone=phonecontroller.text;
var name=agencynamecontroller.text;
var adresse=adresscontroller.text;
    var map = new Map<String, dynamic>();
    map['email'] = email;
    map['name'] = name;
    map['password'] = password;
    map['adresse']=adresse;
  map['phone']=phone;
  // map['photo']=_image;


    var response = await Api().postData(map, '/register_agence');

    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      _showMsg(response.body);

      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['user']));
       var userJson = localStorage.getString('user');
      var user =jsonDecode(userJson!);
      Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => MyHomePage(title: null,)),
      );
      _showMsg(body['message']);
      Navigator.pop(context);
    } else {
      _showMsg('Error ${response.body}');
    }

  }
}
