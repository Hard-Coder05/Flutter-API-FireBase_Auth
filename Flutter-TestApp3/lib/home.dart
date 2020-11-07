import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp3/encryptedPage.dart';
import '';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _addressTextController = TextEditingController();

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
                TextField(
                  decoration: const InputDecoration(hintText: 'Please enter any string', icon: Icon(Icons.border_color,color: Colors.grey,)
                  ),
                  controller: _addressTextController,
                ),
                Padding(padding: EdgeInsets.all(20.0)),
                RaisedButton(
                  child: const Text('Encrypt'),
                  onPressed: () {
                    saveData();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => encryptedPage()));
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  saveData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        prefs.setString("string",_addressTextController.text);
      });
  }
}
