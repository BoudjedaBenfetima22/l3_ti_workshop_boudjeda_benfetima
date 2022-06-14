import 'dart:convert';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/helpers/Api.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/screens/Agency/AddOfferView.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/screens/OffersListView.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/screens/houses.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/screens/studio.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/screens/client/offerdetailsc.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/screens/appartement.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/screens/villa.dart';

class OffersListViewc extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    
    return _OffersListcState();
  }
}

class _OffersListcState extends State<OffersListViewc> {
  var _offers = [];
 
  @override
  void initState() {
    super.initState();
    _loadOffers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F8F9),
      body: Column(children: [
        Row(children: [
          SizedBox(width: 290,),
          IconButton(onPressed: () {
            
          }, icon: Icon(Icons.menu)),
        ],),
        head(),
        Expanded(
            child: ListView.builder(
          itemBuilder: _buildOfferItem,
          itemCount: _offers.length,
        )),
      ]),  
    );
  }

  Widget _buildOfferItem(BuildContext context, int index) {
     return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 9,),
                      margin:const EdgeInsets.symmetric(horizontal: 8,vertical: 5,) ,
                       decoration: BoxDecoration(
              color: Color.fromARGB(254, 239, 243, 245),
              boxShadow: [
                BoxShadow(
                    color: Colors.black,
                    blurRadius: 25,
                    offset: Offset(0, 5),
                    spreadRadius: -25,
                  ),
],
              borderRadius: BorderRadius.circular(20.0),
              ),
                      child:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: () {
             Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      OfferDetailsViewc(offer_id: _offers[index]['id'])));
          },
          child:Container(
            height: 190,
            width: 350,
            padding: EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 225, 239, 255),
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                fit: BoxFit.fill,
                image:NetworkImage(Api().getOfferImageUrl(_offers[index]['images'][0]['id'])),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(139, 253, 250, 250),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Icon(
                      Icons.favorite_border,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),Padding(
          padding: const EdgeInsets.only(
            left: 10,
            top: 15,
            bottom: 10,
          ),
          child: Row(
            children: <Widget>[
              Text(
                _offers[index]['prix'].toString()+"  DA",
                style: GoogleFonts.notoSans(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              // Icon(FontAwesomeIcons.house,size: 14,color: Color(0xff235265),),
          Icon(FontAwesomeIcons.handshake,size: 14,color: Color(0xff235265),),SizedBox(width: 9),
            Text(
            _offers[index]['type_doffre'].toString(),
           style: GoogleFonts.notoSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 69, 74, 75),
                ),),
            ],
          ),
        ),
       Padding(padding: const EdgeInsets.only(
            left: 10,
            top: 0,
            bottom: 10,
          ),child:Row(children: [Text(
            _offers[index]['categorie'].toString()+' ',
            style:
           GoogleFonts.notoSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 69, 74, 75),
                ),),
          ],),),
          Padding(
          padding: const EdgeInsets.only(
            left: 10,
            top: 0,
            bottom: 10,
          ),
           child:Row(children: [
            Icon(FontAwesomeIcons.city,size: 14,color: Color(0xff235265),),
            
            SizedBox(width: 9),
            Text(
            _offers[index]['wilaya'].toString(),
            style: GoogleFonts.notoSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),),
                SizedBox(width: 9),
 Icon(FontAwesomeIcons.locationDot,size: 14,color: Color(0xff235265),),
              Text(
                _offers[index]['localisation'].toString(),
                style: GoogleFonts.notoSans(
                  fontSize: 15,
                  color: Color.fromARGB(255, 5, 4, 2),
                ),
              ),
           ],),),
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
            top: 0,
            bottom: 10,
          ),
           child:Row(children: [
            Icon(FontAwesomeIcons.bed,size: 14,color: Color(0xff235265),),
            SizedBox(width: 9),
            Text(
            _offers[index]['nombre_des_chambres'].toString()+
              " bedrooms  ",
            style: TextStyle(
              fontSize: 15,
            ),),
           Icon(FontAwesomeIcons.bath,size: 14,color:Color(0xff235265),),
            SizedBox(width: 9),
            Text(
            _offers[index]['nombre_des_salles_de_bain'].toString() +
                " bathrooms  " ,
            style: TextStyle(
              fontSize: 15,
            ),),
            Icon(FontAwesomeIcons.kitchenSet,size: 14,color: Color(0xff235265),),
            SizedBox(width: 9),
            Text(
            _offers[index]['nombre_des_cuisines'].toString()+
              " kitchens",
            style: TextStyle(
              fontSize: 15,
            ),),

           ],),
        
        ),
      
        ],),);
  }
  head(){
    return Column(children: [
     Row(children:[
      SizedBox(
              height: 90.0,
              child: Image.asset(
                "assets/logo.png",
                fit: BoxFit.contain,
              ),
            ) ,
  
            Column(
              children: const [
               Padding(
                  padding: const EdgeInsets.only(left: 12,right:120),
                  child: Text(
                  'Welcome! ',
                  style: TextStyle(
                    fontSize: 23.0,
                    fontFamily: 'poppins',
                    color: Color(0xff235265),
                    fontWeight: FontWeight.w600,
                  ),
                ),),
                Padding(
                  padding: const EdgeInsets.only(left: 12,right:10,top: 10),
                  child: Text(
                    ' Let us Guide You Home',
                    style: TextStyle(
                        fontSize: 21.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'poppins'),
                  ),
                )
              ],
            ),
          ],),
          
          SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin:const EdgeInsets.symmetric(horizontal: 5,vertical: 5,) ,
                  height: 40,
                    decoration: BoxDecoration(    color: Color(0xff235265),
                borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(253, 230, 242, 248),
                    blurRadius: 25,
                    offset: Offset(0, 5),
                    spreadRadius: -25,
                  ),
],),
                  child: TextButton(
                    child: const Text(
                      'All ',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: "poppins",
                      ),
                    ),
                    onPressed: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => signup()));
                    },
                  )),
              Container(
                height: 40,
                decoration: BoxDecoration(    color: Color.fromARGB(253, 230, 242, 248),
                borderRadius: BorderRadius.circular(30),
                ),
                margin:const EdgeInsets.symmetric(horizontal: 5,vertical: 5,) ,
                  child: TextButton(
                child: const Text(
                  'Villa ',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    fontFamily: "poppins",
                  ),
                ),
                onPressed: () {
                   Navigator.of(context).push(
                       MaterialPageRoute(builder: (context) => villa()));
                },
              )),
              Container(
                height: 40,
                margin:const EdgeInsets.symmetric(horizontal: 5,vertical: 5,) ,
  decoration: BoxDecoration(    color: Color.fromARGB(253, 230, 242, 248),
                borderRadius: BorderRadius.circular(30),
      ),
                  child: TextButton(
                child: const Text(
                  'Appartements ',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    fontFamily: "poppins",
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => OffersListappartement()));
                },
              )),
              Container(
                height: 40,
                margin:const EdgeInsets.symmetric(horizontal: 5,vertical: 5,) ,
  decoration: BoxDecoration(    color: Color.fromARGB(253, 230, 242, 248),
                borderRadius: BorderRadius.circular(30),
              ),
                  child: TextButton(
                child: const Text(
                  'Houses ',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    fontFamily: "poppins",
                  ),
                ),
                onPressed:  () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Houses()));
                },
              )),
              Container(
                height: 40,
                margin:const EdgeInsets.symmetric(horizontal: 5,vertical: 5,) ,
  decoration: BoxDecoration(    color: Color.fromARGB(253, 230, 242, 248),
                borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                    color: Colors.black,
                    blurRadius: 25,
                    offset: Offset(0, 5),
                    spreadRadius: -25,
                  ),
],),
                  child: TextButton(
                child: const Text(
                  'Studio ',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    fontFamily: "poppins",
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Studio()));
                },
              )),
            ],
          ),),
          // const SizedBox(
          //   height: 20,
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10 ,vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Latest Offers",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                      fontSize: 20,
                      fontFamily: 'poppins',
                    )),
                
              ],
            ),
          ),],);
  }
  _loadOffers() async {
    // dynamic url='/offers';
    var response = await Api().getData('/offers');
    if (response.statusCode == 200) {
      setState(() {
        _offers = json.decode(response.body);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error ' + response.statusCode + ': ' + response.body),
      ));
    }
  }
}
