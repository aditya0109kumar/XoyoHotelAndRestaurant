import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/Authentication/authenication.dart';
import 'package:e_shop/Widgets/customTextField.dart';
import 'package:e_shop/DialogBox/errorDialog.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'VendorDashBoard.dart';

class VendorSignInPage extends StatelessWidget {
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
          width: 150,
        ),
        centerTitle: true,
      ),
      body: VendorSignInScreen(),
    );
  }
}

class VendorSignInScreen extends StatefulWidget {
  @override
  _VendorSignInScreenState createState() => _VendorSignInScreenState();
}

class _VendorSignInScreenState extends State<VendorSignInScreen> {
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final TextEditingController _vendorIDTextEditingController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width,
        _screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors: [Colors.red, Colors.white],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(2.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                "images/hotel_image.png",
                height: 240.0,
                width: 240.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Vendor",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: _vendorIDTextEditingController,
                    data: Icons.person,
                    hintText: "Vendor email id",
                    isObsecure: false,
                  ),
                  CustomTextField(
                    controller: _passwordTextEditingController,
                    data: Icons.lock,
                    hintText: "Password",
                    isObsecure: true,
                  ),
                ],
              ),
            ),
            RaisedButton(
              onPressed: () {
                _vendorIDTextEditingController.text.isNotEmpty &&
                        _passwordTextEditingController.text.isNotEmpty
                    ? vendorAdmin()
                    : showDialog(
                        context: context,
                        builder: (c) {
                          return ErrorAlertDialog(
                            message: "Please fill the details",
                          );
                        });
              },
              color: Colors.red[700],
              child: Text(
                "Sign in",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              height: 4.0,
              width: _screenWidth * 0.8,
              color: Colors.red[700],
            ),
            SizedBox(
              height: 20.0,
            ),
            // FlatButton.icon(
            //   onPressed: () => Navigator.push(context,
            //       MaterialPageRoute(builder: (context) => AuthenticScreen())),
            //   icon: (Icon(
            //     Icons.nature_people,
            //     color: Colors.red[700],
            //   )),
            //   label: Text(
            //     "I'm not an Admin",
            //     style: TextStyle(
            //         color: Colors.red[700], fontWeight: FontWeight.bold),
            //   ),
            // ),
            SizedBox(
              height: 50.0,
            )
          ],
        ),
      ),
    );
  }

  vendorAdmin() async {
    final pr = ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false, showLogs: false);
    pr.style(
      message: 'Authenticating, Please wait',
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      progressWidget: CircularProgressIndicator(),
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
      progress: 0.0,
      maxProgress: 100.0,
      progressTextStyle: TextStyle(
          color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
      messageTextStyle: TextStyle(
          color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
    );
    await pr.show();
    Firestore.instance.collection("vendors").getDocuments().then((snapshot) {
      snapshot.documents.forEach((result) {
        if (result.data["email"] !=
            _vendorIDTextEditingController.text.trim()) {
          final snackBar = SnackBar(content: Text('Your ID is not correct'));
          Scaffold.of(context).showSnackBar(snackBar);
        } else if (result.data["password"] !=
            _passwordTextEditingController.text.trim()) {
          final snackBar =
              SnackBar(content: Text('Your Password is incorrect'));
          Scaffold.of(context).showSnackBar(snackBar);
        } else {
          final snackBar = SnackBar(
            content: Text('Welcome ' + result.data["name"]),
          );
          Scaffold.of(context).showSnackBar(snackBar);

          setState(() {
            _vendorIDTextEditingController.text = "";
            _passwordTextEditingController.text = "";
          });

          Route route = MaterialPageRoute(builder: (c) => VendorDashBoard());
          Navigator.pushReplacement(context, route);
        }
        pr.hide().then((isHidden) {
          print(isHidden);
        });
      });
    });
  }
}
