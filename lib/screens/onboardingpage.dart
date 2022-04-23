import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/screens/UserType.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/screens/loginpage.dart';

class onBoardingPage extends StatelessWidget {
  const onBoardingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'WELCOME ',
          body: 'blablablablablabalbala',
          image: buildImage('assets/onboard1bg.png'),
          decoration: buildDecoration(),
        ),
        PageViewModel(
          title: 'blablablablablabalbala',
          body: 'blablablablablabalbala',
          image: buildImage('assets/onboard2bg.png'),
          decoration: buildDecoration(),
        ),
        PageViewModel(
          title: 'blablablablablabalbala',
          body: 'blablablablablabalbala ',
          image: buildImage('assets/onboard3bg.png'),
          decoration: buildDecoration(),
        ),
        PageViewModel(
          title: 'blablablablablabalbala',
          body: 'blablablablablabalbala',
          image: buildImage('assets/onboard4bg.png'),
          decoration: buildDecoration(),
        ),
      ],
      next: Icon(Icons.navigate_next, size: 40, color: Color(0xff235265),),
      done: Text('Done', style: TextStyle(color: Color(0xff235265), fontSize: 20)),
      onDone: () => goToHome(context),
      showSkipButton: true,
      skip: Text('Skip', style: TextStyle(color: Color(0xff235265), fontSize: 20),), //by default, skip goes to the last page
      onSkip: () => goToHome(context),
      dotsDecorator: getDotDecoration(),
      animationDuration: 1000,
      globalBackgroundColor: Color(0xffF5f8f9),
    );
  }

  DotsDecorator getDotDecoration() => DotsDecorator(
      color: Colors.grey,
      size: Size(10,10),
      activeColor: Color(0xff235265),
      activeSize: Size(22,10),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      )

  );

  void goToHome(BuildContext context) => Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => LoginPage()));

  Widget buildImage(String path) => Center(
      child: Image.asset(path)
  );

  PageDecoration buildDecoration() => PageDecoration(
    titleTextStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xff235265)),
    bodyTextStyle: TextStyle(fontSize: 20,),
    pageColor: Color(0xffF5f8f9),
    imagePadding: EdgeInsets.all(0),
  );
}