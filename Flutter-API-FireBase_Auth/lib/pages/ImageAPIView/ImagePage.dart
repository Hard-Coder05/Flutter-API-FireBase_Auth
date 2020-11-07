import 'dart:convert';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:lasttry/services/post_api_service.dart';
import 'package:provider/provider.dart';
import 'SingleImagePage.dart';
class ImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image API Result",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: _buildBody(context),
    );
  }
}
FutureBuilder<Response> _buildBody(BuildContext context) {
  return FutureBuilder<Response>(
      future: Provider.of<PostApiService>(context).getPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List posts = json.decode(snapshot.data.bodyString);
          return _buildPosts(context, posts);
        } else {
          return WaitingScreen();

        }
      });
}
Widget WaitingScreen() {
  return Scaffold(
    body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: Colors.lightBlue),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 120.0,
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/ecell.jpeg"),
                        radius: 100.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(" Please Wait while We Load the Results...... ",style: TextStyle(color: Colors.white),),
                  Padding(padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 30.0),),
                  CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    ),
  );
}
ListView _buildPosts(BuildContext context, List posts) {
  return ListView.builder(
    itemCount: posts.length,
    padding: EdgeInsets.all(8),
    itemBuilder: (context, index) {
      return  Card(
        color: Colors.white,
          elevation: 4,
          child: ListTile(
            title:  Hero(
              tag: posts[index]['title'],
              transitionOnUserGestures: true,
              child:Text(
                posts[index]['title'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            leading:Image.network(
              posts[index]['thumbnailUrl'],
            ),
            onTap: () => _navigateToSingleImagePage(context, posts[index]['id']),
          )
      );
    },
  );
}
void _navigateToSingleImagePage(BuildContext context, int id) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => SingleImagePage(postId: id),
    ),
  );
}