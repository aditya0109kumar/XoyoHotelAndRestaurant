// import 'package:e_shop/Admin/admin_drawer.dart';
// import 'package:e_shop/Vendors/PropertyDetails.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//import 'BasicInformation.dart';
import 'PropertyDetailForm.dart';
import 'VendorDrawer.dart';

void main() {
  runApp(new VendorDashBoard());
}

class VendorDashBoard extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Vendor Dashboard',
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

class MyHomePage extends StatefulWidget 
{ 
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
          "images/xoyo_vendor_text.png",
          height: 50,
          //width: 150,
        ),
        centerTitle: true,
      ),
      drawer: VendorDrawer(),
      body: new ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          // Container(
          //   height: 50,
          //   color: Colors.amber[600],
          //   child: RaisedButton(
          //     textColor: Colors.white,
          //     color: Colors.blue,
          //     child: Text('Property Details'),
          //     onPressed: () {
          //       Route route =
          //           MaterialPageRoute(builder: (c) => PropertyDetails());
          //       Navigator.pushReplacement(context, route);
          //     },
          //   ),

          // ),

          Divider(
            height: 10,
          ),
          InkWell(
            child: Container(
              height: 150.0,
              width: 150.0,
              decoration: BoxDecoration(
                // color: Colors.blue,
                // shape: BoxShape.circle,
                image: DecorationImage(
                  scale: 0.5,
                  image: AssetImage('images/property_details.jpg'),
                ),
                // boxShadow: [
                //   BoxShadow(
                //     offset: const Offset(3.0, 3.0),
                //     blurRadius: 5.0,
                //     spreadRadius: 2.0,
                //   ),
                // ]
              ),
            ),
            onTap: () {
              Route route =
                  MaterialPageRoute(builder: (c) => PropertyDetailsPage());
              Navigator.pushReplacement(context, route);
            },
          ),
          Center(
            child: Text(
              "Property Details",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            height: 10,
          ),
          // Container(
          //   height: 50,
          //   color: Colors.amber[500],
          //   child: RaisedButton(
          //     textColor: Colors.white,
          //     color: Colors.blue,
          //     child: Text('Profile Performance'),
          //     onPressed: () {},
          //   ),
          // ),
          Divider(
            height: 10,
          ),
          InkWell(
            child: Container(
              height: 125.0,
              width: 125.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  scale: 0.5,
                  image: AssetImage('images/performance.jpg'),
                ),
                // color: Colors.blue,
                // shape: BoxShape.circle,
                // boxShadow: [
                //   BoxShadow(
                //     offset: const Offset(3.0, 3.0),
                //     blurRadius: 5.0,
                //     spreadRadius: 2.0,
                //   ),
                // ]
              ),
            ),
            onTap: () {
              print("Tapped on container");
            },
          ),
          Center(
            child: Text(
              "Performance",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            height: 10,
          ),
          // Container(
          //   height: 50,
          //   color: Colors.amber[100],
          //   child: RaisedButton(
          //     textColor: Colors.white,
          //     color: Colors.blue,
          //     child: Text('Guest Ratings'),
          //     onPressed: () {},
          //   ),
          // ),
          Divider(
            height: 10,
          ),
          InkWell(
            child: Container(
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  scale: 0.5,
                  image: AssetImage('images/ratings.jpg'),
                ),
                // color: Colors.blue,
                // shape: BoxShape.circle,
                // boxShadow: [
                //   BoxShadow(
                //     offset: const Offset(3.0, 3.0),
                //     blurRadius: 5.0,
                //     spreadRadius: 2.0,
                //   ),
                // ]
              ),
            ),
            onTap: () {
              print("Tapped on container");
            },
          ),
          Center(
            child: Text(
              "Ratings",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            height: 10,
          ),
        ],
      ),
    );
  }

  // ignore: missing_return
  Future<Null> propertyDetails() {
    Route route = MaterialPageRoute(builder: (c) => PropertyDetailsPage());
    Navigator.pushReplacement(context, route);
  }
}
