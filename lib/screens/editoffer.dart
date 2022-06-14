import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/helpers/Api.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/screens/Agency/AddOfferView.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/screens/Agency/home_page.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/screens/Mapview.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/screens/OffersListView.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/widget/ButtonCustom.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/widget/TextFormField.dart';
import 'package:image_picker/image_picker.dart';

class EditOfferView extends StatefulWidget {
  @override
  _EditOfferState createState() => _EditOfferState();
}

class _EditOfferState extends State<EditOfferView> {
   @override
  void initState() {
    super.initState();
  
  
  }

  String category_id = "1";
  var user_id = 1;
  var price;
  String categoryValue='appartement';
  String typeValue = 'For Sale';
  String dropdownValue = 'Adrar';
  TextEditingController titlecontroller = new TextEditingController();
  TextEditingController pricecontroller = new TextEditingController();
  TextEditingController descriptioncontroller = new TextEditingController();
  TextEditingController locationcontroller = new TextEditingController();
  TextEditingController bathroomscontroller = new TextEditingController();
  TextEditingController bedroomscontroller = new TextEditingController();
  TextEditingController kitchencontroller = new TextEditingController();
  late File _image;
  List<XFile> images = [];
  final picker = ImagePicker();
   late final int offer_id;
  Future getImageGallery() async {
    var res = await picker.pickMultiImage();
    setState(() {
      images.addAll(res!);
    });
  }

  Future getImageCamera() async {
    var ree = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      images.add(ree!);
    });
  }

  void showSheetGallery(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: Wrap(
              children: [
                new ListTile(
                  leading: new Icon(Icons.image),
                  title: new Text("From Gallery"),
                  onTap: () {
                    getImageGallery();
                  },
                ),
                new ListTile(
                  leading: new Icon(Icons.camera),
                  title: new Text("From Camera"),
                  onTap: () {
                    getImageCamera();
                  },
                ),
              ],
            ),
          );
        });
  }
Widget _buildGridView() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 1,
      children: List.generate(images.length, (index) {
        File image = File(images[index].path);
        return Card(
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: <Widget>[
              Image.file(
                image,
                width: 300,
                height: 300,
              ),
              Positioned(
                right: 5,
                top: 5,
                child: InkWell(
                  child: Icon(
                    Icons.remove_circle,
                    size: 30,
                    color: Colors.red,
                  ),
                  onTap: () {
                    setState(() {
                      images.removeAt(index);
                    });
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff235265),
          title: Text(
            'Edit Offer',
            style: GoogleFonts.poppins(
                fontSize: 19,
                color: Color.fromARGB(255, 249, 250, 250),
                letterSpacing: 0.5,
                fontWeight: FontWeight.w400),
          ),
           leading: IconButton(
         icon: Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 244, 246, 247),
          ),
          onPressed: () 
                  => Navigator.of(context).pop(),
        ),
        ),
        body: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: _buildFormFields(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildFormFields() {
    return  ListView(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
             Row(children: [ 
             SizedBox(width: 110,),
             Text('Get location', style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Color(0xff235265),
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.bold),),
             IconButton(onPressed:() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MapView()));
              },
          icon: Icon(FontAwesomeIcons.locationDot,color: Color(0xff235265),)),
             ],),
            FormFieldCustom(
              controller: pricecontroller,
              hintText: 'Price',
              icono: FontAwesomeIcons.dollarSign,
              keyboardType: TextInputType.number,
              validator: (val) => val!.isEmpty ? "enter some text" : null,
            ),
            FormFieldCustom(
              controller: descriptioncontroller,
              icono: FontAwesomeIcons.alignJustify,
              hintText: 'Description',
              keyboardType: TextInputType.text,
              validator: (val) => val!.isEmpty ? "enter some text" : null,
            ),
            FormFieldCustom(
              controller: locationcontroller,
              hintText: 'Adress',
              icono: FontAwesomeIcons.mapLocationDot,
              validator: (val) => val!.isEmpty ? "enter some text" : null,
            ),
             FormFieldCustom(
              controller: bedroomscontroller,
              icono: FontAwesomeIcons.bed,
              hintText: 'Bedrooms',
              keyboardType: TextInputType.phone,
              validator: (val) => val!.isEmpty ? "enter some text" : null,
            ),
             FormFieldCustom(
              controller: kitchencontroller,
              icono: FontAwesomeIcons.kitchenSet,
              hintText: 'Kitchens',
              keyboardType: TextInputType.phone,
              validator: (val) => val!.isEmpty ? "enter some text" : null,
            ),
            FormFieldCustom(
              controller: bathroomscontroller,
              icono: FontAwesomeIcons.bath,
              hintText: 'Bathrooms',
              keyboardType: TextInputType.phone,
              validator: (val) => val!.isEmpty ? "enter some text" : null,
            ),
             Container(
              width: 370.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(60),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 25,
                    offset: Offset(0, 5),
                    spreadRadius: -25,
                  ),
                ],
                color: Colors.white,
              ),
              margin: EdgeInsets.fromLTRB(10, 10, 5, 10),
              padding: EdgeInsets.fromLTRB(10, 6, 5, 6),
              child: Row(
                children: [
                  Icon(
                    Icons.sell,
                    color: Color(0xff235265),
                    size: 20,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  DropdownButton<String>(
                    value: categoryValue,
                    items: <String>[
                      'appartement',
                      'villa',
                      'studio',
                      'house',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Color.fromARGB(255, 37, 45, 48),
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w300),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        categoryValue = newValue!;
                      });
                    },
                  ),

                ],
              ),
            ),
            Container(
              width: 370.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(60),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 25,
                    offset: Offset(0, 5),
                    spreadRadius: -25,
                  ),
                ],
                color: Colors.white,
              ),
              margin: EdgeInsets.fromLTRB(10, 10, 5, 10),
              padding: EdgeInsets.fromLTRB(10, 6, 5, 6),
              child: Row(
                children: [
                  Icon(
                    Icons.location_city,
                    color: Color(0xff235265),
                    size: 20,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  DropdownButton<String>(
                    value: dropdownValue,
                    items: <String>[
                      'Adrar',
                      'Chlef',
                      'Laghouat',
                      'Oum El Bouaghi',
                      'Batna',
                      'Béjaia',
                      'Biskra',
                      'Béchar',
                      'Blida',
                      'Bouira',
                      'Tamenrasset',
                      'Tebessa',
                      'Tlemcen',
                      'Tiaret',
                      'Tizi Ouzou',
                      'Alger',
                      'Djelfa',
                      'jijel',
                      'Setif',
                      'Saida',
                      'Skikda',
                      'Sidi Bel Abbés',
                      'Annaba',
                      'Guelma',
                      'Constantine',
                      'Médéa',
                      'Mostaganem',
                      "M'sila",
                      'Mascara',
                      'Ouargla',
                      'Oran',
                      'El Baydh',
                      'Illizi',
                      'Bordj Bou Arriridj',
                      'Boumerdés',
                      'El Taref',
                      'Tindouf',
                      'El Oued',
                      'Khemchela',
                      'Souk Ahras',
                      'Tipaza',
                      'Mila',
                      'Ain Defla',
                      'Naama',
                      'Ain Témouchent',
                      'Ghardaia',
                      'Ghelizane',
                      'Timimoun',
                      'Bordj Badji Mokhtar',
                      'Ouled Djellal',
                      'Béni Abbès',
                      'In Salah',
                      'In Guezzam ',
                      'Touggourt',
                      'Djanet ',
                      "El M'Ghair",
                      'El Meniaa ',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Color.fromARGB(255, 37, 45, 48),
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w300),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                  ),

                ],
              ),
            ),
            Container(
              width: 370.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(60),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 25,
                    offset: Offset(0, 5),
                    spreadRadius: -25,
                  ),
                ],
                color: Colors.white,
              ),
              margin: EdgeInsets.fromLTRB(10, 10, 5, 10),
              padding: EdgeInsets.fromLTRB(10, 6, 5, 6),
              child: Row(
                children: [
                  Icon(
                    Icons.real_estate_agent
                    ,
                    color: Color(0xff235265),
                    size: 20,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  DropdownButton<String>(
                    value: typeValue,
                    items: <String>[
                      'For Rent',
                      'For Sale',
                      'For Exchage',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Color.fromARGB(255, 37, 45, 48),
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w300),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        typeValue = newValue!;
                      });
                    },
                  ),

                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(40,10,40,10),
              padding: EdgeInsets.only(left:30, right:30),
              child: MaterialButton(
                onPressed: () {
                  showSheetGallery(context);
                },
                child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.camera),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Add Images",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Itim'),
                        ),
                      ],
                    )),
              ),
            ),
          _buildGridView(),
           ButtonCustom(
              color: Color(0xff235265),
              borderRadius: 32.0,
              textColor: Color.fromARGB(255, 253, 255, 255),
              fontWeight: FontWeight.bold,
              fontSize: 16,
              onPressed: () {
                _submit();
              },
              text: 'Submit',
            ),
            SizedBox(
              height:70,
            ),
             ],
        
    );
  
  }
  // _loadOfferDetails() async {
  //   var response = await Api().getData('/offers/' + widget.offer_id.toString());
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       offer = json.decode(response.body);
  //     });
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Text(
  //           'Error ' + response.statusCode.toString() + ': ' + response.body),
  //     ));
  //   }
  // }
// _editOffer() async {
//     var response =
//         await Api().updateData('/offers/' + widget.offer_id.toString());
//     if (response.statusCode == 200) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text(response.statusCode.toString() + ': ' + response.body),
//       ));
//        Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => MyHomePage(title: '',)),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text(
//             'Error ' + response.statusCode.toString() + ': ' + response.body),
//       ));
//     }
//   }
   void _submit() async {
     print(images.length);
        // setState(() {
        //   _isLoading = true;
        // });
        var data = new Map<String, String>();
        // data['title'] = titlecontroller.text;
        data['prix'] = pricecontroller.text;
        data['localisation'] = locationcontroller.text;
        data['description'] =descriptioncontroller.text;
        data['wilaya'] = dropdownValue;
        data['nombre_des_chambres'] =bedroomscontroller.text;
        data['nombre_des_salles_de_bain'] =bathroomscontroller.text;
        data['nombre_des_cuisines'] =kitchencontroller.text;
        data['type_doffre'] =typeValue ;
        data['categorie'] = categoryValue;
        data['agence_id'] = '1';
        var response = await Api().postDataWithImages(data,'/offers',images);
        // var response = await Api().postData(data, '/offers');
        if (response.statusCode == 201) {
          Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHomePage(title: null,)));
                 
        } else {
          _showMsg('Error ${response.body}');
        }
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
}
