import 'dart:convert';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/helpers/Api.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/screens/Agency/AddOfferView.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/screens/OffersListView.dart';
import 'Agency/OfferDetailsView.dart';

class OffersListappartement extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    
    return _OffersListappartementState();
  }
}

class _OffersListappartementState extends State<OffersListappartement> {
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
          IconButton(onPressed: () 
                  => Navigator.of(context).pop()
                
          , icon: Icon(Icons.arrow_back_ios)),
        ],),
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
                      OfferDetailsView(offer_id: _offers[index]['id'])));
          },
          child:Container(
            height: 190,
            width: 350,
            padding: EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
              color: Colors.amber[50],
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

  _loadOffers() async {
    // dynamic url='/offers';
    var response = await Api().getData('/appartementCat');
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
