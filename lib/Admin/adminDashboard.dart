import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/Admin/admin_drawer.dart';
import 'package:e_shop/Admin/uploadItems.dart';
import 'package:e_shop/Admin/uploadItemsCopy.dart';
import 'package:e_shop/Authentication/authenication.dart';
import 'package:e_shop/Widgets/customTextField.dart';
import 'package:e_shop/DialogBox/errorDialog.dart';
import 'package:flutter/material.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';

class AdminDashBoardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          height: 50,
          //width: 150,
        ),
        centerTitle: true,
      ),
      drawer: AdminDrawer(),
      body: AdminDashBoardScreen(),
    );
  }
}

class AdminDashBoardScreen extends StatefulWidget {
  @override
  _AdminDashBoardScreenState createState() => _AdminDashBoardScreenState();
}

class _AdminDashBoardScreenState extends State<AdminDashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Firestore.instance.collection("vendors").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              DocumentSnapshot vendors = snapshot.data.documents[index];
              return ListTile(
                leading: FlatButton(onPressed: null, child: null),
                title: Text(vendors['hotel_name']),
                subtitle: Text(vendors['name']),
              );
            },
          );
        });
  }
}
