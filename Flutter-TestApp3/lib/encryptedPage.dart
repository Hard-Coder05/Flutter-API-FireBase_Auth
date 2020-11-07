import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'decryptedPage.dart';
class encryptedPage extends StatefulWidget {
  @override
  _encryptedPageState createState() => _encryptedPageState();
}

class _encryptedPageState extends State<encryptedPage> {
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
                if(data!=null)Text("The Encrypted Data is:   $data"),
                Padding(padding: EdgeInsets.all(20.0)),
                RaisedButton(
                  child: const Text('Decrypt the Data'),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DecryptedPage()));
                  },
                ),
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
      data = "*"*datas.length;
    });
}
}
