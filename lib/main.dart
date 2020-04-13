import 'package:flutter/material.dart';
import 'package:lasttry/services/authentication.dart';
import 'package:lasttry/pages/root_page.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return new MaterialApp(
        title: 'ImageAPI+Firebase Auth',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primarySwatch: Colors.lightBlue,
        ),
        home: new RootPage(auth: new Auth()));
  }
}
