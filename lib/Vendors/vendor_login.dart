import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/Config/configForVendor.dart';
import 'package:e_shop/DialogBox/errorDialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'VendorDashBoard.dart';

class VendorLoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<VendorLoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: new BoxDecoration(
              gradient: new LinearGradient(colors: [Colors.red, Colors.white],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(2.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,),

            ),
          ),
          title: Image.asset("images/xoyo.png", height: 50, width: 150,),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.lock, color: Colors.white,),
                text: "Login",
              ),
              Tab(
                icon: Icon(Icons.perm_contact_calendar, color: Colors.white,),
                text: "Register",
              )
            ],
            indicatorColor: Colors.white,
            indicatorWeight: 5.0,
          ),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Vendor Login',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    
                    //forgot password screen
                  },
                  textColor: Colors.red,
                  child: Text('Forgot Password'),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.red,
                      child: Text('Login'),
                      onPressed: () {
                        vendorLoginMethod();
                      },
                    )),
                Container(
                    child: Row(
                  children: <Widget>[
                    Text('Does not have account?'),
                    FlatButton(
                      textColor: Colors.red,
                      child: Text(
                        'Sign in',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        //signup screen
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ))
              ],
            )));
  }
FirebaseAuth _auth = FirebaseAuth.instance;
  void vendorLoginMethod() async {
    final pr = ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false, showLogs: false);
    pr.style(
        message: 'Authenticating, Please wait',
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
            color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600));

    await pr.show();

    FirebaseUser firebaseUser;
    await _auth
        .signInWithEmailAndPassword(
      email: nameController.text,
      password: passwordController.text.trim(),
    )
        .then((authUser) {
      firebaseUser = authUser.user;
    }).catchError((error) {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (c) {
            return ErrorAlertDialog(
              message: error.message.toString(),
            );
          });
      if (firebaseUser != null) {
        readData(firebaseUser).then((s) {
          Navigator.pop(context);
          Route route = MaterialPageRoute(builder: (c) => VendorDashBoard());
          Navigator.pushReplacement(context, route);
        });
      }
    });
  }

  Future readData(FirebaseUser fUser) async {
    Firestore.instance
        .collection('users')
        .document(fUser.uid)
        .get()
        .then((dataSnapshot) async {
      await XoyoVendor.sharedPreferences
          .setString("uid", dataSnapshot.data[XoyoVendor.userUID]);
      await XoyoVendor.sharedPreferences
          .setString(XoyoVendor.userEmail, dataSnapshot.data[XoyoVendor.userEmail]);
      await XoyoVendor.sharedPreferences
          .setString(XoyoVendor.userName, dataSnapshot.data[XoyoVendor.userName]);
      
    });
  }
}
