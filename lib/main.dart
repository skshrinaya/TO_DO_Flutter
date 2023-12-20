import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/model/home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}): super (key: key);

  @override
  Widget build (BuildContext context){
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor:Colors.black12 ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'TO-DO List',
      home: Home(),
    );
  }
}