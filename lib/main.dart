// ignore: avoid_web_libraries_in_flutter
import 'dart:async';
// ignore: avoid_web_libraries_in_flutter
//import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/Counters/BookQuantity.dart';
import 'package:e_shop/testhomepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Admin/AddVendor.dart';
import 'Admin/adminDashboard.dart';
import 'Admin/adminLogin.dart';
import 'Authentication/LoginPageOtp.dart';
import 'Authentication/TESTOTP.dart';
import 'Authentication/authenication.dart';
import 'package:e_shop/Config/config.dart';
import 'Authentication/registerCreated.dart';
import 'Authentication/homeActivity.dart';
import 'Authentication/otpPage.dart';
import 'Authentication/register.dart';
import 'Counters/cartitemcounter.dart';
import 'Counters/changeAddresss.dart';
import 'Counters/totalMoney.dart';
import 'Store/storehome.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'Vendors/PropertyDetailForm.dart';
import 'Vendors/VendorDashBoard.dart';
import 'Vendors/vendor_login.dart';
import 'Widgets/hotelBookingForm.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Xoyo.auth = FirebaseAuth.instance;
  Xoyo.sharedPreferences = await SharedPreferences.getInstance();
  Xoyo.firestore = Firestore.instance;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'e-Shop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.green,
        ),
        home: SplashScreen()
        /* home: AnimatedSplashScreen(

              splash: Image.asset('images/burger.png'), nextScreen: AuthenticScreen(),splashTransition: SplashTransition.slideTransition,
              ), */

        //      ),
        );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    displaySplash();
  }

  displaySplash() {
    Timer(Duration(seconds: 5), () async {
      // if (await Xoyo.auth.currentUser() != null) {
      //   Route route = MaterialPageRoute(builder: (_) => StoreHome());
      //   Navigator.pushReplacement(context, route);
      // } else {
      Route route = MaterialPageRoute(builder: (_) => AdminSignInPage());
      Navigator.pushReplacement(context, route);
    }
        // }
        );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
              colors: [Colors.red, Colors.white],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(2.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "images/hotel_image.png",
                height: 300.0,
                width: 300.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Image.asset("images/xoyo.png")
            ],
          ),
        ),
      ),
    );
  }
}

/*

child: Center(
child: Column(
mainAxisAlignment:MainAxisAlignment.center ,
children : [Image.asset("images/burger.png", height: 300.0, width: 300.0,),
SizedBox(height: 20.0,),
Image.asset("images/xoyo.png")],
),
),

*/
