import 'package:flutter/material.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/screens/Agency/AddOfferView.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/screens/Agency/signup_page_agency.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/screens/client/signuppageclient.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/screens/client/loginpageclient.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/screens/OffersListView.dart';
import 'package:http/http.dart' as http;
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My House',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  var title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _getData() async {
    var url = Uri.http('192.168.43.26:8000', '/api/offers/offer1');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var snackBar = SnackBar(
        content: Text(response.body),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
  int selectedIndex = 0;
  final padding = EdgeInsets.symmetric(horizontal: 18, vertical: 12);
  double gap = 10;
final List<Widget>screens=[
OffersListView(),
AddOfferView(),
SignupPageClient(),
SignupPageAgency()
];
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        extendBody: true,
        body: screens[selectedIndex],
        drawer: Drawer(

        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text("Welcome!"),
            ),
            ListTile(
              title: Text('Login'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
                //.then((_) => _checkLoggedInUser());
              },
            ),
            ListTile(
              title: Text('Add offer'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddOfferView()));
              },
            ),
            ListTile(
              title: Text('Offers'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OffersListView()));
              },
            ),
          ],
        ),
      ),
        bottomNavigationBar: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(100)),
              boxShadow: [
                BoxShadow(
                  spreadRadius: -10,
                  blurRadius: 60,
                  color: Colors.black.withOpacity(.4),
                  offset: Offset(0, 25),
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 3),
              child: GNav(
                tabs: [
                  GButton(
                    gap: gap,
                    iconActiveColor: Colors.purple,
                    iconColor: Colors.black,
                    textColor: Colors.purple,
                    backgroundColor: Colors.purple.withOpacity(.2),
                    iconSize: 24,
                    padding: padding,
                    icon: LineIcons.home,
                    text: 'Home',
                  ),
                  GButton(
                    gap: gap,
                    iconActiveColor: Colors.pink,
                    iconColor: Colors.black,
                    textColor: Colors.pink,
                    backgroundColor: Colors.pink.withOpacity(.2),
                    iconSize: 24,
                    padding: padding,
                    icon: LineIcons.heart,
                    text: 'Likes',
                  ),
                  GButton(
                    gap: gap,
                    iconActiveColor: Colors.amber[600],
                    iconColor: Colors.black,
                    textColor: Colors.amber[600],
                    backgroundColor: Colors.amber[600]!.withOpacity(.2),
                    iconSize: 24,
                    padding: padding,
                    icon: LineIcons.mapMarked,
                    text: 'Search',
                  ),
                  GButton(
                    gap: gap,
                    iconActiveColor: Colors.teal,
                    iconColor: Colors.black,
                    textColor: Colors.teal,
                    backgroundColor: Colors.teal.withOpacity(.2),
                    iconSize: 24,
                    padding: padding,
                    icon: LineIcons.user,
                    text: 'Sheldon',
                  )
                ],
                selectedIndex: selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
