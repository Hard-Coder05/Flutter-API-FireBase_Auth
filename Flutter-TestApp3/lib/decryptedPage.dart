import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class DecryptedPage extends StatefulWidget {
  @override
  _DecryptedPageState createState() => _DecryptedPageState();
}

class _DecryptedPageState extends State<DecryptedPage> {
  String data;

  @override
  initState()  {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                  if(data!=null)Text("The Decrypted Data is:   $data"),
                  Padding(padding: EdgeInsets.all(20.0)),
              ],
            ),
          )
        ],
      ),
    );
  }

  _loadData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String datas=prefs.getString("string");
    setState(() {
      data = datas;
    });
  }
}
