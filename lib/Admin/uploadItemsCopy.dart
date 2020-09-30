import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/Admin/adminShiftOrders.dart';
import 'package:e_shop/Widgets/loadingWidget.dart';
import 'package:e_shop/main.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as ImD;

class UploadPageCopy extends StatefulWidget {
  @override
  _UploadPageCopyState createState() => _UploadPageCopyState();
}

class _UploadPageCopyState extends State<UploadPageCopy>
    with AutomaticKeepAliveClientMixin<UploadPageCopy> {
  bool get wantKeepAlive => true;
  File file1, file2, file3, file4, file5, file6, file7, file8, file9, file10;
  TextEditingController _descriptionTextEditingController =
      TextEditingController();
  TextEditingController _priceTextEditingController = TextEditingController();
  TextEditingController _titleTextEditingController = TextEditingController();
  TextEditingController _shortInfoTextEditingController =
      TextEditingController();
  String hotelId = DateTime.now().millisecondsSinceEpoch.toString();
  bool uploading;
  @override
  Widget build(BuildContext context) {
    return file1 == null
        ? displayAdminHomeScreen()
        : displayAdminUploadFormScreen();
  }

  displayAdminHomeScreen() {
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
        leading: IconButton(
            icon: Icon(
              Icons.border_color,
              color: Colors.white,
            ),
            onPressed: () {
              AdminShiftOrders();
            }),
        actions: [
          FlatButton(
            child: Text(
              "Logout",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              Route route = MaterialPageRoute(builder: (c) => SplashScreen());
              Navigator.pushReplacement(context, route);
            },
          ),
        ],
        title: Image.asset(
          "images/xoyo.png",
          height: 50,
          width: 150,
        ),
        centerTitle: true,
      ),
      body: getAdminHomeScreenBody(),
    );
  }

  getAdminHomeScreenBody() {
    return Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: [Colors.red, Colors.white],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(2.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shop_two,
              color: Colors.white,
              size: 200.0,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9.0),
                ),
                child: Text(
                  "Add New Items",
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                color: Colors.red[800],
                onPressed: () => takeImage(context),
              ),
            )
          ],
        ),
      ),
    );
  }

  takeImage(mContext) {
    showDialog(
        context: mContext,
        builder: (con) {
          return SimpleDialog(
            title: Text(
              "Item Image",
              style: TextStyle(
                  color: Colors.red[800], fontWeight: FontWeight.bold),
            ),
            children: [
              SimpleDialogOption(
                child: Text("Select Hotel pic 1",
                    style: TextStyle(
                      color: Colors.red[600],
                    )),
                onPressed: pickPhotoFromGallery1,
              ),
              SimpleDialogOption(
                child: Text("Select Hotel pic 2",
                    style: TextStyle(
                      color: Colors.red[600],
                    )),
                onPressed: pickPhotoFromGallery1,
              ),
              SimpleDialogOption(
                child: Text("Select Hotel pic 3",
                    style: TextStyle(
                      color: Colors.red[600],
                    )),
                onPressed: pickPhotoFromGallery1,
              ),
              SimpleDialogOption(
                child: Text("Select Hotel pic 4",
                    style: TextStyle(
                      color: Colors.red[600],
                    )),
                onPressed: pickPhotoFromGallery1,
              ),
              SimpleDialogOption(
                child: Text("Select Hotel pic 5",
                    style: TextStyle(
                      color: Colors.red[600],
                    )),
                onPressed: pickPhotoFromGallery1,
              ),
              SimpleDialogOption(
                child: Text("Select Hotel pic 6",
                    style: TextStyle(
                      color: Colors.red[600],
                    )),
                onPressed: pickPhotoFromGallery1,
              ),
              SimpleDialogOption(
                child: Text("Select Hotel pic 7",
                    style: TextStyle(
                      color: Colors.red[600],
                    )),
                onPressed: pickPhotoFromGallery1,
              ),
              SimpleDialogOption(
                child: Text("Select Hotel pic 8",
                    style: TextStyle(
                      color: Colors.red[600],
                    )),
                onPressed: pickPhotoFromGallery1,
              ),
              SimpleDialogOption(
                child: Text("Select Hotel pic 9",
                    style: TextStyle(
                      color: Colors.red[600],
                    )),
                onPressed: pickPhotoFromGallery1,
              ),
              SimpleDialogOption(
                child: Text("Select Hotel pic 10",
                    style: TextStyle(
                      color: Colors.red[600],
                    )),
                onPressed: pickPhotoFromGallery1,
              ),
              SimpleDialogOption(
                child: Text("Cancel",
                    style: TextStyle(
                      color: Colors.red[600],
                    )),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  capturePhotoWithCamera() async {
    Navigator.pop(context);
    File imageFile1 = await ImagePicker.pickImage(
        source: ImageSource.camera, maxHeight: 680.0, maxWidth: 970.0);
    setState(() {
      file1 = imageFile1;
    });
  }

  pickPhotoFromGallery1() async {
    Navigator.pop(context);
    File imageFile2 = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      file2 = imageFile2;
    });
  }

  pickPhotoFromGallery2() async {
    Navigator.pop(context);
    File imageFile3 = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      file3 = imageFile3;
    });
  }

  pickPhotoFromGallery3() async {
    Navigator.pop(context);
    File imageFile4 = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      file4 = imageFile4;
    });
  }

  pickPhotoFromGallery4() async {
    Navigator.pop(context);
    File imageFile5 = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      file5 = imageFile5;
    });
  }

  pickPhotoFromGallery5() async {
    Navigator.pop(context);
    File imageFile6 = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      file6 = imageFile6;
    });
  }

  pickPhotoFromGallery6() async {
    Navigator.pop(context);
    File imageFile7 = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      file7 = imageFile7;
    });
  }

  pickPhotoFromGallery7() async {
    Navigator.pop(context);
    File imageFile8 = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      file8 = imageFile8;
    });
  }

  pickPhotoFromGallery8() async {
    Navigator.pop(context);
    File imageFile9 = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      file9 = imageFile9;
    });
  }

  pickPhotoFromGallery9() async {
    Navigator.pop(context);
    File imageFile10 = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      file10 = imageFile10;
    });
  }

  displayAdminUploadFormScreen() {
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
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: clearFormInfo),
        title: Text(
          "New Hotel",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          FlatButton(
            onPressed: uploading
                ? null
                : () =>
                    uploadImageAndSaveItemInfo1() &&
                    uploadImageAndSaveItemInfo2() &&
                    uploadImageAndSaveItemInfo3() &&
                    uploadImageAndSaveItemInfo4() &&
                    uploadImageAndSaveItemInfo5() &&
                    uploadImageAndSaveItemInfo6() &&
                    uploadImageAndSaveItemInfo7() &&
                    uploadImageAndSaveItemInfo8() &&
                    uploadImageAndSaveItemInfo9() &&
                    uploadImageAndSaveItemInfo10() ,
            child: Text(
              "Add",
              style: TextStyle(
                color: Colors.red,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          uploading ? circularProgress() : Text(""),
          Container(
            height: 30.0,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Center(
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: FileImage(file1), fit: BoxFit.cover)),
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 12.0)),
          ListTile(
            leading: Icon(
              Icons.perm_device_information,
              color: Colors.red[700],
            ),
            title: Container(
              width: 250.0,
              child: TextField(
                style: TextStyle(color: Colors.deepPurpleAccent),
                controller: _shortInfoTextEditingController,
                decoration: InputDecoration(
                    hintText: "Short Info",
                    hintStyle: TextStyle(color: Colors.deepPurpleAccent),
                    border: InputBorder.none),
              ),
            ),
          ),
          Divider(
            color: Colors.pink,
          ),
          ListTile(
            leading: Icon(
              Icons.perm_device_information,
              color: Colors.red[700],
            ),
            title: Container(
              width: 250.0,
              child: TextField(
                style: TextStyle(color: Colors.deepPurpleAccent),
                controller: _titleTextEditingController,
                decoration: InputDecoration(
                    hintText: "Title",
                    hintStyle: TextStyle(color: Colors.deepPurpleAccent),
                    border: InputBorder.none),
              ),
            ),
          ),
          Divider(
            color: Colors.pink,
          ),
          ListTile(
            leading: Icon(
              Icons.perm_device_information,
              color: Colors.red[700],
            ),
            title: Container(
              width: 250.0,
              child: TextField(
                style: TextStyle(color: Colors.deepPurpleAccent),
                controller: _descriptionTextEditingController,
                decoration: InputDecoration(
                    hintText: "Decription",
                    hintStyle: TextStyle(color: Colors.deepPurpleAccent),
                    border: InputBorder.none),
              ),
            ),
          ),
          Divider(
            color: Colors.pink,
          ),
          ListTile(
            leading: Icon(
              Icons.perm_device_information,
              color: Colors.red[700],
            ),
            title: Container(
              width: 250.0,
              child: TextField(
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.deepPurpleAccent),
                controller: _priceTextEditingController,
                decoration: InputDecoration(
                    hintText: "Price",
                    hintStyle: TextStyle(color: Colors.deepPurpleAccent),
                    border: InputBorder.none),
              ),
            ),
          ),
          Divider(
            color: Colors.pink,
          )
        ],
      ),
    );
  }

  clearFormInfo() {
    setState(() {
      file1 = null;
      file2 = null;
      file3 = null;
      file4 = null;
      file5 = null;
      file6 = null;
      file7 = null;
      file8 = null;
      file9 = null;
      file10 = null;
      _priceTextEditingController.clear();
      _descriptionTextEditingController.clear();
      _shortInfoTextEditingController.clear();
      _titleTextEditingController.clear();
    });
  }

  uploadImageAndSaveItemInfo1() async {
    setState(() {
      uploading = true;
    });
    String imageDownloadUrl = await uploadItemImage(file1);
    saveHotelInfo(imageDownloadUrl);
  }

  uploadImageAndSaveItemInfo2() async {
    setState(() {
      uploading = true;
    });
    String imageDownloadUrl = await uploadItemImage(file2);
    saveHotelInfo(imageDownloadUrl);
  }

  uploadImageAndSaveItemInfo3() async {
    setState(() {
      uploading = true;
    });
    String imageDownloadUrl = await uploadItemImage(file3);
    saveHotelInfo(imageDownloadUrl);
  }

  uploadImageAndSaveItemInfo4() async {
    setState(() {
      uploading = true;
    });
    String imageDownloadUrl = await uploadItemImage(file4);
    saveHotelInfo(imageDownloadUrl);
  }

  uploadImageAndSaveItemInfo5() async {
    setState(() {
      uploading = true;
    });
    String imageDownloadUrl = await uploadItemImage(file5);
    saveHotelInfo(imageDownloadUrl);
  }

  uploadImageAndSaveItemInfo6() async {
    setState(() {
      uploading = true;
    });
    String imageDownloadUrl = await uploadItemImage(file6);
    saveHotelInfo(imageDownloadUrl);
  }

  uploadImageAndSaveItemInfo7() async {
    setState(() {
      uploading = true;
    });
    String imageDownloadUrl = await uploadItemImage(file7);
    saveHotelInfo(imageDownloadUrl);
  }

  uploadImageAndSaveItemInfo8() async {
    setState(() {
      uploading = true;
    });
    String imageDownloadUrl = await uploadItemImage(file8);
    saveHotelInfo(imageDownloadUrl);
  }

  uploadImageAndSaveItemInfo9() async {
    setState(() {
      uploading = true;
    });
    String imageDownloadUrl = await uploadItemImage(file9);
    saveHotelInfo(imageDownloadUrl);
  }

  uploadImageAndSaveItemInfo10() async {
    setState(() {
      uploading = true;
    });
    String imageDownloadUrl = await uploadItemImage(file10);
    saveHotelInfo(imageDownloadUrl);
  }

  Future<String> uploadItemImage(mFileImage) async {
    final StorageReference storageReference =
        FirebaseStorage.instance.ref().child("items");
    StorageUploadTask uploadTask =
        storageReference.child("hotel_$hotelId.jpg").putFile(mFileImage);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  saveHotelInfo(String downloadUrl) {
    final hotelRef = Firestore.instance.collection("hotels");
    hotelRef.document(hotelId).setData({
      "shortInfo": _shortInfoTextEditingController.text.trim(),
      "longDescription": _descriptionTextEditingController.text.trim(),
      "price": _priceTextEditingController.text.trim(),
      "publishDate": DateTime.now(),
      "thumbnailUrl": downloadUrl,
      "title": _titleTextEditingController.text.trim(),
    });

    setState(() {
      file1 = null;
      file2 = null;
      file3 = null;
      file4 = null;
      file5 = null;
      file6 = null;
      file7 = null;
      file8 = null;
      file9 = null;
      file10 = null;
      uploading = false;
      hotelId = DateTime.now().millisecondsSinceEpoch.toString();
      _descriptionTextEditingController.clear();
      _shortInfoTextEditingController.clear();
      _priceTextEditingController.clear();
    });
  }
}
