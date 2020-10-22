import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/Authentication/authenication.dart';
import 'package:e_shop/Widgets/customTextField.dart';
import 'package:e_shop/DialogBox/errorDialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:e_shop/Config/config.dart';
import 'package:progress_dialog/progress_dialog.dart';

void main() {
  runApp(UploadHotelImages());
}

class UploadHotelImages extends StatelessWidget {
  // This widget is the root
  // of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Table',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: UploadImages(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class UploadImages extends StatefulWidget {
  @override
  _UploadImagesState createState() => _UploadImagesState();
}

class _UploadImagesState extends State<UploadImages> {
  // File _imageLogo,
  //     _imageExt1,
  //     _imageExt2,
  //     _imageExt3,
  //     _imageExt4,
  //     _imageExt5,
  //     _imagefacility1,
  //     _imagefacility2,
  //     _imagefacility3,
  //     _imagefacility4,
  //     _imagefacility5,
  //     _imageRoom1,
  //     _imageRoom2,
  //     _imageRoom3,
  //     _imageRoom4,
  //     _imageRoom5;
  List<File> hotelImages = List<File>(15);
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   flexibleSpace: Container(
      //     decoration: new BoxDecoration(
      //       gradient: new LinearGradient(
      //         colors: [Colors.blue, Colors.blue],
      //         begin: const FractionalOffset(0.0, 0.0),
      //         end: const FractionalOffset(2.0, 0.0),
      //         stops: [0.0, 1.0],
      //         tileMode: TileMode.clamp,
      //       ),
      //     ),
      //   ),
      //   title: Image.asset(
      //     "images/xoyo_vendor_text.png",
      //     height: 50,
      //     //width: 150,
      //   ),
      //   centerTitle: true,
      // ),
      body: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Table",
            textScaleFactor: 2,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Table(
            // textDirection: TextDirection.rtl,
            // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
            // border:TableBorder.all(width: 2.0,color: Colors.red),
            children: [
              TableRow(children: [
                InkWell(
                  onTap: () async {
                    hotelImages[0] = await ImagePicker.pickImage(
                        source: ImageSource.gallery);
                  }, //_selectAndPickImage,
                  child: CircleAvatar(
                    radius: _screenWidth * 0.05,
                    backgroundColor: Colors.white,
                    backgroundImage: hotelImages[0] == null
                        ? null
                        : FileImage(hotelImages[0]),
                    child: hotelImages[0] == null
                        ? Icon(
                            Icons.add_photo_alternate,
                            size: _screenWidth * 0.07,
                            color: Colors.grey,
                          )
                        : null,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    hotelImages[1] = await ImagePicker.pickImage(
                        source: ImageSource.gallery);
                  }, //_selectAndPickImage,
                  child: CircleAvatar(
                    radius: _screenWidth * 0.05,
                    backgroundColor: Colors.white,
                    backgroundImage: hotelImages[1] == null
                        ? null
                        : FileImage(hotelImages[1]),
                    child: hotelImages[1] == null
                        ? Icon(
                            Icons.add_photo_alternate,
                            size: _screenWidth * 0.07,
                            color: Colors.grey,
                          )
                        : null,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    hotelImages[2] = await ImagePicker.pickImage(
                        source: ImageSource.gallery);
                  }, //_selectAndPickImage,
                  child: CircleAvatar(
                    radius: _screenWidth * 0.05,
                    backgroundColor: Colors.white,
                    backgroundImage: hotelImages[2] == null
                        ? null
                        : FileImage(hotelImages[2]),
                    child: hotelImages[2] == null
                        ? Icon(
                            Icons.add_photo_alternate,
                            size: _screenWidth * 0.07,
                            color: Colors.grey,
                          )
                        : null,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    hotelImages[3] = await ImagePicker.pickImage(
                        source: ImageSource.gallery);
                  }, //_selectAndPickImage,
                  child: CircleAvatar(
                    radius: _screenWidth * 0.05,
                    backgroundColor: Colors.white,
                    backgroundImage: hotelImages[3] == null
                        ? null
                        : FileImage(hotelImages[3]),
                    child: hotelImages[3] == null
                        ? Icon(
                            Icons.add_photo_alternate,
                            size: _screenWidth * 0.07,
                            color: Colors.grey,
                          )
                        : null,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    hotelImages[4] = await ImagePicker.pickImage(
                        source: ImageSource.gallery);
                  }, //_selectAndPickImage,
                  child: CircleAvatar(
                    radius: _screenWidth * 0.05,
                    backgroundColor: Colors.white,
                    backgroundImage: hotelImages[4] == null
                        ? null
                        : FileImage(hotelImages[4]),
                    child: hotelImages[4] == null
                        ? Icon(
                            Icons.add_photo_alternate,
                            size: _screenWidth * 0.07,
                            color: Colors.grey,
                          )
                        : null,
                  ),
                ),
              ]),

              TableRow(children: [
                InkWell(
                  onTap: () async {
                    hotelImages[5] = await ImagePicker.pickImage(
                        source: ImageSource.gallery);
                  }, //_selectAndPickImage,
                  child: CircleAvatar(
                    radius: _screenWidth * 0.05,
                    backgroundColor: Colors.white,
                    backgroundImage: hotelImages[5] == null
                        ? null
                        : FileImage(hotelImages[5]),
                    child: hotelImages[5] == null
                        ? Icon(
                            Icons.add_photo_alternate,
                            size: _screenWidth * 0.07,
                            color: Colors.grey,
                          )
                        : null,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    hotelImages[6] = await ImagePicker.pickImage(
                        source: ImageSource.gallery);
                  }, //_selectAndPickImage,
                  child: CircleAvatar(
                    radius: _screenWidth * 0.05,
                    backgroundColor: Colors.white,
                    backgroundImage: hotelImages[6] == null
                        ? null
                        : FileImage(hotelImages[6]),
                    child: hotelImages[6] == null
                        ? Icon(
                            Icons.add_photo_alternate,
                            size: _screenWidth * 0.07,
                            color: Colors.grey,
                          )
                        : null,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    hotelImages[7] = await ImagePicker.pickImage(
                        source: ImageSource.gallery);
                  }, //_selectAndPickImage,
                  child: CircleAvatar(
                    radius: _screenWidth * 0.05,
                    backgroundColor: Colors.white,
                    backgroundImage: hotelImages[7] == null
                        ? null
                        : FileImage(hotelImages[7]),
                    child: hotelImages[7] == null
                        ? Icon(
                            Icons.add_photo_alternate,
                            size: _screenWidth * 0.07,
                            color: Colors.grey,
                          )
                        : null,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    hotelImages[8] = await ImagePicker.pickImage(
                        source: ImageSource.gallery);
                  }, //_selectAndPickImage,
                  child: CircleAvatar(
                    radius: _screenWidth * 0.05,
                    backgroundColor: Colors.white,
                    backgroundImage: hotelImages[8] == null
                        ? null
                        : FileImage(hotelImages[8]),
                    child: hotelImages[8] == null
                        ? Icon(
                            Icons.add_photo_alternate,
                            size: _screenWidth * 0.07,
                            color: Colors.grey,
                          )
                        : null,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    hotelImages[9] = await ImagePicker.pickImage(
                        source: ImageSource.gallery);
                  }, //_selectAndPickImage,
                  child: CircleAvatar(
                    radius: _screenWidth * 0.05,
                    backgroundColor: Colors.white,
                    backgroundImage: hotelImages[9] == null
                        ? null
                        : FileImage(hotelImages[9]),
                    child: hotelImages[9] == null
                        ? Icon(
                            Icons.add_photo_alternate,
                            size: _screenWidth * 0.07,
                            color: Colors.grey,
                          )
                        : null,
                  ),
                ),
              ]),
              TableRow(children: [
                InkWell(
                  onTap: () async {
                    hotelImages[10] = await ImagePicker.pickImage(
                        source: ImageSource.gallery);
                  }, //_selectAndPickImage,
                  child: CircleAvatar(
                    radius: _screenWidth * 0.05,
                    backgroundColor: Colors.white,
                    backgroundImage: hotelImages[10] == null
                        ? null
                        : FileImage(hotelImages[10]),
                    child: hotelImages[10] == null
                        ? Icon(
                            Icons.add_photo_alternate,
                            size: _screenWidth * 0.07,
                            color: Colors.grey,
                          )
                        : null,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    hotelImages[11] = await ImagePicker.pickImage(
                        source: ImageSource.gallery);
                  }, //_selectAndPickImage,
                  child: CircleAvatar(
                    radius: _screenWidth * 0.05,
                    backgroundColor: Colors.white,
                    backgroundImage: hotelImages[11] == null
                        ? null
                        : FileImage(hotelImages[11]),
                    child: hotelImages[11] == null
                        ? Icon(
                            Icons.add_photo_alternate,
                            size: _screenWidth * 0.07,
                            color: Colors.grey,
                          )
                        : null,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    hotelImages[12] = await ImagePicker.pickImage(
                        source: ImageSource.gallery);
                  }, //_selectAndPickImage,
                  // child: CircleAvatar(
                  //   radius: _screenWidth * 0.05,
                  //   backgroundColor: Colors.pink,
                  //   backgroundImage: hotelImages[12] == null
                  //       ? null
                  //       : FileImage(hotelImages[12]),
                  //   child: hotelImages[12] == null
                  //       ? Icon(
                  //           Icons.add_photo_alternate,
                  //           size: _screenWidth * 0.07,
                  //           color: Colors.grey,
                  //         )
                  //       : null,
                  // ),
                  child: hotelImages[12] != null ? ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(
                        hotelImages[12],
                        width: 10,
                        height: 10,
                        fit: BoxFit.fitHeight,
                      ),
                    )
                    : Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)),
                      width: 10,
                      height: 10,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.grey[800],
                      ),
                    ),


                ),


/* 
child: _image != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.file(
                        _image,
                        width: 100,
                        height: 100,
                        fit: BoxFit.fitHeight,
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(50)),
                      width: 100,
                      height: 100,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.grey[800],
                      ),
                    ),



*/





                InkWell(
                  onTap: () async {
                    hotelImages[13] = await ImagePicker.pickImage(
                        source: ImageSource.gallery);
                  }, //_selectAndPickImage,
                  child: CircleAvatar(
                    radius: _screenWidth * 0.05,
                    backgroundColor: Colors.white,
                    backgroundImage: hotelImages[13] == null
                        ? null
                        : FileImage(hotelImages[13]),
                    child: hotelImages[13] == null
                        ? Icon(
                            Icons.add_photo_alternate,
                            size: _screenWidth * 0.07,
                            color: Colors.grey,
                          )
                        : null,
                  ),
                ),
                InkWell(
                  onTap: () async {
                    hotelImages[14] = await ImagePicker.pickImage(
                        source: ImageSource.gallery);
                  }, //_selectAndPickImage,
                  child: CircleAvatar(
                    radius: _screenWidth * 0.05,
                    backgroundColor: Colors.white,
                    backgroundImage: hotelImages[14] == null
                        ? null
                        : FileImage(hotelImages[14]),
                    child: hotelImages[14] == null
                        ? Icon(
                            Icons.add_photo_alternate,
                            size: _screenWidth * 0.07,
                            color: Colors.grey,
                          )
                        : null,
                  ),
                ),
              ]),
              // TableRow(children: [
              //   Text("High School", textScaleFactor: 1.5),
              //   Text("SFS", textScaleFactor: 1.5),
              //   Text("ICSE", textScaleFactor: 1.5),
              // ]),
            ],
          ),
        ),
      ]),
    );
  }

  
}
