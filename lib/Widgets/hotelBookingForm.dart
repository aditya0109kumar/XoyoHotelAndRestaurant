// ignore: avoid_web_libraries_in_flutter
//import 'dart:html';

import 'package:e_shop/Admin/adminLogin.dart';
import 'package:e_shop/Widgets/customTextField.dart';
import 'package:e_shop/DialogBox/errorDialog.dart';
import 'package:e_shop/DialogBox/loadingDialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Store/storehome.dart';
import 'package:e_shop/Config/config.dart';

// ignore: camel_case_types
class booking extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return bookingState();
  }
}

// ignore: camel_case_types
class bookingState extends State<booking> {
  final TextEditingController _firstNameTextEditingController =
      TextEditingController();
  final TextEditingController _lastNameTextEditingController =
      TextEditingController();
  DateTime _chkInDate = DateTime.now();
  DateTime _chkOutDate = DateTime.now();
  String dropdownValue = 'One';
  String _noOfRooms;
  String _noOfAdults = "One";
  String _noOfChildren;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Colors.red[800],
            Colors.red[700],
            Colors.red[600],
            Colors.red[400],
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar:
            AppBar(backgroundColor: Colors.red, title: Text("Hotel Booking")),
        body:
            /* Column(
        children: <Widget>[
          Text(_chkInDate == null ? 'Please Enter a Check in date':_chkInDate.toString()),
          RaisedButton(
            child: Text('Pick a date'),
            onPressed: (){
              showDatePicker(context: context, initialDate: _chkInDate==null ? DateTime.now() : _chkInDate,
              firstDate: DateTime(2019),
              lastDate: DateTime(2021)).then((date) {setState(() {
                _chkInDate=date;});
            }
          );}),
        ],
      ), */
            SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomTextField(
                controller: _firstNameTextEditingController,
                hintText: "First Name",
                isObsecure: false,
              ),
              CustomTextField(
                controller: _lastNameTextEditingController,
                hintText: "Last Name",
                color: Colors.yellow,
                isObsecure: false,
              ),
              Container(
                height: 50,
                margin: EdgeInsets.all(2),
                color: Colors.yellowAccent[400],
                child: Center(
                    child: Text(
                  "Check in Date",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                )),
              ),
              ListTile(
                title: Text(
                    "Check in Date: ${_chkInDate.year}, ${_chkInDate.month}, ${_chkInDate.day}"),
                trailing: Icon(Icons.keyboard_arrow_down),
                onTap: _pickChkInDate,
              ),
              Container(
                height: 50,
                margin: EdgeInsets.all(2),
                color: Colors.yellowAccent[400],
                child: Center(
                    child: Text(
                  "Check out Date",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                )),
              ),
              ListTile(
                title: Text(
                    "Check out Date: ${_chkOutDate.year}, ${_chkOutDate.month}, ${_chkOutDate.day}"),
                trailing: Icon(Icons.keyboard_arrow_down),
                onTap: _pickChkOutDate,
              ),
              Container(
                height: 50,
                margin: EdgeInsets.all(2),
                color: Colors.yellowAccent[400],
                child: Center(
                    child: Text(
                  "Number of Adults",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                )),
              ),
              Container(
                child: DropdownButton<String>(
                  value: _noOfAdults,
                  hint: Text("Number of Adults"),
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
                      _noOfAdults = newValue;
                    });
                  },
                  items: <String>['One', 'Two', 'Free', 'Four']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              Container(
                height: 50,
                margin: EdgeInsets.all(2),
                color: Colors.yellowAccent[400],
                child: Center(
                    child: Text(
                  "Number of Children (Less than 5 years of age)",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                )),
              ),
              Container(
                child: DropdownButton<String>(
                  value: _noOfChildren,
                  hint: Text("Number of Children"),
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
                      _noOfChildren = newValue;
                    });
                  },
                  items: <String>['One', 'Two', 'Free', 'Four']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              Container(
                height: 50,
                margin: EdgeInsets.all(2),
                color: Colors.yellowAccent[400],
                child: Center(
                    child: Text(
                  "Number of Rooms",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                )),
              ),
              Container(
                child: DropdownButton<String>(
                  value: _noOfRooms,
                  hint: Text("Number of Rooms"),
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
                      _noOfRooms = newValue;
                    });
                  },
                  items: <String>['One', 'Two', 'Free', 'Four']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              Center(
                child: FlatButton(
                  color: Colors.red[700],
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.blueAccent,
                  onPressed: () {
                    /*...*/
                  },
                  child: Text(
                    "Flat Button",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _pickChkInDate() async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
      initialDate: _chkInDate,
    );
    if (date != null)
      setState(() {
        _chkInDate = date;
      });
  }

  _pickChkOutDate() async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
      initialDate: _chkOutDate,
    );
    if (date != null)
      setState(() {
        _chkOutDate = date;
      });
  }
}
