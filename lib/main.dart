import 'package:flutter/material.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/screens/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/screens/onboardingpage.dart';



int? initScreen;
Future<void>  main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen =  await preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 0); //if already shown -> 1 else 0
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter OnBoarding Screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      initialRoute: initScreen == 1 || initScreen == null ? 'onboard' : 'home',
      routes: {
        'home' : (context) => LoginPage(),
        'onboard': (context) => onBoardingPage(),
      },
    );
  }
}