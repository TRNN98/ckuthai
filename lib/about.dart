import 'dart:io' show Platform;

import 'package:appbase/class/customUI.dart';
import 'package:appbase/class/language.dart';
import 'package:appbase/class/myclass.dart';
import 'package:appbase/class/mycolor.dart';
import 'package:appbase/class/sizes.dart';
import 'package:appbase/class/textstyle.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';

double _fontsizeapps = 1.0;

class About extends StatefulWidget {
  String lgs;
  double fontsizeapps;
  About({Key key, this.lgs, this.fontsizeapps}) : super(key: key);
  @override
  _AboutState createState() => _AboutState();
}

class DeviceInfo {
  DeviceInfo() {
    this.name = '';
    this.platform = '';
    this.version = '';
    this.model = '';
  }

  String name;
  String platform;
  String version;
  String model;
}

DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

class _AboutState extends State<About> {
  DeviceInfo device = DeviceInfo();

  void getDevice() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      device.name = androidInfo.device;
      device.platform = androidInfo.product;
      device.version = androidInfo.version.release;
      device.model = androidInfo.model;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      device.name = iosInfo.name;
      device.platform = iosInfo.systemName;
      device.version = iosInfo.systemVersion;
      device.model = iosInfo.model;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.fontsizeapps;
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    getDevice();
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: MyColor.color('settings'),
      //   elevation: 0.0,
      // ),
      body: Stack(
        children: [
          // CustomTextStyle.headcolor(context, 0),
          // Container(
          //   alignment: Alignment.topCenter,
          //   padding: const EdgeInsets.only(top: 0),
          //   child: Column(
          //     children: [
          //       Image.asset('assets/imgs/icon.png',
          //           width: tabletMode == true
          //               ? displayWidth(context) * 0.1
          //               : displayWidth(context) * 0.2,
          //           height: tabletMode == true
          //               ? displayWidth(context) * 0.1
          //               : displayWidth(context) * 0.2),
          //     ],
          //   ),
          // ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/imgs/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: tabletMode == true
                      ? displayHeight(context) * 0.30
                      : displayHeight(context) * 0.25,
                ),
                _versionApp(context, widget.lgs),
                _versionMobile(device, context, widget.lgs),
              ],
            ),
          ),
          CustomUI.appbarBackgroundUi(context),
          CustomUI.appbarUi(),
          CustomUI.appbarDetailUi1('assets/imgs/icon.png', context),
        ],
      ),
    );
  }
}

Container _versionApp(context, lgs) {
  return Container(
    // padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
    height: MediaQuery.of(context).size.height * 0.20,
    child: Card(
      elevation: 8,
      color: Colors.white,
      child: ClipPath(
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  left:
                      BorderSide(color: MyColor.color('settings'), width: 8))),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    Language.settingLg('application', lgs),
                    textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                    style: CustomTextStyle.settingTxt(context, 5),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      Language.settingLg('version', lgs),
                      textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      style: CustomTextStyle.settingTxt(context, 5),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            MyClass.versionApp().split('.')[0] +
                                '.' +
                                int.parse(MyClass.versionApp().split('.')[1])
                                    .toString(),
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.settingTxt(context, 5),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        clipper: ShapeBorderClipper(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    ),
  );
}

Container _versionMobile(device, context, lgs) {
  return Container(
    // padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
    height: MediaQuery.of(context).size.height * 0.30,
    child: Card(
      elevation: 8,
      color: Colors.white,
      child: ClipPath(
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  left:
                      BorderSide(color: MyColor.color('settings'), width: 8))),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      Language.settingLg('mobile', lgs),
                      textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      style: CustomTextStyle.settingTxt(context, 5),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        Language.settingLg('version', lgs),
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.settingTxt(context, 0),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        device.version,
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.settingTxt(context, 0),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        Language.settingLg('platform', lgs),
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.settingTxt(context, 0),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        device.platform,
                        overflow: TextOverflow.ellipsis,
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.settingTxt(context, 0),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        Language.settingLg('model', lgs),
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.settingTxt(context, 0),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        device.model,
                        overflow: TextOverflow.ellipsis,
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.settingTxt(context, 0),
                      ),
                    ),
                  ],
                ),
                // Row(
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.only(left: 15),
                //       child: Text(
                //         'Name',
                //         textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style:  CustomTextStyle.settingTxt(context, 5),
                //       ),
                //     ),
                //     Expanded(
                //       child: Padding(
                //         padding: const EdgeInsets.only(right: 15),
                //         child: SingleChildScrollView(
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.end,
                //             children: [
                //               AutoSizeText(
                //                 device.name,
                //                 textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style:  TextStyle(
                //                   fontFamily: "FC_Lamoon",
                //                   fontWeight: FontWeight.bold,
                //                   color: Colors.green,
                //                   // fontSize: 30,
                //                 ),
                //                 // textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style:  CustomTextStyle.settingTxt(context, -5),

                //                 minFontSize: 20,
                //                 maxLines: 1,
                //               )
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
        clipper: ShapeBorderClipper(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    ),
  );
}
