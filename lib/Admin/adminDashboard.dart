import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/Admin/uploadItems.dart';
import 'package:e_shop/Admin/uploadItemsCopy.dart';
import 'package:e_shop/Authentication/authenication.dart';
import 'package:e_shop/Widgets/customTextField.dart';
import 'package:e_shop/DialogBox/errorDialog.dart';
import 'package:flutter/material.dart';

class AdminDashBoardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              colors: [Colors.red, Colors.white],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(2.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        title: Image.asset(
          "images/xoyo.png",
          height: 50,
          width: 150,
        ),
        centerTitle: true,
      ),
      body: AdminDashBoardScreen(),
    );
  }
}

class AdminDashBoardScreen extends StatefulWidget {
  @override
  _AdminDashBoardScreenState createState() => _AdminDashBoardScreenState();
}

class _AdminDashBoardScreenState extends State<AdminDashBoardScreen> {
  final TextEditingController _firstNameTextEditingController =
      TextEditingController();
  final TextEditingController _secondNameTextEditingController =
      TextEditingController();

  Widget bodyData() => SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomTextField(
                controller: _firstNameTextEditingController,
                hintText: "First Name",
                isObsecure: false,
              ),
              CustomTextField(
                controller: _secondNameTextEditingController,
                hintText: "Second Name",
                isObsecure: false,
              ),
              CustomTextField(
                
              )
            ]),
      );
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double _screenWidth = MediaQuery.of(context).size.width,
        _screenHeight = MediaQuery.of(context).size.height;

    Container(
      child: bodyData(),
    );

    throw UnimplementedError();
  }
}

class Name {
  String firstName;
  String lastName;

  Name({this.firstName, this.lastName});
}

var names = <Name>[
  Name(firstName: "Hotel", lastName: "Mandakini"),
  Name(firstName: "Landmark", lastName: "Hotel"),
  Name(firstName: "Hotel", lastName: "Presidency"),
];
