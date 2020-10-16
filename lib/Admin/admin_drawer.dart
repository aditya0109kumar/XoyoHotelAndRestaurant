// ignore: avoid_web_libraries_in_flutter
//import 'dart:js';
import 'package:flutter/material.dart';
//import 'package:multilevel_drawer/multilevel_drawer.dart';
import 'package:path/path.dart';
import 'AddVendor.dart';

class AdminDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.blue,
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
                          image: NetworkImage(
                            'https://www.pinclipart.com/picdir/middle/122-1221261_admin-svg-png-icon-free-download-325788-sunny.png',
                          ),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Text(
                    'Admin',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text(
              'Add Vendor',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => AddVendor()),
              );
            },
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

  void showVendorDetails() {
    //MaterialPageRoute(builder: (context) => VendorDetails());
  }
  void showAddVendor() {}
}
