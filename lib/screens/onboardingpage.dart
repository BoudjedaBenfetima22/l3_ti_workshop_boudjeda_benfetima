import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/screens/UserType.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/screens/client/loginpageclient.dart';

class onBoardingPage extends StatelessWidget {
  const onBoardingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'Welcome To IMMO App',
          body: 'Let us Guide you Home',
          image: buildImage('assets/1.png'),
          decoration: buildDecoration(),
        ),
        PageViewModel(
          title: 'Search properties ',
          body: 'For Sale,Rent or Exchange',
          image: buildImage('assets/Search.png'),
          decoration: buildDecoration(),
        ),
        PageViewModel(
          title: 'Buy or Rent a House',
          body: "With filters,IMMO can help you easily find  properties . ",
          image: buildImage('assets/filters.png'),
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
      globalBackgroundColor: Color.fromARGB(255, 255, 255, 255),
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
      MaterialPageRoute(builder: (_) => Type()));

  Widget buildImage(String path) => Center(
       child: Image.asset(path),
      // child:SizedBox(height: 30,),
  );

  PageDecoration buildDecoration() => PageDecoration(
    titleTextStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xff235265)),
    bodyTextStyle: TextStyle(fontSize: 20,),
    pageColor: Color.fromARGB(255, 255, 255, 255),
    imagePadding: EdgeInsets.all(0),
  );
}