import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:multi_image_picker/multi_image_picker.dart';

void main() => runApp(new MultipleImagePicker());

class MultipleImagePicker extends StatefulWidget {
  @override
  _MultipleImagePickerState createState() => new _MultipleImagePickerState();
}

class _MultipleImagePickerState extends State<MultipleImagePicker> {
  int button = 0;
  List<Asset> images = List<Asset>();
  List<String> vendorImageURL = List<String>();
  String _error = 'No Error Dectected';

  @override
  void initState() {
    super.initState();
  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';
    button++;

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      _error = error;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        // appBar: new AppBar(
        //   title: const Text('Plugin example app'),
        // ),
        body: Column(
          children: <Widget>[
            Divider(height: 50,),
            Center(child: Text('Error: $_error')),
            RaisedButton(
              child: Text("Pick images"),
              onPressed: loadAssets,
            ),
            Expanded(
              child: buildGridView(),
            )
          ],
        ),
      ),
    );
  }

  Future<DocumentReference> upload() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final Firestore _firestore = Firestore.instance;

    FirebaseUser user = await _auth.currentUser();
    DocumentReference ref = _firestore.collection('vendors').document(user.uid);
    getData() async {
      return await _firestore.collection('vendors').getDocuments();
    }

    getData().then((val) {
      if (val.documents.length > 0) {
        String name = val.documents[0].data["name"];
      }
      // else{print("Not Found");}
    });

    // for (int i = 0; i <= 15; i++) {
    //   final String id = user.uid;
    //   String imageFileName = DateTime.now().millisecondsSinceEpoch.toString();
    //   final StorageReference storageReference =
    //       FirebaseStorage().ref().child('vendors/$id/$imageFileName');
    //   final StorageUploadTask storageUploadTask =
    //       storageReference.putFile(images[i]);
    //   StorageTaskSnapshot taskSnapshot = await storageUploadTask.onComplete;
    //   await taskSnapshot.ref.getDownloadURL().then((urlImage) {
    //     vendorImageURL[i] = urlImage;
    //   });
    //   await new Future.delayed(const Duration(milliseconds: 5));
    // }
    int i = 0;

    while (images[i] != null) {
      final String id = user.uid;
      String imageFileName = DateTime.now().millisecondsSinceEpoch.toString();
      final StorageReference storageReference =
          FirebaseStorage().ref().child('vendors/$id/$imageFileName');
      final StorageUploadTask storageUploadTask = storageReference
          .putData((await images[i].getByteData()).buffer.asUint8List());
      StorageTaskSnapshot taskSnapshot = await storageUploadTask.onComplete;
      await taskSnapshot.ref.getDownloadURL().then((urlImage) {
        vendorImageURL[i] = urlImage;
      });
      await new Future.delayed(const Duration(milliseconds: 5));
    }
    return ref;
  }
}
