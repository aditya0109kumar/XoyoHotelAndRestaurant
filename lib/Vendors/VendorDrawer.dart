// ignore: avoid_web_libraries_in_flutter
//import 'dart:js';
import 'package:flutter/material.dart';
//import 'package:multilevel_drawer/multilevel_drawer.dart';
// import 'package:path/path.dart';

class VendorDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.blue[700],
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 30,
                      bottom: 10,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('images/admin.png'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Text(
                    'Vendor',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text(
              'Profile',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          // ListTile(
          //   leading: Icon(Icons.person),
          //   title: Text(
          //     'Vendor Details',
          //     style: TextStyle(
          //       fontSize: 18,
          //     ),
          //   ),
          //   onTap: showVendorDetails,
          // ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: null,
          ),
        ],
      ),
    );
  }

  void showVendorDetails() {}
  //MaterialPageRoute(builder: (context) => VendorDetails());

  void showAddVendor() {}
}
