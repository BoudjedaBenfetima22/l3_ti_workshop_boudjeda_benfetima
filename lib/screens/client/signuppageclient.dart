import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/helpers/Api.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/screens/client/loginpageclient.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/screens/home_page.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/widget/TextFormField.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/widget/ButtonCustom.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/widget/LoginOrregisterTxt.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupPageClient extends StatefulWidget {
  @override
  _SignupPageClientState createState() => _SignupPageClientState();
}

class _SignupPageClientState extends State<SignupPageClient> {

  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController passcontroller = new TextEditingController();
  TextEditingController phonecontroller = new TextEditingController();
  TextEditingController usernamecontroller = new TextEditingController();
  late String e;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F8F9),
      body: _buildSignupLayout(),
    );
  }

  Widget _buildSignupLayout() {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 40.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 70,
            ),
          SizedBox(
            child:Text (
       'Welcome!',
        style: GoogleFonts.poppins(
            fontSize: 25,
            color: Color(0xff235265),
            letterSpacing: 0.5,
            fontWeight: FontWeight.bold),
            ),
          ),
            SizedBox(
              height: 20,
            ),
          SizedBox(
            child:Text (
        'Create Your Account',
        style: GoogleFonts.poppins(
            fontSize: 23,
            color: Color.fromARGB(243, 50, 98, 117),
            letterSpacing: 0.24,
            fontWeight: FontWeight.w500),
            ),
          ),
            SizedBox(
              height: 30,
            ),
            FormFieldCustom(
              controller: usernamecontroller,
              hintText: 'Username',
              keyboardType: TextInputType.text,
              isPassword: false,
              icono: FontAwesomeIcons.circleUser,
              validator: (val) =>
                  val!.isEmpty ? "enter a valid Username" : null,
            ),
            SizedBox(
              height: 10.0,
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
              height: 10.0,
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
                SizedBox(
              height: 10.0,
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
              height: 10.0,
            ),

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
                    MaterialPageRoute(builder: (context) => LoginPage()));
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

  void Register() async {
    // setState(() {
    //   _isLoading = true;
    // });
    var map = new Map<String, dynamic>();
    map['email'] = emailcontroller.text;
    map['password'] = passcontroller.text;
    map['name'] = usernamecontroller.text;
    map['phone'] = phonecontroller.text;
    map['photo']='jjjjjjj';
    map['wilaya']='wilaya';
        var response = await Api().postData(map,'/register_client');



    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      _showMsg(response.body);

      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['user']));
      Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => MyHomePage(title: '',)),
      );
      _showMsg(body['message']);
      Navigator.pop(context);
    } else {
      _showMsg('Error ${response.body}');
    }

    // setState(() {
    //   _isLoading = false;
    // });
  }
}
