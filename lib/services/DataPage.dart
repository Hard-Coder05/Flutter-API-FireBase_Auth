import 'package:flutter/material.dart';
import 'package:lasttry/pages/ImageAPIView/ImagePage.dart';
import 'package:lasttry/services/post_api_service.dart';
import 'package:provider/provider.dart';
void main() => runApp(new DataPage());
class DataPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Provider(
      create:(_) => PostApiService.create(),
      dispose: (_,PostApiService service) => service.client.dispose(),
      child:new MaterialApp(
        home: new ImagePage(),
        theme: new ThemeData(
          primarySwatch: Colors.lightBlue,
        ),
      ) ,
    );
  }
}