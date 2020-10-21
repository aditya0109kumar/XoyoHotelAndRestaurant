// import 'package:country_code_picker/country_code_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/Widgets/customTextField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BasicInformation extends StatefulWidget {
  @override
  _BasicInfo createState() => _BasicInfo();
}

class _BasicInfo extends State<BasicInformation> {
  final TextEditingController hotelName = TextEditingController();
  final TextEditingController hotelAddress = TextEditingController();
  final TextEditingController hotelPinCode = TextEditingController();
  final TextEditingController hotelCity = TextEditingController();
  final TextEditingController hotelWebsite = TextEditingController();
  final TextEditingController hotelPhoneNumber = TextEditingController();
  final TextEditingController hotelEmail = TextEditingController();
  final TextEditingController hotelChainName = TextEditingController();
  final GlobalKey<FormState> _vendorFormKey = GlobalKey<FormState>();
  bool chk1 = false,
      chk2 = false,
      chk3 = false,
      chk4 = false,
      chk5 = false,
      chk6 = false,
      chk7 = false,
      chk8 = false,
      chk9 = false,
      chk10 = false,
      chk11 = false,
      chk12 = false,
      chk13 = false,
      chk14 = false,
      chk15 = false,
      chk16 = false,
      chk17 = false,
      chk18 = false,
      chk19 = false,
      chk20 = false,
      chk21 = false,
      chk22 = false,
      chk23 = false,
      chk24 = false,
      chk25 = false,
      chk26 = false,
      chk27 = false,
      chk28 = false,
      chk29 = false,
      chk30 = false,
      chk31 = false,
      chk32 = false,
      chk33 = false,
      chk34 = false,
      chk35 = false,
      chk36 = false,
      chk37 = false;
  String hotelType = "Hotel", hotelStars = "One";
  TimeOfDay _checkInTime = TimeOfDay.now();
  TimeOfDay _checkOutTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    // double _screenWidth = MediaQuery.of(context).size.width,
    //     _screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                "images/login.png",
                height: 240.0,
                width: 240.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Login to your account",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Form(
              key: _vendorFormKey,
              child: Column(
                children: [
                  // CustomTextField(
                  //   controller: hotelName,
                  //   hintText: "Enter the Property Name",
                  //   isObsecure: false,
                  // ),
                  CustomTextField(
                    controller: hotelChainName,
                    hintText: "Enter the Hotel Chain Name (if any)",
                    isObsecure: false,
                  ),
                  DropdownButton<String>(
                    value: hotelType,
                    hint: Text("Property Type"),
                    icon: Icon(Icons.keyboard_arrow_down),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.black),
                    underline: Container(
                      height: 2,
                      color: Colors.black,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        hotelType = newValue;
                      });
                    },
                    items: <String>[
                      'Hotel',
                      'Bed & Breakfast',
                      'Guesthouse',
                      'Serviced Appartment',
                      'House/Apartment',
                      'Hostel',
                      'Camping Site',
                      'Hostal',
                      'Casa Rural',
                      'Motel',
                      'Resort',
                      'Pousada',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  /*   DropdownButton<String>(
                    value: hotelStars,
                    hint: Text("Property Type"),
                    icon: Icon(Icons.keyboard_arrow_down),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.black),
                    underline: Container(
                      height: 2,
                      color: Colors.black,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        hotelType = newValue;
                      });
                    },
                    items: <String>[
                      'No Star Classification',
                      'One',
                      'Two',
                      'Three',
                      'Four',
                      'Five',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),*/
                  CustomTextField(
                    controller: hotelAddress,
                    hintText: "Enter the Property Address",
                    isObsecure: false,
                  ),
                  CustomTextField(
                    controller: hotelPinCode,
                    hintText: "Enter the Pin Code",
                    isObsecure: false,
                  ),
                  CustomTextField(
                    controller: hotelCity,
                    hintText: "Enter the City Name",
                    isObsecure: false,
                  ),
                  ListTile(
                    title: Text(
                        "Check out Date: ${_checkInTime.hour}, ${_checkInTime.minute},"),
                    trailing: Icon(Icons.keyboard_arrow_down),
                    onTap: _pickCheckInTime,
                  ),
                  ListTile(
                    title: Text(
                        "Check out Date: ${_checkOutTime.hour}, ${_checkOutTime.minute},"),
                    trailing: Icon(Icons.keyboard_arrow_down),
                    onTap: _pickCheckOutTime,
                  ),
                  CustomTextField(
                    controller: hotelEmail,
                    hintText: "Enter the Property Email",
                    isObsecure: false,
                  ),
                  CustomTextField(
                    controller: hotelWebsite,
                    hintText: "Enter the Property Website",
                    isObsecure: false,
                  ),
                  TextField(
                    decoration:
                        new InputDecoration(labelText: "Enter your number"),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ], // Only numbers can be entered
                  ),
                  RaisedButton(
                    onPressed: _showDialogFacilities,
                    child: Text('Facilities & Services',
                        style: TextStyle(fontSize: 20)),
                  ),
                  RaisedButton(
                    onPressed: _showDialogHealthAndWellness,
                    child: Text('Health and Wellness',
                        style: TextStyle(fontSize: 20)),
                  ),
                  RaisedButton(
                    onPressed: _showDialogFoodAndBeverage,
                    child:
                        Text('Food & Beverage', style: TextStyle(fontSize: 20)),
                  ),
                  RaisedButton(
                    onPressed: _showDialogRoomAmenities,
                    child:
                        Text('Room amenities', style: TextStyle(fontSize: 20)),
                  ),
                  //_showDialogFamilyFriendlyFeatures
                  RaisedButton(
                    onPressed: _showDialogAccessibility,
                    child:
                        Text('Accessibility', style: TextStyle(fontSize: 20)),
                  ),
                  RaisedButton(
                    onPressed: _showDialogPaymentMethods,
                    child:
                        Text('Payment Methods', style: TextStyle(fontSize: 20)),
                  ),
                  RaisedButton(
                    onPressed: _showDialogFamilyFriendlyFeatures,
                    child: Text('Family-Friendly features',
                        style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _pickCheckInTime() async {
    TimeOfDay time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 10, minute: 47),
    );
    if (_checkInTime != null)
      setState(() {
        _checkInTime = time;
      });
  }

  _pickCheckOutTime() async {
    TimeOfDay time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 10, minute: 47),
    );
    if (_checkInTime != null)
      setState(() {
        _checkOutTime = time;
      });
  }

  void _showDialogFacilities() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        //  return StatefulBuilder(
        // StatefulBuilder
        // builder: (context, setState) {
        return AlertDialog(
          contentPadding: EdgeInsets.only(left: 25, right: 25),
          title: Center(child: Text("Facilities and Services")),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          //   actions: <Widget>[
          content: Container(
            width: 400,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Choose the amenities",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 2,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CheckboxListTile(
                    value: chk1,
                    title: Text("Business Center"),
                    onChanged: (value) {
                      setState(() {
                        chk1 = value;
                        // if (value == true) {
                        //   amenities('Business Center', '1');
                        // } else {
                        //   amenities('Business Center', '0');
                        // }
                      });
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: chk2,
                    title: Text("Disco/Night club"),
                    onChanged: (value) {
                      setState(() {
                        chk2 = value;
                      });
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Elevator"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Terrace"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Bell service"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Pets allowed"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Hotel safe"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Conference Rooms"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Non-Smoking Rooms"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Computer with Internet"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Casino"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("24-hour reception"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Laundry service"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Washing machine"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Ironing board"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Hypoallergenic rooms"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Doctor on site"),
                    onChanged: (value) {
                      setState(() {
                        if (value == true) {
                          //                       Firestore.instance.collection('vendors').document(fUser.uid).setData({
                          //   'uid': fUser.uid,
                          //   'email': fUser.email,
                          //   'name': fullName,
                          //   'password': _passwordTextEditingController.text.trim(),
                          //   'phone': _phoneTextEditingController.text.trim(),
                          //   'hotel_name': _hotelNameTextEditingController.text.trim(),
                          // });

/*

  Future<void> getUserDoc() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final Firestore _firestore = Firestore.instance;

    FirebaseUser user = await _auth.currentUser();
    DocumentReference ref = _firestore.collection('users').document(user.uid);
    return ref.setData({'UID': user.uid});
  }
*/

                        }
                      });
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Concierge"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Free Wi-Fi"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Free parking"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Airport shuttle"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("ATM"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),

                  SizedBox(
                    height: 5,
                  ),
                  // actions: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Material(
                        elevation: 5.0,
                        color: Colors.blue[900],
                        child: MaterialButton(
                          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                          onPressed: () {
                            if (chk1 == true) {
                              amenities('Business_Center','1');
                            }
                          },
                          child: Text("Save",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              )),
                        ),
                      ),
                      Material(
                        elevation: 5.0,
                        color: Colors.blue[900],
                        child: MaterialButton(
                          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                          onPressed: () {
                            setState(() {
                              Navigator.of(context).pop();
                            });
                          },
                          child: Text("Cancel",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              )),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 10,
                  ),
                ],
                // ],
              ),
            ),
          ),
          //   ],
        );
      },
      // );
      //  },
    );
  }

  void _showDialogHealthAndWellness() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        //  return StatefulBuilder(
        // StatefulBuilder
        // builder: (context, setState) {
        return AlertDialog(
          contentPadding: EdgeInsets.only(left: 25, right: 25),
          title: Center(child: Text("Health and Wellness")),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          //   actions: <Widget>[
          content: Container(
            width: 400,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Choose the amenities",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 2,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Beauty Salon"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Steam Room"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Gym"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Hairdresser"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Outdoor Swimming Pool"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Indoor Swimming Pool"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Massage"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Sauna"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Solarium"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Direct Beach Access"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Beach/Sun Umbrellas"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Towels at the pool/beach"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Wellness center/Spa"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Whirlpool/Hot tub"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Hydrotherapy"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Body Treatments"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Turkish Baths/Hammam"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Hot Stone Massage"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  // actions: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Material(
                        elevation: 5.0,
                        color: Colors.blue[900],
                        child: MaterialButton(
                          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                          onPressed: () {},
                          child: Text("Save",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              )),
                        ),
                      ),
                      Material(
                        elevation: 5.0,
                        color: Colors.blue[900],
                        child: MaterialButton(
                          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                          onPressed: () {
                            setState(() {
                              Navigator.of(context).pop();
                            });
                          },
                          child: Text("Cancel",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              )),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 10,
                  ),
                ],
                // ],
              ),
            ),
          ),
          //   ],
        );
      },
      // );
      //  },
    );
  }

  void _showDialogRoomAmenities() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        //  return StatefulBuilder(
        // StatefulBuilder
        // builder: (context, setState) {
        return AlertDialog(
          contentPadding: EdgeInsets.only(left: 25, right: 25),
          title: Center(child: Text("Room amenities")),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          //   actions: <Widget>[
          content: Container(
            width: 400,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Choose the amenities",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 2,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Balcony/Patio"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Bathroom with bathtub"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("TV"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Bathroom with shower"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Hairdryer"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Central heating"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("AC"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Cosmetic mirror"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Satellite TV"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Desk"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Telephone"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Cable TV"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Self catering"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Microwave"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Refrigerator"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Fan"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Free Wi-Fi"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Hypoallergenic  bedding"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  // actions: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Material(
                        elevation: 5.0,
                        color: Colors.blue[900],
                        child: MaterialButton(
                          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                          onPressed: () {},
                          child: Text("Save",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              )),
                        ),
                      ),
                      Material(
                        elevation: 5.0,
                        color: Colors.blue[900],
                        child: MaterialButton(
                          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                          onPressed: () {
                            setState(() {
                              Navigator.of(context).pop();
                            });
                          },
                          child: Text("Cancel",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              )),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 10,
                  ),
                ],
                // ],
              ),
            ),
          ),
          //   ],
        );
      },
      // );
      //  },
    );
  }

// ignore: unused_element
  void _showDialogFoodAndBeverage() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        //  return StatefulBuilder(
        // StatefulBuilder
        // builder: (context, setState) {
        return AlertDialog(
          contentPadding: EdgeInsets.only(left: 25, right: 25),
          title: Center(child: Text("Food and Beverage")),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          //   actions: <Widget>[
          content: Container(
            width: 400,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Choose the amenities",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 2,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Hotel Bar"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Pool Bar"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Restaurant"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Serves Halal Food"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Serves Kosher Food"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),

                  // actions: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Material(
                        elevation: 5.0,
                        color: Colors.blue[900],
                        child: MaterialButton(
                          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                          onPressed: () {},
                          child: Text("Save",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              )),
                        ),
                      ),
                      Material(
                        elevation: 5.0,
                        color: Colors.blue[900],
                        child: MaterialButton(
                          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                          onPressed: () {
                            setState(() {
                              Navigator.of(context).pop();
                            });
                          },
                          child: Text("Cancel",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              )),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 10,
                  ),
                ],
                // ],
              ),
            ),
          ),
          //   ],
        );
      },
      // );
      //  },
    );
  }

  void _showDialogAccessibility() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        //  return StatefulBuilder(
        // StatefulBuilder
        // builder: (context, setState) {
        return AlertDialog(
          contentPadding: EdgeInsets.only(left: 25, right: 25),
          title: Center(child: Text("Accessibilty")),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          //   actions: <Widget>[
          content: Container(
            width: 400,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Choose the amenities",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 2,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Accessible paths/hallways"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Accessible bathroom facilities"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Accessible parking"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("in room accessibility"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Deaf accessibility equipment"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),

                  // actions: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Material(
                        elevation: 5.0,
                        color: Colors.blue[900],
                        child: MaterialButton(
                          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                          onPressed: () {},
                          child: Text("Save",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              )),
                        ),
                      ),
                      Material(
                        elevation: 5.0,
                        color: Colors.blue[900],
                        child: MaterialButton(
                          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                          onPressed: () {
                            setState(() {
                              Navigator.of(context).pop();
                            });
                          },
                          child: Text("Cancel",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              )),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 10,
                  ),
                ],
                // ],
              ),
            ),
          ),
          //   ],
        );
      },
      // );
      //  },
    );
  }

  void _showDialogPaymentMethods() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        //  return StatefulBuilder(
        // StatefulBuilder
        // builder: (context, setState) {
        return AlertDialog(
          contentPadding: EdgeInsets.only(left: 25, right: 25),
          title: Center(child: Text("Payment methods")),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          //   actions: <Widget>[
          content: Container(
            width: 400,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Choose the methods",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 2,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Cash"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Check"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Cheque"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Billing to corporate accounts"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("EC/Maestro/Debit card"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("American Express"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Diners club"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Master card"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("JCB"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Internet Banking"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Visa"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Traveler's cheques"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("SZEP cards"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),

                  // actions: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Material(
                        elevation: 5.0,
                        color: Colors.blue[900],
                        child: MaterialButton(
                          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                          onPressed: () {},
                          child: Text("Save",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              )),
                        ),
                      ),
                      Material(
                        elevation: 5.0,
                        color: Colors.blue[900],
                        child: MaterialButton(
                          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                          onPressed: () {
                            setState(() {
                              Navigator.of(context).pop();
                            });
                          },
                          child: Text("Cancel",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              )),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 10,
                  ),
                ],
                // ],
              ),
            ),
          ),
          //   ],
        );
      },
      // );
      //  },
    );
  }

  void _showDialogFamilyFriendlyFeatures() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        //  return StatefulBuilder(
        // StatefulBuilder
        // builder: (context, setState) {
        return AlertDialog(
          contentPadding: EdgeInsets.only(left: 25, right: 25),
          title: Center(child: Text("Accessibilty")),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          //   actions: <Widget>[
          content: Container(
            width: 400,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Choose the amenities",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 2,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Child/Baby crib"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Children/babysitting"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Kid's Playground"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Kid's clubs"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Organized activities for kids"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),

                  // actions: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Material(
                        elevation: 5.0,
                        color: Colors.blue[900],
                        child: MaterialButton(
                          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                          onPressed: () {},
                          child: Text("Save",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              )),
                        ),
                      ),
                      Material(
                        elevation: 5.0,
                        color: Colors.blue[900],
                        child: MaterialButton(
                          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                          onPressed: () {
                            setState(() {
                              Navigator.of(context).pop();
                            });
                          },
                          child: Text("Cancel",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              )),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 10,
                  ),
                ],
                // ],
              ),
            ),
          ),
          //   ],
        );
      },
      // );
      //  },
    );
  }

  Future<void> amenities(String amm, String val) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final Firestore _firestore = Firestore.instance;

    FirebaseUser user = await _auth.currentUser();
    DocumentReference ref = _firestore
        .collection('vendors')
        .document(user.uid)
        .collection('amenities')
        .document('facilities_and_services');
    return ref.setData({amm: val});
  }
}
