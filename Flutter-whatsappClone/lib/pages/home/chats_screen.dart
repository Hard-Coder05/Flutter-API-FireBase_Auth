import 'package:flutter/material.dart';
import 'package:whattsappclone/model/chat_model.dart';
class ChatsScreen extends StatelessWidget {
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
          subtitle: Text(chatListItems[i].lastMessage,style: TextStyle(fontSize: 15,color: Colors.grey),),
          trailing: Text(chatListItems[i].date,style: TextStyle(fontSize: 14,color: Colors.grey),),
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