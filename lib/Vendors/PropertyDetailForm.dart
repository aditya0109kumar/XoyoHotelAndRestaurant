// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/Authentication/register.dart';
import 'package:e_shop/Vendors/uploadImages.dart';
// import 'package:e_shop/Config/configForVendor.dart';
// import 'package:e_shop/DialogBox/errorDialog.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:progress_dialog/progress_dialog.dart';

import 'BasicInformation.dart';
import 'UploadHotelImages.dart';
// import 'VendorDashBoard.dart';

class PropertyDetailsPage extends StatefulWidget {
  
  @override
  
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<PropertyDetailsPage> {
  
  @override
  Widget build(BuildContext context) {
    
    return DefaultTabController(
      
        length: 2,
        child: Scaffold(
          
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
              "images/xoyo_vendor_text.png",
              //height: 50,
              //width: 150,
            ), 
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  text: "Login",
                ),
                Tab(
                  icon: Icon(
                    Icons.perm_contact_calendar,
                    color: Colors.white,
                  ),
                  text: "Register",
                )
              ],
              indicatorColor: Colors.white,
              indicatorWeight: 5.0,
            ),
          ),
          body: Container(
              decoration: BoxDecoration(
                gradient: new LinearGradient(
                  colors: [Colors.red, Colors.white],
                  begin: Alignment.topRight,
                  end: Alignment.topLeft,
                ),
              ),
              child: TabBarView(
                children: [BasicInformation(), MultipleImagePicker()],
              )),
        ));
  }
}

/* 
import 'package:e_shop/Authentication/registerCreated.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';
import 'package:e_shop/Config/config.dart';


class AuthenticScreen extends StatefulWidget {
  @override
  _AuthenticScreenState createState() => _AuthenticScreenState();
}

class _AuthenticScreenState extends State<AuthenticScreen> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
        body: Container(
          decoration: BoxDecoration(
            gradient: new LinearGradient(colors: [Colors.red, Colors.white],
              begin: Alignment.topRight,
              end: Alignment.topLeft,

          ),
        ),
    child: TabBarView(
      children: [
        Login(),
        Register(),
    ],
    )
        ),
    )
    );
  }
}


*/
