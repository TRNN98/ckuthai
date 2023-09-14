import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ViewImg extends StatefulWidget {
  @override
  _ViewImgState createState() => _ViewImgState();
}

class _ViewImgState extends State<ViewImg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   PhotoView(
                  imageProvider: NetworkImage("https://www.khaosod.co.th/wpapp/uploads/2019/05/%E0%B8%A2%E0%B9%89%E0%B8%AD%E0%B8%A1%E0%B8%A1.jpg"),
                ),
    );
  }
}