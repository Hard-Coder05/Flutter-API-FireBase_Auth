import 'package:flutter/material.dart';
import 'package:whattsappclone/model/menu_options.dart';
import 'package:whattsappclone/pages/home/status_screen.dart';
import 'calls_screen.dart';
import 'camera_page.dart';
import 'chats_screen.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  int index;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double yourWidth = width  / 5;
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text("WhatsApp",style: TextStyle(fontWeight: FontWeight.bold),),
          actions: <Widget>[
            IconButton(icon:Icon(Icons.search,color: Colors.white,),onPressed: null,),
            PopupMenuButton(icon: Icon(Icons.more_vert,color: Colors.white,),onSelected: choiceAction,
              itemBuilder: (BuildContext context){
                index = DefaultTabController.of(context).index;
              if(index==1){
                return Constants.choices.map((String choice){
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              }
              else if(index==2){
                return ConstantsA.choices.map((String choice){
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              }
              else if(index==3){
                return ConstantsB.choices.map((String choice){
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              }
              else{
                return Constants.choices.map((String choice){
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              }
              },
            ),
          ],
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 3.5,
              isScrollable: true,
              tabs: <Widget>[
                Container(
                  width: 20,
                  height: 30,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.camera_alt,
                  ),
                ),
                Container(
                    width: yourWidth,
                    height: 30,
                    alignment: Alignment.center,
                    child: Text("CHATS")),
                Container(
                    width: yourWidth,
                    height: 30,
                    alignment: Alignment.center,
                    child: Text("STATUS")),
                Container(
                    width: yourWidth,
                    height: 30,
                    alignment: Alignment.center,
                    child: Text("CALL"))
              ],
            ),
        ),
        body: TabBarView(
          children: <Widget>[
            CameraPage(),
          ChatsScreen(),
          StatusScreen(),
          CallsScreen(),
          ],
        ),
        floatingActionButton: Builder(
          builder: (BuildContext context){
            int i=DefaultTabController.of(context).index;
            if(i==1){
            return FloatingActionButton(
                shape: StadiumBorder(),
                onPressed: null,
                backgroundColor: Color(0xff25D366),
                child: Icon(
                  Icons.chat,
                  size: 30.0,
                  color: Colors.white,
                )
            );}
            else if(i==2){
              return FloatingActionButton(
                  shape: StadiumBorder(),
                  onPressed: null,
                  backgroundColor: Color(0xff25D366),
                  child: Icon(
                    Icons.chat,
                    size: 30.0,
                    color: Colors.white,
                  )
              );}
            else if(i==3){
              return FloatingActionButton(
                  shape: StadiumBorder(),
                  onPressed: null,
                  backgroundColor: Color(0xff25D366),
                  child: Icon(
                    Icons.add_call,
                    size: 30.0,
                    color: Colors.white,
                  ));}
            else {
              return FloatingActionButton(
                  shape: StadiumBorder(),
                  onPressed: null,
                  backgroundColor: Color(0xff25D366),
                  child: Icon(
                    Icons.camera_alt,
                    size: 30.0,
                    color: Colors.white,
                  ));}
          },
        ),
      ),
    );
  }
  void choiceAction(String choice){
    if(choice == Constants.Settings){
      print('Settings');
    }
  }
}