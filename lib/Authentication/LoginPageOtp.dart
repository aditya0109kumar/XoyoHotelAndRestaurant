import 'package:e_shop/Authentication/authenication.dart';
import 'package:e_shop/Authentication/homeActivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String smsCode;
  String verificationCode;

  String number;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
        backgroundColor: Colors.red[500],
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 100, 10, 10),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Text("Enter Phone Number(+91)",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,

                    ),),

                ),
                TextField(
                  onChanged: (val) {
                    number = val;
                  },
                  cursorColor: Colors.red[900],
                  style: TextStyle(
                      height: 1
                  ),
                  decoration: InputDecoration(
                      fillColor: Colors.red[100],
                      filled: true,

                      prefixIcon: Icon(Icons.phone,
                        color: Colors.black,
                      ),
                      hintText: "Enter Phone Number",
                      hintStyle: TextStyle(
                        color: Colors.grey,

                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: ButtonTheme(
                    height: 50,
                    minWidth: width,
                    child: RaisedButton.icon(
                      onPressed: () {
                        _submit();
                      },
                      icon: Icon(Icons.send, color: Colors.white,),
                      label: Text("Login"),
                      color: Colors.red[800],
                      textColor: Colors.white,
                      splashColor: Colors.red,
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }

  Future<void> _submit() async {
    final PhoneVerificationCompleted verificationSuccess = (
        AuthCredential credential) {
      setState(() {
        print("verify code");
        print(credential);
      });
    };

    final PhoneVerificationFailed phoneVerificationFailed = (
        AuthException exception) {
      print("${exception.message}");
    };

    final PhoneCodeSent phoneCodeSent = (String verId, [int forceCodeResend]) {
      this.verificationCode = verId;
      smsCodeDialog(context).then((value) => print("Signed In"));
    };


    final PhoneCodeAutoRetrievalTimeout autoRetrievalTimeout = (String verId) {
      this.verificationCode = verId;
    };


    await
    FirebaseAuth.instance.verifyPhoneNumber(phoneNumber: this.number,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verificationSuccess,
        verificationFailed: phoneVerificationFailed,
        codeSent: phoneCodeSent,
        codeAutoRetrievalTimeout: autoRetrievalTimeout
    );
  }

  Future<bool> smsCodeDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Enter Code",
              style: TextStyle(
                color: Colors.black,

              ),),
            content: TextField(
              onChanged: (Value) {
                smsCode = Value;
              },
            ),
            contentPadding: EdgeInsets.all(10),
            actions: <Widget>[
              FlatButton(
                child: Text("Verify",
                  style: TextStyle(
                    color: Colors.red,

                  ),
                ),
                onPressed: () {
                  FirebaseAuth.instance.currentUser ().then((user) {
                    if (user != null) {
                      Navigator.of(context).pop();

                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>AuthenticScreen()));

                    } else {
                      Navigator.of(context).pop();
                      signIn();
                    }
                  });
                },

              )
            ],


          );
        }

    );
  }

  signIn()
  {
    AuthCredential phoneAuthCredentail = PhoneAuthProvider.getCredential(
        verificationId: verificationCode,
        smsCode: smsCode);
    FirebaseAuth.instance.signInWithCredential(phoneAuthCredentail)
        .then((value) => Navigator.push(context,
      MaterialPageRoute(builder: (context) => HomeActivity()),
    )).catchError((e) => print("Invalid Number"));
  }



}