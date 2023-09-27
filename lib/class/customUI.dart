import 'package:appbase/class/language.dart';
import 'package:appbase/class/myclass.dart';
import 'package:appbase/class/sizes.dart';
import 'package:appbase/class/textstyle.dart';
import 'package:appbase/pins.dart';
import 'package:appbase/settings.dart';
import 'package:flutter/material.dart';

import 'dart:io' show Platform;

class CustomUI {
  static Positioned appbarUi() {
    return Positioned(
      top: 0.0,
      left: 0.0,
      right: 0.0,
      child: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
    );
  }

  static Positioned appbarUiMainMenu(url, name, lgs, _fontsizeapps, context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Positioned(
      top: Platform.isAndroid ? 10.0 : 0,
      left: 0.0,
      right: 0.0,
      // height: 190,
      child: Padding(
        padding: EdgeInsets.only(
            left: 20, right: 20, bottom: 20, top: tabletMode == true ? 40 : 20),
        child: SizedBox(
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            //  titleSpacing: 10.0,
            // automaticallyImplyLeading: false,
            toolbarHeight: tabletMode == true ? 100 : null,
            // automaticallyImplyLeading: true,
            automaticallyImplyLeading: false,
            title: tabletMode == true
                ? Row(
                    children: <Widget>[
                      Container(
                        // padding: EdgeInsets.only(
                        //     right: 10, left: 10, bottom: 10, top: 10),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(
                              '${MyClass.hostApp()}/member/profile/boy.jpg'),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.transparent,
                            backgroundImage: NetworkImage(url),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(Language.menuLg('welcome', lgs),
                              textAlign: TextAlign.left,
                              textScaleFactor: MyClass.fontSizeApp(),
                              style: CustomTextStyle.titleTxt(context, -20)),
                          Text(name,
                              textScaleFactor: MyClass.fontSizeApp(),
                              style: CustomTextStyle.titleTxt(context, -40)),
                        ],
                      ),
                    ],
                  )
                : Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(Language.menuLg('welcome', lgs),
                          textAlign: TextAlign.left,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.titleTxt(context, 0)),
                      Text(name,
                          textAlign: TextAlign.left,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.titleTxt(context, -10)),
                    ],
                  ),
            leading: tabletMode == false
                ? Container(
                    // padding: EdgeInsets.only(
                    //     right: 10, left: 10, bottom: 10, top: 10),
                    child: CircleAvatar(
                      radius: tabletMode == true ? 50 : 40,
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(
                          '${MyClass.hostApp()}/member/profile/boy.jpg'),
                      child: CircleAvatar(
                        radius: tabletMode == true ? 50 : 40,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(url),
                      ),
                    ),
                  )
                : null,
            actions: [
              // NamedIcon(
              //   text: '',
              //   iconData: Icons.notifications,
              //   notificationCount: 3,
              //   onTap: () {
              //     // Navigator.push(
              //     //   context,
              //     //   MaterialPageRoute(
              //     //     builder: (context) => Msgs(
              //     //         groupID: groupID,
              //     //         token: token,
              //     //         lgs: lgs,
              //     //         membership_no: membership_no,
              //     //         sex: sex,
              //     //         name: name,
              //     //         param: param),
              //     //   ),
              //     // );
              //   },
              // ),
              NamedIcon(
                text: '',
                iconData: Icons.settings,
                notificationCount: 0,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Setting(lgs: lgs, fontsizeapps: _fontsizeapps),
                    ),
                  );
                },
              ),
              NamedIcon(
                text: '',
                iconData: Icons.exit_to_app,
                notificationCount: 0,
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new Pins(gettitle: 'pinCode')),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Container appbarDetailUi(url, context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(
          top: tabletMode == true
              ? displayHeight(context) * 0.02
              : displayHeight(context) * 0.05),
      child: Image.asset(
        url,
        width: tabletMode == true
            ? displayWidth(context) * 0.17
            : displayWidth(context) * 0.25,
        height: tabletMode == true
            ? displayWidth(context) * 0.17
            : displayWidth(context) * 0.25,
        fit: BoxFit.cover,
      ),
    );
  }

  static Container appbarDetailUi1(url, context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: displayHeight(context) * 0.13),
      child: Image.asset(
        url,
        width: tabletMode == true
            ? displayWidth(context) * 0.25
            : displayWidth(context) * 0.25,
        height: tabletMode == true
            ? displayWidth(context) * 0.25
            : displayWidth(context) * 0.25,
        fit: BoxFit.cover,
      ),
    );
  }

  static Container appbarDetailUiPro(url, context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    // imageCache.clear();
    print(url);
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: displayHeight(context) * 0.05),
      child: CircleAvatar(
        radius: tabletMode == true ? 80 : 40,
        backgroundColor: Colors.transparent,
        backgroundImage:
            NetworkImage('${MyClass.hostApp()}/member/profile/boy.jpg'),
        child: CircleAvatar(
            radius: tabletMode == true ? 80 : 40,
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(url)),
      ),
    );
  }

  static Container appbarDetailUiPro1(url, context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    imageCache.clear();
    // ImageCache();
    print(url);
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: displayHeight(context) * 0.12),
      child: CircleAvatar(
        radius: tabletMode == true ? 80 : 40,
        backgroundColor: Colors.transparent,
        backgroundImage:
            NetworkImage('${MyClass.hostApp()}/member/profile/boy.jpg'),
        child: CircleAvatar(
            radius: tabletMode == true ? 80 : 40,
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(url)),
      ),
    );
  }

  static Padding appbarBackgroundUi(context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2.0),
      // child: ClipPath(
      //   // clipper: ClippingClass(),
      //   child: Container(
      //     width: MediaQuery.of(context).size.width,
      //     height: displayHeight(context) * 0.25,
      //     decoration: BoxDecoration(
      //         image: DecorationImage(
      //       fit: BoxFit.fill,
      //       image: AssetImage("assets/imgs/hbg3.jpg"),
      //     )),
      //   ),
      // ),
    );
  }

  static Padding appbarTxtTitleUi(txt, _fontsizeapps, context) {
    return Padding(
      padding: EdgeInsets.only(
        top: displayHeight(context) * 0.05,
      ),
      child: Column(
        children: [
          Center(
            child: Text(
              txt,
              textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
              style: CustomTextStyle.titleTxt(context, 0),
            ),
          ),
        ],
      ),
    );
  }

  static Padding sliverTxtTitleUi(txt, context) {
    return Padding(
      padding: EdgeInsets.only(
        top: displayHeight(context) * 0.1,
      ),
      child: Column(
        children: [
          Center(
            child: Text(
              txt,
              textScaleFactor: MyClass.fontSizeApp(),
              style: CustomTextStyle.titleTxt(context, -15),
            ),
          ),
        ],
      ),
    );
  }
}

class NamedIcon extends StatelessWidget {
  final IconData iconData;
  final String text;
  final VoidCallback onTap;
  final int notificationCount;

  const NamedIcon({
    Key key,
    this.onTap,
    @required this.text,
    @required this.iconData,
    this.notificationCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: tabletMode == true ? 55 : 30,
        padding: EdgeInsets.symmetric(horizontal: 2),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  iconData,
                  color: Colors.black,
                  size: tabletMode == true ? 45 : 27,
                ),
                // Text(text, overflow: TextOverflow.ellipsis),
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: notificationCount != 0
                  ? Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: tabletMode == true ? 20 : 4,
                        vertical: tabletMode == true ? 9 : 7,
                      ),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red),
                      alignment: Alignment.center,
                      child: Text(
                        '$notificationCount',
                        textScaleFactor: MyClass.fontSizeApp(),
                        style: TextStyle(
                          fontSize: tabletMode == true ? 23 : 15,
                        ),
                      ),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
