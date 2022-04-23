import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/helpers/Api.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/widget/ButtonCustom.dart';
import 'package:l3_ti_workshop_boudjeda_benfetima/widget/TextFormField.dart';
import 'package:image_picker/image_picker.dart';

class AddOfferView extends StatefulWidget {
  @override
  _AddOfferState createState() => _AddOfferState();
}

class _AddOfferState extends State<AddOfferView> {
  var title;
  var category_id = 1;
  var user_id = 1;
  var price;
  String dropdownValue = 'Adrar';
    String dropdownValue2 = 'Appartement';
  TextEditingController titlecontroller = new TextEditingController();
  TextEditingController pricecontroller = new TextEditingController();
  TextEditingController descriptioncontroller = new TextEditingController();
  TextEditingController locationcontroller = new TextEditingController();
  // File _image;
  //final picker = ImagePicker();
    late File _image;
  final picker = ImagePicker();
  Future getImageGallery() async {
    var pickeFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickeFile != null) {
        _image = File(pickeFile.path);
      } else {
        print("No Image selected");
      }
    });
  }

  Future getImageCamera() async {
    var pickeFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickeFile != null) {
        _image = File(pickeFile.path);
      } else {
        print("No Image selected");
      }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff235265),
        title: Text(
          'Add new Offer',
          style: GoogleFonts.poppins(
              fontSize: 19,
              color: Color.fromARGB(255, 249, 250, 250),
              letterSpacing: 0.5,
              fontWeight: FontWeight.w400),
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
    );
  }

  Widget _buildFormFields() {
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            FormFieldCustom(
              controller: titlecontroller,
              icono: FontAwesomeIcons.t,
              hintText: 'Title',
              keyboardType: TextInputType.text,
              validator: (val) => val!.isEmpty ? "enter some text" : null,
            ),
            FormFieldCustom(
              controller: pricecontroller,
              hintText: 'Price',
              icono: FontAwesomeIcons.dollarSign,
              keyboardType: TextInputType.text,
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
              hintText: 'localisation',
              icono: FontAwesomeIcons.mapLocationDot,
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
                    // Step 5.
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
                    Icons.real_estate_agent,
                    color: Color(0xff235265),
                    size: 20,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  DropdownButton<String>(
                    value: dropdownValue2,
                    items: <String>[
                      'Appartement',
                      'Villa',
                      'Niveau de Villa',
                      'Studio',
                      'Maison',
                      'Terrain',
                      'Entrepot',
                      'Colocation',

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
                    // Step 5.
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue2 = newValue!;
                      });
                    },
                  ),
                ],
              ),
            ),
  Container(
                        margin: EdgeInsets.fromLTRB(40, 10, 40, 10),
                        padding: EdgeInsets.only(left: 30, right: 30),
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
                                    "Add Image",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontFamily: 'Itim'),
                                  ),
                                ],
                              )),
                        ),
                      ),
            ButtonCustom(
              color: Color(0xff235265),
              borderRadius: 32.0,
              textColor: Color.fromARGB(255, 253, 255, 255),
              fontWeight: FontWeight.bold,
              fontSize: 16,
              onPressed: () {
                _submit();
                ;
              },
              text: 'Submit',
            ),

            //_buildRegisterText(),
          ],
        ),
      ),
    );
  }

  // Widget _buildRegisterText() {
  // return Text(
  //   'REGISTER',
  //   textAlign: TextAlign.center,
  //   style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
  // );
  // }
  // Widget _buildImage() {
  //   if (_image == null) {
  //     return Padding(
  //       padding: const EdgeInsets.fromLTRB(1, 1, 1, 1),
  //       child: Icon(
  //         Icons.add,
  //         color: Colors.grey,
  //       ),
  //     );
  //   } else {
  //     return Image.file(File(_image.path));
  //   }
  // }

  void _submit() async {
    // setState(() {
    //   _isLoading = true;
    // });
    var data = new Map<String, String>();
    data['title'] = titlecontroller.text;
    data['price'] = pricecontroller.text;
    data['location'] = locationcontroller.text;
    data['Description'] = descriptioncontroller.text;
    data['wilaya'] = dropdownValue;
    data['category'] = dropdownValue2;
    data['Description'] = descriptioncontroller.text;
    data['user_id'] = user_id.toString();
    data['category_id'] = category_id.toString();
    // data['image'] = _image.path;

    //var response = await Api().postDataWithImage(data, '/offers', _image.path);
    var response = await Api().postData(data, '/offers');

    if (response.statusCode == 201) {
      Navigator.pop(context);
    } else {
      _showMsg('Error ${response.statusCode}');
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
