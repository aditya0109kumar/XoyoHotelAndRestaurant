import 'package:flutter/material.dart'; 
  
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
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              colors: [Colors.blue, Colors.blue],
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
      body: Column( 
        children:<Widget>[ 
          Padding( 
            padding: const EdgeInsets.all(8.0), 
            child: Text("Table",textScaleFactor: 2,style: TextStyle(fontWeight:FontWeight.bold),), 
          ), 
          Padding( 
            padding: const EdgeInsets.all(8.0), 
            child: Table( 
                
            // textDirection: TextDirection.rtl, 
            // defaultVerticalAlignment: TableCellVerticalAlignment.bottom, 
            // border:TableBorder.all(width: 2.0,color: Colors.red), 
            children: [ 
              TableRow( 
                children: [ 
                  Text("Education",textScaleFactor: 1.5,), 
                  Text("Institution name",textScaleFactor: 1.5), 
                  Text("University",textScaleFactor: 1.5), 
                ] 
              ), 
               TableRow( 
                children: [ 
                  Text("B.Tech",textScaleFactor: 1.5), 
                  Text("ABESEC",textScaleFactor: 1.5), 
                  Text("AKTU",textScaleFactor: 1.5), 
                ] 
              ), 
              TableRow( 
                children: [ 
                  Text("12th",textScaleFactor: 1.5), 
                  Text("Delhi Public School",textScaleFactor: 1.5), 
                  Text("CBSE",textScaleFactor: 1.5), 
                ] 
              ), 
              TableRow( 
                children: [ 
                  Text("High School",textScaleFactor: 1.5), 
                  Text("SFS",textScaleFactor: 1.5), 
                  Text("ICSE",textScaleFactor: 1.5), 
                ] 
              ), 
            ], 
        ), 
          ), 
        ] 
      ), 
    ); 
  } 
} 