import 'package:flutter/material.dart';
import 'package:whattsappclone/model/chat_model.dart';
class CallsScreen extends StatelessWidget {
  final List<ChatListItem> chatListItems = DummyList().chatListItems;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: chatListItems.length,
      separatorBuilder: (ctx, i) {
        return Divider();
      },
      itemBuilder: (ctx, i) {
        return ListTile(
          title: Text(chatListItems[i].personName,style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Container(child: Row(children: <Widget>[Icon(Icons.call_made,color: Color(0xff25D366),size: 19,),SizedBox(width: 5,),Text(chatListItems[i].date,style: TextStyle(fontSize: 14,color: Colors.grey),)],),),
          trailing: Icon(Icons.call,color: Color(0xff075E54),),
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.black12,
            child: Icon(Icons.person,color: Colors.white,size: 30,),
          ),
          onTap: null,
        );
      },
    );
  }
}