import 'package:country_code_picker/country_code_picker.dart';
import 'package:e_shop/Widgets/customTextField.dart';
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
  String hotelType = "Hotel", hotelStars = "One";
  TimeOfDay _checkInTime = TimeOfDay.now();
  TimeOfDay _checkOutTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width,
        _screenHeight = MediaQuery.of(context).size.height;

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
                  CustomTextField(
                    controller: hotelName,
                    hintText: "Enter the Property Name",
                    isObsecure: false,
                  ),
                  CustomTextField(
                    controller: hotelChainName,
                    hintText: "Enter the Hotel Chain Name",
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
                    onPressed: _showDialog,
                    child: Text('Facilities & Services',
                        style: TextStyle(fontSize: 20)),
                  ),
                  RaisedButton(
                    onPressed: _showDialogHealth,
                    child: Text('Facilities & Services',
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

  void _showDialog() {
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
                    "Facilities and Services",
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
                    title: Text("Business Center"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Disco/Night club"),
                    onChanged: (value) {
                      setState(() {});
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
                      setState(() {});
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

  void _showDialogHealth() {
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
                    "Facilities and Services",
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
                    title: Text("Business Center"),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  Divider(
                    height: 10,
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text("Disco/Night club"),
                    onChanged: (value) {
                      setState(() {});
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
                      setState(() {});
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
  
}

