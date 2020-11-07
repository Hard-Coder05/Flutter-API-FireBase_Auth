import 'package:flutter/material.dart';
import 'package:testapp3/home.dart';
void main()=> runApp(new MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        primaryColor: Colors.black,
        fontFamily: "Ubuntu",
        brightness: Brightness.dark,
      ),
    );
  }
}
