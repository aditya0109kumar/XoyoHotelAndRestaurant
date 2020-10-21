import 'package:e_shop/Authentication/login.dart';
// import 'package:e_shop/Authentication/register.dart';
import 'package:flutter/material.dart';

import 'BasicInformation.dart';
import 'UploadHotelImages.dart';

class PropertyDetails extends StatefulWidget {
  @override
  _PropertyDetailsState createState() => _PropertyDetailsState();
}

class _PropertyDetailsState extends State<PropertyDetails> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
          ),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                text: "Basic Information",
              ),
              Tab(
                icon: Icon(
                  Icons.perm_contact_calendar,
                  color: Colors.white,
                ),
                text: "Images",
              ),
              Tab(
                icon: Icon(
                  Icons.perm_contact_calendar,
                  color: Colors.white,
                ),
                text: "Description",
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
            children: [
              BasicInformation(),
              UploadHotelImages(),
              Login(),
            ],
          ),
        ),
      ),
    );
  }
}
