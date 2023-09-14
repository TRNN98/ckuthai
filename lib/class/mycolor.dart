import 'package:flutter/material.dart';

class MyColor {
  static color(data) {
    if (data.toString() == 'colorheader') {
      return Colors.green;
    } else if (data.toString() == 'datatitle') {
      return Colors.brown[50];
    } else if (data.toString() == 'headtitle') {
      return Colors.blue;
    } else if (data.toString() == 'linelist') {
      return Colors.grey;
    } else if (data.toString() == 'TextFormFieldTextStyle') {
      return Colors.black87;
    } else if (data.toString() == 'TextFormFieldBorderSide') {
      return Color(0xFFe87405);
    } else if (data.toString() == 'button') {
      return Color(0xFFe87405);
    } else if (data.toString() == 'buttonnext') {
      return Color(0xFF000000);
    } else if (data.toString() == 'slide1') {
      return Colors.white;
    } else if (data.toString() == 'slide2') {
      return Color(0xFFe87405);
    } else if (data.toString() == 'imgprofile') {
      return Color(0xFFe87405);
    } else if (data.toString() == 'detailhead') {
      return Color(0xFFe87405);
    } else if (data.toString() == 'settings') {
      return Color(0xFFe87405);
    } else if (data.toString() == 'buttongra') {
      return Color(0xFFe48730);
    } else if (data.toString() == 'buttongra1') {
      return Color(0xFFe87405);
    } else if (data.toString() == 'tabs') {
      return Color(0x441CA7EC);
    }
  }
}
