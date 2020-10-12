import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/Admin/admin_drawer.dart';
import 'package:e_shop/Admin/uploadItems.dart';
import 'package:e_shop/Admin/uploadItemsCopy.dart';
import 'package:e_shop/Authentication/authenication.dart';
import 'package:e_shop/Config/configForAdmin.dart';
import 'package:e_shop/Widgets/customTextField.dart';
import 'package:e_shop/DialogBox/errorDialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:e_shop/Admin/adminDashboard.dart';
import 'package:tel_input/tel_input.dart';

class AddVendor extends StatelessWidget {
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
          "images/xoyo_admin_text.png",
          height: 50,
          width: 150,
        ),
        centerTitle: true,
      ),
      body: AddVendorScreen(),
    );
  }
}

class AddVendorScreen extends StatefulWidget {
  @override
  _AddVendorScreenState createState() => _AddVendorScreenState();
}

class _AddVendorScreenState extends State<AddVendorScreen> {
  String ccode = "+91";
  final TextEditingController _firstNameTextEditingController =
      TextEditingController();
  final TextEditingController _lastNameTextEditingController =
      TextEditingController();
  final TextEditingController _phoneTextEditingController =
      TextEditingController();
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final TextEditingController _cPasswordTextEditingController =
      TextEditingController();
  final TextEditingController _hotelNameTextEditingController =
      TextEditingController();
  String title = "Mr.", jobPosition = "Brand Manager";
  final GlobalKey<FormState> _addVendorFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width,
        _screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 8.0,
          ),
          Form(
            key: _addVendorFormKey,
            child: Column(
              children: [
                CustomTextField(
                  controller: _emailTextEditingController,
                  data: Icons.email,
                  hintText: "Email",
                  isObsecure: false,
                ),
                CustomTextField(
                  controller: _passwordTextEditingController,
                  data: Icons.lock,
                  hintText: "Enter a strong password",
                  isObsecure: true,
                ),
                CustomTextField(
                  controller: _cPasswordTextEditingController,
                  data: Icons.lock,
                  hintText: "Confirm the password",
                  isObsecure: true,
                ),
                DropdownButton<String>(
                  value: title,
                  hint: Text("Title"),
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
                      title = newValue;
                    });
                  },
                  items: <String>[
                    'Mr.',
                    'Ms.',
                    'Mrs.',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                CustomTextField(
                  controller: _firstNameTextEditingController,
                  data: Icons.person,
                  hintText: "First Name",
                  isObsecure: false,
                ),
                CustomTextField(
                  controller: _lastNameTextEditingController,
                  data: Icons.person,
                  hintText: "Last Name",
                  isObsecure: false,
                ),
                TextField(
                  maxLengthEnforced: true,
                  maxLength: 10,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone Number',
                  ),
                ),
                DropdownButton<String>(
                  value: jobPosition,
                  hint: Text("Job Position in the Business"),
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
                      jobPosition = newValue;
                    });
                  },
                  items: <String>[
                    'Assistant Manager',
                    'Brand Manager',
                    'Director of Business Development',
                    'Director of E-Commerce',
                    'Finance Manager',
                    'Front-office Employee',
                    'Front-office Manager',
                    'Marketing Manager',
                    'Owner',
                    'Receptionist',
                    'Reservations Employee',
                    'Reservations Manager',
                    'Revenue Manager',
                    'Rooms Division Manager',
                    'Sales & Marketing Manager',
                    'Sales Manager',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                TextFormField(
                  controller: _phoneTextEditingController,
                  inputFormatters: <TextInputFormatter>[
                    LengthLimitingTextInputFormatter(10),
                    WhitelistingTextInputFormatter.digitsOnly,
                    BlacklistingTextInputFormatter.singleLineFormatter,
                  ],
                ),
                CustomTextField(
                  controller: _hotelNameTextEditingController,
                  data: Icons.lock,
                  hintText: "Name of the Hotel",
                  isObsecure: false,
                ),
              ],
            ),
          ),
          RaisedButton(
            onPressed: () {
              registerButton();
            },
            color: Colors.red[700],
            child: Text(
              "Register Hotel",
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Container(
            height: 4.0,
            width: _screenWidth * 0.8,
            color: Colors.red[700],
          ),
          SizedBox(
            height: 15.0,
          ),
        ],
      ),
    );
  }

  // ignore: missing_return
  Future<void> registerButton() {
    /*  if (_imageFile == null) {
      showDialog(
          context: context,
          builder: (c) {
            return ErrorAlertDialog(
              message: "Please select an Image",
            );
          });
    } else */
    if (_firstNameTextEditingController == null ||
        _lastNameTextEditingController == null ||
        _phoneTextEditingController == null ||
        _emailTextEditingController == null ||
        _passwordTextEditingController == null ||
        _cPasswordTextEditingController == null ||
        _hotelNameTextEditingController == null) {
      showDialog(
          context: context,
          builder: (c) {
            return ErrorAlertDialog(
              message: "Please complete all the fields",
            );
          });
    } else {
      _passwordTextEditingController.text ==
              _cPasswordTextEditingController.text
          ? /*_phoneTextEditingController.text.isNotEmpty &&
                  _emailTextEditingController.text.isNotEmpty &&
                  _passwordTextEditingController.text.isNotEmpty &&
                  _cPasswordTextEditingController.text.isNotEmpty &&
                  _firstNameTextEditingController.text.isNotEmpty &&
                  _lastNameTextEditingController.text.isNotEmpty &&
                  _hotelNameTextEditingController.text.isNotEmpty
              ? */
          _registerUser()
          : displayDialog("Please fill up the registration form completely");
      // : displayDialog("Password does not match");
    }

    /* else if (_passwordTextEditingController.text !=
        _cPasswordTextEditingController.text) {
      displayDialog("Password does not match");
    } else if (_phoneTextEditingController.text.isNotEmpty &&
        _passwordTextEditingController.text.isNotEmpty &&
        _cPasswordTextEditingController.text.isNotEmpty &&
        _nameTextEditingController.text.isNotEmpty) {
      uploadToStorage();
    } */
  }

  void _registerUser() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseUser firebaseUser;
    await _auth
        .createUserWithEmailAndPassword(
      email: _emailTextEditingController.text.trim(),
      password: _passwordTextEditingController.text.trim(),
    )
        .then((auth) {
      firebaseUser = auth.user;
    }).catchError((error) {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (c) {
            return ErrorAlertDialog(
              message: error.message.toString(),
            );
          });
    });

    if (firebaseUser != null) {
      saveUserInfoToFireStore(firebaseUser).then((value) {
        Navigator.pop(context);
        Route route = MaterialPageRoute(builder: (c) => AdminDashBoardPage());
        Navigator.pushReplacement(context, route);
      });
    }
  }

  Future saveUserInfoToFireStore(FirebaseUser fUser) async {
    final pr = ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false, showLogs: false);
    pr.style(
      message: 'Registering, Please wait',
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      progressWidget: CircularProgressIndicator(),
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
      progress: 0.0,
      maxProgress: 100.0,
      progressTextStyle: TextStyle(
          color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
      messageTextStyle: TextStyle(
          color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
    );
    await pr.show();

    String fullName = _firstNameTextEditingController.text.trim() +
        " " +
        _lastNameTextEditingController.text.trim();
    Firestore.instance.collection('vendors').document(fUser.uid).setData({
      'uid': fUser.uid,
      'email': fUser.email,
      'name': fullName,
      'password': _passwordTextEditingController.text.trim(),
      'phone': _phoneTextEditingController.text
          .trim(), // _phoneTextEditingController.text.trim(),
      'hotel_name': _hotelNameTextEditingController.text.trim(),
    });

    // await XoyoAdmin.sharedPreferences.setString("uid", fUser.uid);
    // // await Xoyo.sharedPreferences.setString(Xoyo.userUID, fUser.uid);
    // await XoyoAdmin.sharedPreferences
    //     .setString(XoyoAdmin.userEmail, fUser.email);
    // await XoyoAdmin.sharedPreferences.setString(XoyoAdmin.userName, fullName);
    // //await XoyoAdmin.sharedPreferences.setString(Xoyo.userAvatarUrl, userImageUrl);
    // //await Xoyo.sharedPreferences.setStringList(Xoyo.userCartList, ["garbageValue"]);

    pr.hide().then((isHidden) {
      print(isHidden);
    });

    // Navigator.pop(context);
    // Route route = MaterialPageRoute(builder: (context) => AdminDashBoardPage());
    // Navigator.pushReplacement(context, route);

    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => AdminDashBoardPage()),
    );
  }

  displayDialog(String msg) {
    showDialog(
        context: context,
        builder: (c) {
          return ErrorAlertDialog(
            message: msg,
          );
        });
  }
}
