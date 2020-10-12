import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/Admin/admin_drawer.dart';
import 'package:e_shop/Admin/uploadItems.dart';
import 'package:e_shop/Admin/uploadItemsCopy.dart';
import 'package:e_shop/Authentication/authenication.dart';
import 'package:e_shop/Widgets/customTextField.dart';
import 'package:e_shop/DialogBox/errorDialog.dart';
import 'package:flutter/material.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
          "images/xoyo_admin_text.png",
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
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://cdn.imgbin.com/3/2/3/imgbin-hotel-animation-hotel-building-gray-hotel-building-illustration-54wQz6tugKw2g3XW7FsAAbv3i.jpg'),
                ), //
                title: Text(vendors['hotel_name']),
                subtitle: Text(vendors['name']),
                onLongPress: () async => _popupDialog(context, index, snapshot),
                trailing: IconButton(
                  icon: new Icon(Icons.info),
                  highlightColor: Colors.pink,
                  onPressed: () => _infoButton(context, index, snapshot),
                ), // IconData(59354, fontFamily: 'MaterialIcons')

/*  
 Icon(
      Icons.info_outline,
      color: Colors.green,
      size: 30.0,
    )  */
              );
            },
          );
        });
  }

  void _popupDialog(BuildContext context, int index, snapshot) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.orange,
            title: Text('Delete Hotel'),
            content: Text('Do you want to delete this hotel?'),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => deleteDocument(index, snapshot),
                  child: Text('OK')),
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('CANCEL')),
            ],
          );
        });
  }

  void deleteDocument(int index, snapshot) {
    Firestore.instance.runTransaction((Transaction myTransaction) async {
      await myTransaction.delete(snapshot.data.documents[index].reference);
    });
    Fluttertoast.showToast(
      msg: "The Hotel has been Deleted",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red[200],
      textColor: Colors.white,
      fontSize: 16.0,
    );
    Navigator.of(context).pop();
  }

  void _infoButton(BuildContext context, int index, snapshot) {
    DocumentSnapshot vendorInfo = snapshot.data.documents[index];

    String hotelName = 'Hotel: ' + vendorInfo['hotel_name'];
    String authorityName = 'By: ' + vendorInfo['name'];
    String hotelPhone = 'Phone: ' + vendorInfo['phone'];
    String hotelEmail = 'Email: ' + vendorInfo['email'];

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('$hotelName'),
            content: Container(
                height: 400.0,
                width: 400.0,
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      title: Text(hotelName),
                    ),
                    ListTile(
                      title: Text(authorityName),
                    ),
                    ListTile(
                      title: Text(hotelPhone),
                    ),
                    ListTile(
                      title: Text(hotelEmail),
                    ),
                  ],
                )),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('OK')),
            ],
          );
        });
  }
}
