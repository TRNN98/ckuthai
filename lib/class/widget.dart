import 'package:appbase/class/language.dart';
import 'package:appbase/class/myclass.dart';
import 'package:appbase/class/textstyle.dart';
import 'package:flutter/material.dart';

class MyWidget {
  static nodata(lgs, context) {
    return Center(
        child: Text(
          Language.mainLg('nodata', lgs),
          textScaleFactor:MyClass.fontSizeApp() ,style:  CustomTextStyle.nodataTxt(context, 0),
        ),
    );
  }

    static BoxDecoration bgApp() {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/imgs/bg.png"),
        fit: BoxFit.fill,
      ),
    );
  }
  
}
