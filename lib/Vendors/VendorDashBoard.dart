import 'package:e_shop/Admin/admin_drawer.dart';
import 'package:flutter/material.dart';

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

class MyHomePage extends StatefulWidget {
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
      drawer: AdminDrawer(),
      body: new ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.amber[600],
            child: RaisedButton(
              textColor: Colors.white,
              color: Colors.red,
              child: Text('Property Details'),
              onPressed: () {},
            ),
          ),
          Container(
            height: 50,
            color: Colors.amber[500],
            child: RaisedButton(
              textColor: Colors.white,
              color: Colors.red,
              child: Text('Profile Performance'),
              onPressed: () {},
            ),
          ),
          Container(
            height: 50,
            color: Colors.amber[100],
            child: RaisedButton(
              textColor: Colors.white,
              color: Colors.red,
              child: Text('Guest Ratings'),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  void propertyDetails() {
    Route route = MaterialPageRoute(builder: (c) => VendorDashBoard());
    Navigator.pushReplacement(context, route);
  }
}
