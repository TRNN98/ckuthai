import 'dart:io';

import 'package:appbase/class/mycolor.dart';
import 'package:appbase/class/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class CustomTextStyle {
  static TextStyle titleTxt(BuildContext context, double number) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.title.copyWith(
        fontFamily: "FC_Lamoon",
        fontWeight: FontWeight.bold,
        fontSize: displayWidth(context) * 0.08 + number,
        color: Color(0xFF000000)

        // fontSize: tabletMode == true ? 60 + number : 35 + number,
        );
  }

  static TextStyle subTitleTxt(BuildContext context, double number) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.title.copyWith(
        fontFamily: "FC_Lamoon",
        fontWeight: FontWeight.bold,
        fontSize: displayWidth(context) * 0.07 + number
        // fontSize: tabletMode == true ? 40 + number : 25 + number,
        );
  }

  static TextStyle titleIntoTxt(BuildContext context, double number) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.title.copyWith(
        fontFamily: "FC_Lamoon",
        fontWeight: FontWeight.bold,
        fontSize: displayWidth(context) * 0.08 + number,
        color: Color(0xFF000000)

        // fontSize: tabletMode == true ? 60 + number : 35 + number,
        );
  }

  static TextStyle dataBoldBTxt(BuildContext context, double number) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.title.copyWith(
        fontFamily: "FC_Lamoon",
        fontWeight: FontWeight.bold,
        fontSize: displayWidth(context) * 0.055 + number,
        // fontSize: tabletMode == true ? 30 + number : 17 + number,
        color: Color(0xFF000000));
  }

  static TextStyle defaultTxtColor(
      BuildContext context, double number, String statusColor) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.title.copyWith(
        fontFamily: "FC_Lamoon",
        fontSize: displayWidth(context) * (Platform.isAndroid ? 0.05: 0.055) + number,
        // fontSize: tabletMode == true ? 30 + number : 17 + number,
        color: statusColor == 'R' ? Color(0xFFFF0000) : Color(0xFF078007));
  }

  static TextStyle dataHeadTitleTxt(BuildContext context, double number) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.title.copyWith(
        fontFamily: "FC_Lamoon",
        fontWeight: FontWeight.bold,
        // fontSize: tabletMode == true ? 35 + number : 20 + number,
        fontSize: displayWidth(context) * 0.05 + number,
        color: Color(0xFF181717));
  }

  static TextStyle dataHeadDataTxt(BuildContext context, double number) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.title.copyWith(
        fontFamily: "FC_Lamoon",
        fontWeight: FontWeight.bold,
        fontSize: displayWidth(context) * 0.05 + number,
        // fontSize: tabletMode == true ? 35 + number : 20 + number,
        color: Color(0xFFe87405));
  }

  static TextStyle headTitleTxt(BuildContext context, double number) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.title.copyWith(
        fontFamily: "FC_Lamoon",
        fontWeight: FontWeight.bold,
        fontSize: displayWidth(context) * 0.06 + number,
        // fontSize: tabletMode == true ? 35 + number : 20 + number,
        color: Color(0xFFFFFFFF));
  }

  static TextStyle dataTxt(BuildContext context, double number) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.title.copyWith(
        fontFamily: "FC_Lamoon",
        fontWeight: FontWeight.bold,
        fontSize: displayWidth(context) * (Platform.isAndroid ? 0.040: 0.045)  + number,
        // fontSize: tabletMode == true ? 25 + number : 15 + number,
        color: Color(0xFF5E5B5B));
  }

  static TextStyle dataRTxt(BuildContext context, double number) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.title.copyWith(
        fontFamily: "FC_Lamoon",
        fontWeight: FontWeight.bold,
        fontSize: displayWidth(context) * (Platform.isAndroid ? 0.040: 0.045)  + number,
        // fontSize: tabletMode == true ? 25 + number : 15 + number,
        color: Color(0xFFFF0000));
  }

  static TextStyle defaultTxt(BuildContext context, double number) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.title.copyWith(
        fontFamily: "FC_Lamoon",
        fontSize: displayWidth(context) * (Platform.isAndroid ? 0.055: 0.06) + number,
        // fontSize: tabletMode == true ? 30 + number : 17 + number,
        color: Color(0xFF000000));
  }

  static TextStyle dataBoldTxt(BuildContext context, double number) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.title.copyWith(
        fontFamily: "FC_Lamoon",
        fontWeight: FontWeight.bold,
        fontSize: displayWidth(context) * (Platform.isAndroid ? 0.055: 0.06) + number,
        // fontSize: tabletMode == true ? 30 + number : 17 + number,
        color: Color(0xFF000000));
  }

  static TextStyle buttonTxt(BuildContext context, double number) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.title.copyWith(
        fontFamily: "FC_Lamoon",
        fontWeight: FontWeight.bold,
        fontSize: displayWidth(context) * 0.05 + number,
        // fontSize: tabletMode == true ? 40 + number : 20 + number,--
        color: Color(0xFFFFFFFF));
  }

  static TextStyle settingTxt(BuildContext context, double number) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.title.copyWith(
        fontFamily: "FC_Lamoon",
        fontWeight: FontWeight.bold,
        fontSize: displayWidth(context) * 0.07 + number,
        // fontSize: tabletMode == true ? 35 + number : 20 + number,
        color: Color(0xFFe87405));
  }

  static Container headcolor(BuildContext context, double number) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Container(
      child: ClipPath(
        clipper: DiagonalPathClipperTwo(),
        child: Container(
          height: displayHeight(context) * 0.12 + number,
          // height: tabletMode == true ? 70 + number : 70 + number,
          color: MyColor.color('colorheader'),
          // child: Center(child: Text("DiagonalPathClipper()")),
        ),
      ),
    );
  }

  static ClipPath headcolor1(BuildContext context, double number) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return ClipPath(
      clipper: DiagonalPathClipperTwo(),
      child: Container(
        height: displayHeight(context) * 0.12 + number,
        // height: tabletMode == true ? 70 + number : 70 + number,
        color: MyColor.color('colorheader'),
        // child: Center(child: Text("DiagonalPathClipper()")),
      ),
    );
  }

  static TextStyle nodataTxt(BuildContext context, double number) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Theme.of(context).textTheme.title.copyWith(
        fontFamily: "FC_Lamoon",
        fontWeight: FontWeight.bold,
        fontSize: displayWidth(context) * 0.1 + number,
        // fontSize: tabletMode == true ? 25 + number : 15 + number,
        color: Color(0xFFFF0000));
  }
}

// class CustomShapeBorder extends ContinuousRectangleBorder {
//   @override
//   Path getOuterPath(Rect rect, {TextDirection textDirection}) {
//     final double innerCircleRadius = 111;

//     Path path = Path();
//     path.lineTo(0, rect.height);
//     path.quadraticBezierTo(rect.width / 2 - (innerCircleRadius / 2) - 30,
//         rect.height + 15, rect.width / 2 - 75, rect.height + 50);
//     path.cubicTo(
//         rect.width / 2 - 40,
//         rect.height + innerCircleRadius - 40,
//         rect.width / 2 + 40,
//         rect.height + innerCircleRadius - 40,
//         rect.width / 2 + 75,
//         rect.height + 50);
//     path.quadraticBezierTo(rect.width / 2 + (innerCircleRadius / 2) + 30,
//         rect.height + 15, rect.width, rect.height);
//     path.lineTo(rect.width, 0.0);
//     path.close();

//     return path;
//   }
// }
