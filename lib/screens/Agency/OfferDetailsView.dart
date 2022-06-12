import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/helpers/Api.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/screens/Agency/home_page.dart';

import '../../widget/ButtonCustom.dart';

class OfferDetailsView extends StatefulWidget {
  @override
  _OfferDetailsState createState() => _OfferDetailsState();
  final int offer_id;
  OfferDetailsView({required this.offer_id});
}

class _OfferDetailsState extends State<OfferDetailsView> {
  get title => null;

  @override
  void initState() {
    super.initState();
    _loadOfferDetails();
  }

  var offer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: offer != null ? _buildFormFields() : Text('Loading...'),
          )
        ],
      ),
    );
  }

  Widget _buildFormFields() {
    return SingleChildScrollView(
      child: Container(
        color: Color.fromARGB(255, 255, 255, 255),
        padding: EdgeInsets.only(top: 25, bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(children: [
          IconButton(onPressed: () 
                  => Navigator.of(context).pop(),icon: Icon(Icons.arrow_back_ios)),
          SizedBox(width: 260,),
          IconButton(onPressed: () {
                _deleteOffer();
          }, icon: Icon(Icons.delete)),
            ],),
            Container(
              height: 200,
              child: ListView.builder(
                shrinkWrap: false,
                scrollDirection: Axis.horizontal,
                itemCount: offer['images'].length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: SizedBox(
                      width: 400,
                      height: 400,
                      child: Image.network(
                        Api().getOfferImageUrl(offer['images'][index]['id']),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 0,
                right: 0,
                left: 0,
              ),
              child: Container(
                width: 400,
                height: 500,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 9,
                ),
                margin: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(250, 247, 248, 248),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 156, 189, 211),
                      blurRadius: 25,
                      offset: Offset(0, 5),
                      spreadRadius: -25,
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    Row(
                      children: [
                         Icon(
                          Icons.sell,
                          size: 20,
                          color: Color(0xff235265),
                        ),
                        Text(
                         "  " +offer['prix'].toString() + "  DA",
                          style: GoogleFonts.poppins(
                            color: Color.fromARGB(255, 6, 6, 6),
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 11),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.locationDot,
                          size: 20,
                          color: Color(0xff235265),
                        ),
                        SizedBox(width: 9),
                        Text(
                          offer['wilaya'].toString() +
                              "   " +
                              offer['localisation'].toString(),
                          style: GoogleFonts.poppins(
                            color: Color.fromARGB(255, 45, 45, 45),
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          height: 70,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(240, 225, 233, 238),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 156, 189, 211),
                                blurRadius: 25,
                                offset: Offset(0, 5),
                                spreadRadius: -25,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Column(children: [
                             SizedBox(height: 9),
                            Icon(
                          FontAwesomeIcons.bath,
                          size: 20,
                          color: Color(0xff235265),
                        ),
                        SizedBox(height: 9),
                        Text(offer['nombre_des_salles_de_bain'].toString(),
                         style: GoogleFonts.poppins(
                            color: Color.fromARGB(255, 3, 3, 3),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        )]),
                        ),
                        SizedBox(width: 20,),
                        Container(
                          height: 70,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(240, 225, 233, 238),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 156, 189, 211),
                                blurRadius: 25,
                                offset: Offset(0, 5),
                                spreadRadius: -25,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Column(children: [
                             SizedBox(height: 9),
                            Icon(
                          FontAwesomeIcons.bed,
                          size: 20,
                          color: Color(0xff235265),
                        ),
                        SizedBox(height: 9),
                        Text(offer['nombre_des_chambres'].toString(),
                         style: GoogleFonts.poppins(
                            color: Color.fromARGB(255, 3, 3, 3),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        )]),
                        ),
                         SizedBox(width: 20,),
                        Container(
                          height: 70,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(240, 225, 233, 238),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 156, 189, 211),
                                blurRadius: 25,
                                offset: Offset(0, 5),
                                spreadRadius: -25,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Column(children: [
                             SizedBox(height: 9),
                            Icon(
                          FontAwesomeIcons.kitchenSet,
                          size: 20,
                          color: Color(0xff235265),
                        ),
                        SizedBox(height: 9),
                        Text(offer['nombre_des_cuisines'].toString(),
                         style: GoogleFonts.poppins(
                            color: Color.fromARGB(255, 3, 3, 3),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        )]),
                        ),
                      ],
                    ),
                    SizedBox(height: 19),
                   Row(
                      children: [ Text( 'Description',
                          style: GoogleFonts.poppins(
                            color: Color.fromARGB(255, 45, 45, 45),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          ),),],
                    ),
                    SizedBox(height: 8),
                    
                        
                        Text(  offer['description'].toString(),
                          style: GoogleFonts.poppins(
                            color: Color.fromARGB(255, 45, 45, 45),
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                   ButtonCustom(
                  text: 'Call',
            color: Color(0xff235265),
            borderRadius: 32.0,
            textColor: Color.fromARGB(255, 253, 255, 255),
            fontWeight: FontWeight.bold,
            fontSize: 18,
            onPressed: _callNumber
                ,),
                  ],
                ),
              ),
            )
            
          ],
        ),
      ),
      
    );
   
  }
_callNumber() async{
  const number = '0550963508'; //set the number here
  bool? res = await FlutterPhoneDirectCaller.callNumber(number);}

  Widget _buildGridView() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 1,
      children: List.generate(offer['images'].length, (index) {
        return Card(
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: <Widget>[
              Image.network(
                Api().getOfferImageUrl(offer['images'][index]['id']),
                width: 300,
                height: 300,
              ),
            ],
          ),
        );
      }),
    );
  }

  _deleteOffer() async {
    var response =
        await Api().DeleteData('/offers/' + widget.offer_id.toString());
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(response.statusCode.toString() + ': ' + response.body),
      ));
       Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage(title: '',)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            'Error ' + response.statusCode.toString() + ': ' + response.body),
      ));
    }
  }

  _loadOfferDetails() async {
    var response = await Api().getData('/offers/' + widget.offer_id.toString());
    if (response.statusCode == 200) {
      setState(() {
        offer = json.decode(response.body);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            'Error ' + response.statusCode.toString() + ': ' + response.body),
      ));
    }
  }
}
