import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:e_shop/Admin/uploadItems.dart';
// import 'package:e_shop/Admin/uploadItemsCopy.dart';
import 'package:e_shop/Authentication/authenication.dart';
import 'package:e_shop/Widgets/customTextField.dart';
import 'package:e_shop/DialogBox/errorDialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'adminDashboard.dart';

class AdminSignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              colors: [Colors.blue, Colors.blue],
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
      body: AdminSignInScreen(),
    );
  }
}

class AdminSignInScreen extends StatefulWidget {
  @override
  _AdminSignInScreenState createState() => _AdminSignInScreenState();
}

class _AdminSignInScreenState extends State<AdminSignInScreen> {
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final TextEditingController _adminIDTextEditingController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    // _screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors: [Colors.blue, Colors.blue],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                "images/admin.png",
                height: 240.0,
                width: 240.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Admin",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    height: 100.0,
                    width: 300.0,
                    child: TextField(
                      controller: _adminIDTextEditingController,
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                      cursorColor: Colors.white,
                      //  data: Icons.lock,
                      decoration: InputDecoration(
                        icon: new Icon(
                          Icons.person,
                          color: Colors.pink,
                        ),
                        border: InputBorder.none,
                        // hintText: 'Enter Admin Password',
                        hintStyle:
                            TextStyle(fontSize: 20.0, color: Colors.white),
                        labelText: 'Admin Password',
                        labelStyle:
                            TextStyle(fontSize: 20.0, color: Colors.white),
                        hoverColor: Colors.blue[400],
                        fillColor: Colors.green[300],
                      ),
                      obscureText: true,
                    ),
                  ),
                  // CustomTextField(
                  //   controller: _adminIDTextEditingController,
                  //   data: Icons.person,
                  //   hintText: "Admin id",
                  //   isObsecure: false,
                  //   // color: Colors.white,
                  // ),
// TextField(
//   decoration: InputDecoration(
//     border: InputBorder.none,
//     hintText: 'Admin'
//   ),
// ),
                  Container(
                    height: 100.0,
                    width: 300.0,
                    child: TextField(
                      controller: _passwordTextEditingController,
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                      cursorColor: Colors.white,
                      //  data: Icons.lock,
                      decoration: InputDecoration(
                        icon: new Icon(
                          Icons.lock,
                          color: Colors.pink,
                        ),
                        border: InputBorder.none,
                        // hintText: 'Enter Admin Password',
                        hintStyle:
                            TextStyle(fontSize: 20.0, color: Colors.white),
                        labelText: 'Admin Password',
                        labelStyle:
                            TextStyle(fontSize: 20.0, color: Colors.white),
                        hoverColor: Colors.blue[400],
                        fillColor: Colors.green[300],
                      ),
                      obscureText: true,
                    ),
                  ),
                ],
              ),
            ),
            RaisedButton(
              onPressed: () {
                _adminIDTextEditingController.text.isNotEmpty &&
                        _passwordTextEditingController.text.isNotEmpty
                    ? loginAdmin()
                    : showDialog(
                        context: context,
                        builder: (c) {
                          return ErrorAlertDialog(
                            message: "Please fill the details",
                          );
                        });
              },
              color: Colors.pink,
              child: Text(
                "Sign in",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              height: 4.0,
              width: _screenWidth * 0.8,
              color: Colors.white,
            ),
            SizedBox(
              height: 20.0,
            ),
            FlatButton.icon(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AuthenticScreen())),
              icon: (Icon(
                Icons.nature_people,
                color: Colors.pink,
              )),
              label: Text(
                "I'm not an Admin",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 50.0,
            )
          ],
        ),
      ),
    );
  }

  loginAdmin() {
    Firestore.instance.collection("admins").getDocuments().then((snapshot) {
      snapshot.documents.forEach((result) async {
        if (result.data["id"] != _adminIDTextEditingController.text.trim()) {
          final snackBar = SnackBar(content: Text('Your ID is not correct'));
          Scaffold.of(context).showSnackBar(snackBar);
        } else if (result.data["password"] !=
            _passwordTextEditingController.text.trim()) {
          final snackBar =
              SnackBar(content: Text('Your Password is incorrect'));
          Scaffold.of(context).showSnackBar(snackBar);
        } else {
          final snackBar = SnackBar(
            content: Text('Welcome Admin ' + result.data["name"]),
          );
          Scaffold.of(context).showSnackBar(snackBar);

          setState(() {
            _adminIDTextEditingController.text = "";
            _passwordTextEditingController.text = "";
          });
          final FirebaseAuth auth = FirebaseAuth.instance;
          final FirebaseUser user = await auth.currentUser();
          final uid = user.uid;
          print(uid);
          Route route = MaterialPageRoute(builder: (c) => AdminDashBoardPage());
          Navigator.pushReplacement(context, route);
        }
      });
    });
  }
}
