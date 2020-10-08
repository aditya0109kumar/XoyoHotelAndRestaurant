import 'package:flutter/material.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';

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
            color: Theme.of(context).primaryColor,
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
                            'https://4.bp.blogspot.com/-ww35TX848nE/VwKzp_AExYI/AAAAAAAAACA/juHbkc0DQE4D_LLzUrldo1oQqrY6WV6lA/s400/apple_HLS.png',
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
            leading: Icon(Icons.person),
            title: Text(
              'Vendor Details',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap:showVendorDetails,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'Add Vendor',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: showAddVendor,
          ),
          ListTile(
            leading: Icon(Icons.arrow_back),
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
  void showAddVendor(){
   MaterialPageRoute(builder: (context) => AddVendor());
  }
}
