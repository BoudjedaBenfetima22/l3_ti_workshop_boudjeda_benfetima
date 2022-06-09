import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/helpers/Api.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/screens/OffersListView.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/widget/TextFormField.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/widget/ButtonCustom.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/widget/LoginOrregisterTxt.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/screens/home_page.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/screens/UserType.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Agency/AddOfferView.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F8F9),
      body: _buildLoginLayout(),
    );
  }

  Widget _buildLoginLayout() {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 40.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 50.0,
            ),
            SizedBox(
              height: 250.0,
              child: Image.asset(
                "assets/login.png",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 40,
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
                icono: FontAwesomeIcons.lock,
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
              height: 20.0,
            ),
            ButtonCustom(
              color: Color(0xff235265),
              borderRadius: 32.0,
              textColor: Color.fromARGB(255, 253, 255, 255),
              fontWeight: FontWeight.bold,
              fontSize: 18,
              onPressed: () { 
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyHomePage(title: '',)));             
              //  _login();s
              },
              text: 'Login',
            ),
            SizedBox(
              height: 10.0,
            ),
            Texto(
              text1: 'SignUp',
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Type()));
              },
              text: "Don't have an account ?",
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
        },
      ),
    ));
  }

  void _login() async {
    var email = emailcontroller.text;
    var password = passcontroller.text;

    var map = Map<String, dynamic>();
    map['email'] = email;
    map['password'] = password;
 
    var response = await Api().postData(map, '/login_client');

    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      _showMsg(response.body);

      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['user']));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage(title: '',)),
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
