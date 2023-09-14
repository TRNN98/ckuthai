import 'package:appbase/about.dart';
import 'package:appbase/class/customUI.dart';
import 'package:appbase/class/language.dart';
import 'package:appbase/class/myclass.dart';
import 'package:appbase/class/mycolor.dart';
import 'package:appbase/class/sizes.dart';
import 'package:appbase/class/textstyle.dart';
import 'package:appbase/fontSize.dart';
import 'package:appbase/locals/dblg.dart';
import 'package:appbase/models/lgDb.dart';
import 'package:appbase/models/tfDb.dart';
import 'package:appbase/pins.dart';
import 'package:appbase/security.dart';
import 'package:flutter/material.dart';

import 'locals/dbTF.dart';

bool isSwitched = false;
double _fontsizeapps = 1.0;

class Setting extends StatefulWidget {
  String lgs;
  double fontsizeapps;
  Setting({Key key, this.lgs, this.fontsizeapps}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

var txtLanguage = '';
var numLanguage;
DBLg dBLg;
LGDb lg = LGDb();

class _SettingState extends State<Setting> {
  TFDb tf = TFDb();
  DBTf dBTf;
  @override
  void initState() {
    dBTf = DBTf();
    dBLg = DBLg();
    super.initState();
    isSwitched = false;
    _inittf();
  }

  @override
  void dispose() {
    dBTf.close();
    super.dispose();
  }

  _getlg() async {
    var l;
    await dBLg.initDB();
    l = await dBLg.getLg();
    print(MyClass.json(l)[0]['lg']);
    if (MyClass.json(l)[0]['lg'] == '1') {
      txtLanguage = 'English';
      numLanguage = 1;
    } else {
      txtLanguage = 'ไทย';
      numLanguage = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.fontsizeapps;
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    _getlg();

    return Scaffold(
      body: Stack(
        children: [
          // CustomTextStyle.headcolor(context, 0),
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.all(0),
            child: Column(
              children: [
                // Image.asset('assets/imgs/icon.png',
                //     width: tabletMode == true
                //         ? displayWidth(context) * 0.1
                //         : displayWidth(context) * 0.2,
                //     height: tabletMode == true
                //         ? displayWidth(context) * 0.1
                //         : displayWidth(context) * 0.2),
              ],
            ),
          ),
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
                      ? displayHeight(context) * 0.40
                      : displayHeight(context) * 0.29,
                ),
                // _getlg(),
                _about(context, tabletMode, widget.lgs),
                _passwordsecurity(context, tabletMode, widget.lgs),
                // _language(context, tabletMode, widget.lgs),
                _touchandface(context),
                _adjustFontSize(context, tabletMode, widget.lgs),
              ],
            ),
          ),
          CustomUI.appbarBackgroundUi(context),
          CustomUI.appbarUi(),
          CustomUI.appbarTxtTitleUi(
              Language.settingLg('setting', widget.lgs),_fontsizeapps, context),
          CustomUI.appbarDetailUi1('assets/imgs/icon.png', context),
        ],
      ),
      // bottomNavigationBar: BottomAppBar(
      //   child: Container(
      //     height: 50,
      //     child: Center(
      //       child: FlatButton(
      //         onPressed: () => {
      //           // Navigator.pushNamedAndRemoveUntil(
      //           //     context, '/page4', ModalRoute.withName('/page1')),
      //           Navigator.pushReplacement(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => Pins(gettitle: 'pinCode'),
      //             ),
      //           )
      //         },
      //         child: Text(
      //           Language.settingLg('logOut', widget.lgs),
      //           textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style:  TextStyle(color: Colors.red, fontSize: displaySize(context).height * 0.04),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }

  Container _touchandface(context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
      // padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      height: MediaQuery.of(context).size.height * 0.11,
      child: Card(
        elevation: 8,
        color: Colors.white,
        child: ClipPath(
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(
                        color: MyColor.color('settings'), width: 8))),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    Language.settingLg('touchAndFace', widget.lgs),
                    textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style:  CustomTextStyle.settingTxt(context, 0),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Switch(
                          value: isSwitched,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
                              if (value == true) {
                                tf.tf = '1';
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Pins(
                                        gettitle: 'confirmTouchIDAndFaceID'),
                                  ),
                                );

                                // dBTf.initDB().then((value) => {
                                //       dBTf.insertTf(tf).then((value) => {}),
                                //     });
                              } else {
                                dBTf.initDB().then((value) => {
                                      dBTf.deleteAll().then((value) => {}),
                                    });
                              }
                            });
                          })

                      // Icon(Icons.keyboard_arrow_right),
                    ],
                  ),
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

  _inittf() {
    try {
      dBTf.initDB().then((value) => {
            dBTf
                .getTf()
                .then((value) => {_checkTF(MyClass.json(value)[0]['tf'])})
          });
    } catch (error) {
      setState(() {
        isSwitched = false;
      });
    }
  }

  _checkTF(value) {
    if (value == '1') {
      setState(() {
        isSwitched = true;
      });
    } else {
      setState(() {
        isSwitched = false;
      });
    }
  }
}

InkWell _language(context, tabletMode, lgs) {
  return InkWell(
    onTap: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            int selectedRadio = numLanguage;
            return AlertDialog(
              content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List<Widget>.generate(2, (int index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Radio<int>(
                                value: index,
                                groupValue: selectedRadio,
                                onChanged: (int value) {
                                  setState(() =>
                                      {selectedRadio = value, print(index)});
                                },
                              ),
                              index == 0 ? Text("   ไทย   ") : Text("English")
                            ],
                          );
                        }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RaisedButton(
                            color: Colors.brown[50],
                            child: Text(Language.settingLg('cancel', lgs)),
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                          ),
                          RaisedButton(
                            color: Colors.blue,
                            child: Text(Language.settingLg('change', lgs)),
                            onPressed: () {
                              // print(selectedRadio);
                              lg.lg = selectedRadio.toString();
                              dBLg.initDB().then((value) => {
                                    dBLg.deleteAll().then((value) => {
                                          dBLg.insertLg(lg).then(
                                                (value) => {
                                                  Navigator.of(context)
                                                      .pop(true),
                                                  Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          Pins(),
                                                    ),
                                                  )
                                                },
                                              ),
                                        })
                                  });
                            },
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            );
          });
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => LanguageSettings(),
      //   ),
      // );
    },
    child: Container(
      padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
      // padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      height: MediaQuery.of(context).size.height * 0.11,
      child: Card(
        elevation: 8,
        color: Colors.white,
        child: ClipPath(
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(
                        color: MyColor.color('settings'), width: 8))),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    Language.settingLg('language', lgs),
                    textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style:  CustomTextStyle.settingTxt(context, 0),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Text(
                      //   txtLanguage,
                      //   textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style:  CustomTextStyle.settingTxt(context, 5),
                      // ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        size: iconnext(context, 0),
                        color: MyColor.color('settings'),
                      ),
                    ],
                  ),
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
    ),
  );
}

InkWell _about(context, tabletMode, lgs) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          // builder: (context) => UploadImageDemo(),
          builder: (context) => About(lgs: lgs,fontsizeapps:_fontsizeapps),
        ),
      );
    },
    child: Container(
      padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
      // padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      height: MediaQuery.of(context).size.height * 0.11,
      child: Card(
        elevation: 8,
        color: Colors.white,
        child: ClipPath(
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(
                        color: MyColor.color('settings'), width: 8))),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    Language.settingLg('about', lgs),
                    textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style:  CustomTextStyle.settingTxt(context, 0),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.keyboard_arrow_right,
                        size: iconnext(context, 0),
                        color: MyColor.color('settings'),
                      ),
                    ],
                  ),
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
    ),
  );
}

InkWell _passwordsecurity(context, tabletMode, lgs) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Security(lgs: lgs,fontsizeapps:_fontsizeapps),
        ),
      );
    },
    child: Container(
      padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
      // padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      height: MediaQuery.of(context).size.height * 0.11,
      child: Card(
        elevation: 8,
        color: Colors.white,
        child: ClipPath(
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(
                        color: MyColor.color('settings'), width: 8))),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    Language.settingLg('passwordSecurity', lgs),
                    textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style:  CustomTextStyle.settingTxt(context, 0),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.keyboard_arrow_right,
                        size: iconnext(context, 0),
                        color: MyColor.color('settings'),
                      ),
                    ],
                  ),
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
    ),
  );
}

InkWell _adjustFontSize(context, tabletMode, lgs) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FontSize(lgs: lgs,fontsizeapps:_fontsizeapps),
        ),
      );
    },
    child: Container(
      padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
      // padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      height: MediaQuery.of(context).size.height * 0.11,
      child: Card(
        elevation: 8,
        color: Colors.white,
        child: ClipPath(
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(
                        color: MyColor.color('settings'), width: 8))),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    Language.settingLg('adjustFontSize', lgs),
                    textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style:  CustomTextStyle.settingTxt(context, 0),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.keyboard_arrow_right,
                        size: iconnext(context, 0),
                        color: MyColor.color('settings'),
                      ),
                    ],
                  ),
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
    ),
  );
}
