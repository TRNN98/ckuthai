import 'package:appbase/checkRegister.dart';
import 'package:appbase/class/customUI.dart';
import 'package:appbase/class/language.dart';
import 'package:appbase/class/myclass.dart';
import 'package:appbase/class/mycolor.dart';
import 'package:appbase/class/sizes.dart';
import 'package:appbase/class/textstyle.dart';
import 'package:appbase/locals/dbPin.dart';
import 'package:appbase/locals/dbUser.dart';
import 'package:appbase/login.dart';
import 'package:appbase/pins.dart';
import 'package:flutter/material.dart';

double _fontsizeapps = 1.0;

class Checksecurity extends StatefulWidget {
  final int type;
  final String lgs;
  final double fontsizeapps;
  Checksecurity({Key key, this.type, this.lgs, this.fontsizeapps})
      : super(key: key);
  @override
  _ChecksecurityState createState() => _ChecksecurityState();
}

class CheckSecuritys {
  String title;
  String detail;
  CheckSecuritys({this.title, this.detail});
}

class _ChecksecurityState extends State<Checksecurity> {
  DBPin dBPin;
  DBUser dBUser;

  @override
  void initState() {
    dBPin = DBPin();
    dBUser = DBUser();

    super.initState();
  }

  @override
  void dispose() {
    dBPin.close();
    dBUser.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.fontsizeapps;
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    List<CheckSecuritys> checkSecuritys = <CheckSecuritys>[
      CheckSecuritys(
          title: Language.settingLg('changePin', widget.lgs),
          detail: Language.settingLg('changePinDetail', widget.lgs)),
      CheckSecuritys(
          title: Language.settingLg('forgotPassword', widget.lgs),
          detail: Language.settingLg('forgotPasswordDetail', widget.lgs)),
      CheckSecuritys(
          title: Language.settingLg('deactivate', widget.lgs),
          detail: Language.settingLg('deactivateDetail', widget.lgs)),
    ];
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: MyColor.color('colorheader'),
      //   elevation: 0.0,
      // ),
      body: Stack(
        children: [
          // CustomTextStyle.headcolor(context, 0),
          // Container(
          //     alignment: Alignment.topCenter,
          //     padding: const EdgeInsets.only(top: 0),
          //     child: Image.asset('assets/imgs/icon.png',
          //         width: tabletMode == true
          //             ? displayWidth(context) * 0.1
          //             : displayWidth(context) * 0.2,
          //         height: tabletMode == true
          //             ? displayWidth(context) * 0.1
          //             : displayWidth(context) * 0.2)),

          Container(
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/imgs/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  tabletMode == true
                      ? hSizedBox(context, 300)
                      : hSizedBox(context, 250),
                  Center(
                      child: Text(
                    checkSecuritys[widget.type].title,
                    textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                    style: CustomTextStyle.defaultTxt(context, 15),
                  )),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Center(
                        child: Text(
                      checkSecuritys[widget.type].detail,
                      textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      style: CustomTextStyle.defaultTxt(context, 0),
                    )),
                  ),
                  lineSizedBox(context, 0),
                  Center(
                      child: Text(
                    Language.settingLg('youWant', widget.lgs) +
                        "${checkSecuritys[widget.type].title} " +
                        Language.settingLg('yesOrNo', widget.lgs),
                    // 'ท่านต้องการ${checkSecuritys[widget.type].title} ใช่หรือไม่',
                    textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                    style: CustomTextStyle.defaultTxt(context, 5),
                  )),
                  _buttom()
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: displayHeight(context) * 0.33),
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(MyClass.company('th'),
                      textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      style: CustomTextStyle.dataHeadTitleTxt(context, 5)),
                  Text(MyClass.company('en'),
                      textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      style: CustomTextStyle.dataHeadTitleTxt(
                          context, tabletMode == true ? -15 : -4)),
                ],
              ),
            ),
          ),
          CustomUI.appbarBackgroundUi(context),
          CustomUI.appbarUi(),
          CustomUI.appbarDetailUi1('assets/imgs/icon.png', context),
        ],
      ),
    );
  }

  Widget _buttom() {
    return Container(
      // width: MediaQuery.of(context).size.width,
      // margin: EdgeInsets.only(top: 32),
      child: Row(
        children: [
          Expanded(
            child: Text(''),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: RaisedButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              color: MyColor.color('button'),
              onPressed: _submit,
              child: Text(
                Language.settingLg('yes', widget.lgs),
                textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                style: CustomTextStyle.buttonTxt(context, 5),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: RaisedButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              color: MyColor.color('button'),
              onPressed: () {
                Navigator.pop(context);
                // Navigator.of(context).pushReplacement(
                //   MaterialPageRoute(
                //     builder: (context) => Security(),
                //   ),
                // );
              },
              child: Text(
                Language.settingLg('no', widget.lgs),
                textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                style: CustomTextStyle.buttonTxt(context, 5),
              ),
            ),
          ),
          Expanded(
            child: Text(''),
          ),
        ],
      ),
    );
  }

  _submit() {
    if (widget.type == 0) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Pins(gettitle: 'originalPINCode'),
        ),
      );
    } else if (widget.type == 1) {
      dBPin.initDB().then(
            (value) => {
              dBPin.deleteAll().then(
                    (value) => {
                      // Navigator.of(context).pushReplacement(
                      //   MaterialPageRoute(
                      //     builder: (context) => Checkregister(
                      //         title: Language.loginLg(
                      //             'forgotPassword', widget.lgs)),
                      //   ),
                      // )
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => Checkregister(
                                  title: Language.loginLg(
                                      'forgotPassword', widget.lgs))),
                          (Route<dynamic> route) => false)
                    },
                  )
            },
          );
    } else if (widget.type == 2) {
      dBPin.initDB().then(
            (value) => {
              dBPin.deleteAll().then(
                    (value) => {
                      dBUser.initDB().then(
                            (value) => {
                              dBUser.deleteAll().then((value) => {
                                    setState(() {}),
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                          builder: (context) => Login(
                                            lgs: widget.lgs,
                                          ),
                                        ),
                                        (Route<dynamic> route) => false)
                                  })
                            },
                          ),
                    },
                  )
            },
          );
    }
  }
}
