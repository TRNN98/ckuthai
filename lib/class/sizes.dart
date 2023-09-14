import 'package:flutter/material.dart';

Size displaySize(BuildContext context) {
  // debugPrint('Size = ' + MediaQuery.of(context).size.toString());
  return MediaQuery.of(context).size;
}

double displayHeight(BuildContext context) {
  // debugPrint('Height = ' + MediaQuery.of(context).toString());
  return displaySize(context).height;
}
double displayHeight1(BuildContext context) {
  debugPrint('Height = ' + MediaQuery.of(context).toString());
  return displaySize(context).height;
}

double displayWidth(BuildContext context) {
  // debugPrint('Width = ' + displaySize(context).width.toString());
  return displaySize(context).width;
}

double headpadding(BuildContext context, double n) {
  return (displayHeight(context) * 0.04) + n;
}

double paddinglist(BuildContext context, double n) {
  return (displayWidth(context) * 0.04) + n;
}

// double lineSizedBox(BuildContext context, double n) {
//   return displayHeight(context) * 0.04 + n;
// }

double iconnext(BuildContext context, double n) {
  return (displayHeight(context) * 0.04) + n;
}

SizedBox lineSizedBox(BuildContext context, double n) {
  return SizedBox(
    height: displayHeight(context) * 0.04 + n,
  );
}
SizedBox hSizedBox(BuildContext context, double n) {
  return SizedBox(
    height: displayHeight(context) * 0.22 + n,
  );
}
