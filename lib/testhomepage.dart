import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/Admin/uploadItems.dart';
import 'package:e_shop/Admin/uploadItemsCopy.dart';
import 'package:e_shop/Authentication/authenication.dart';
import 'package:e_shop/Widgets/customTextField.dart';
import 'package:e_shop/DialogBox/errorDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'Admin/adminLogin.dart';
import 'Vendors/vendor_login.dart';

void main() {
  runApp(new TestHomePage());
}
class TestHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2196f3),
        accentColor: const Color(0xFF2196f3),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    @override
    Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('App Name'),
          ),
        body: new Scaffold(
            body:
              new Container(
                child: Column(
                  children: [
                  new RaisedButton(key:null, onPressed:adminLoginButton,
                    color: const Color(0xFFe0e0e0),
                    child:
                      new Text(
                      "Admin Login",
                        style: new TextStyle(fontSize:12.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w200,
                        fontFamily: "Roboto"),
                      )
                    ),
                    new RaisedButton(key:null, onPressed:vendorLoginButton,
                    color: const Color(0xFFe0e0e0),
                    child:
                      new Text(
                      "Vendor Login",
                        style: new TextStyle(fontSize:12.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w200,
                        fontFamily: "Roboto"),
                      )
                    ),
                    new RaisedButton(key:null, onPressed:userLoginButton,
                    color: const Color(0xFFe0e0e0),
                    child:
                      new Text(
                      "User Login",
                        style: new TextStyle(fontSize:12.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w200,
                        fontFamily: "Roboto"),
                      )
                    ),
    
               /* padding: const EdgeInsets.all(0.0),
                alignment: Alignment.center*/]),
              ),
    
          )
    
      );
    }
    void adminLoginButton(){
      Route route = MaterialPageRoute(builder: (c) => AdminSignInPage());
        Navigator.pushReplacement(context, route);
    }

    void vendorLoginButton(){
      Route route = MaterialPageRoute(builder: (c) => VendorLoginPage());
        Navigator.pushReplacement(context, route);
    }

    void userLoginButton(){
      Route route = MaterialPageRoute(builder: (c) => AuthenticScreen());
        Navigator.pushReplacement(context, route);
    }


 
    
}