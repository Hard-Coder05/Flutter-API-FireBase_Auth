import 'package:flutter/material.dart';
import 'package:lasttry/services/authentication.dart';
import 'dart:async';
import 'package:lasttry/pages/NetConnectivity.dart';
class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);
  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;
  @override
  State<StatefulWidget> createState() => new _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }
  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }
  Future navigateToNewPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => NewPage()));
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: new Scaffold(
          appBar: new AppBar(
            title: new Text('Home'),
            actions: <Widget>[
              new FlatButton(
                  child: new Text('Logout',
                      style: new TextStyle(fontSize: 17.0, color: Colors.white)),
                  onPressed: signOut)
            ],
          ),
          body: Stack(
                children: <Widget>[
                  FlatButton(child: Text("Check Image API Service",style: TextStyle(color: Colors.lightBlue,fontSize: 20.0),),
                    onPressed: () {navigateToNewPage(context);},
                    color: Colors.white,
                    colorBrightness: Brightness.dark,
                    disabledColor:Colors.blueGrey,
                    highlightColor: Colors.red,
                    padding: EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 5.0),),
                  FlatButton(child: Text("POST API Services",style: TextStyle(color: Colors.lightBlue,fontSize: 20.0),),
                    onPressed: () {navigateToNewPage(context);},
                    color: Colors.white,
                    colorBrightness: Brightness.dark,
                    disabledColor:Colors.blueGrey,
                    highlightColor: Colors.red,
                    padding: EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 5.0),),
                  FlatButton(
                    child: Text("Check for Internet Connectivity",style: TextStyle(color: Colors.lightBlue,fontSize: 20.0),),
                    onPressed: () {navigateToNewPage(context);},
                    color: Colors.white,
                    colorBrightness: Brightness.dark,
                    disabledColor:Colors.blueGrey,
                    highlightColor: Colors.red,
                    padding: EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 5.0),
                  ),],
          ),
      ),
      );
  }
  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Are you sure?'),
          content: Text('Do you want to exit the App'),
          actions: <Widget>[
            FlatButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            FlatButton(
              child: Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            )
          ],
        );
      },
    ) ?? false;
  }
}