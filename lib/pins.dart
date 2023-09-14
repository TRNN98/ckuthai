import 'dart:async';
import 'dart:io';
import 'dart:io' show Platform;

import 'package:appbase/class/language.dart';
import 'package:appbase/class/myclass.dart';
import 'package:appbase/class/mycolor.dart';
import 'package:appbase/class/sizes.dart';
import 'package:appbase/class/textstyle.dart';
import 'package:appbase/introScreen.dart';
import 'package:appbase/locals/dbFontSize.dart';
import 'package:appbase/locals/dbPin.dart';
import 'package:appbase/locals/dbTF.dart';
import 'package:appbase/locals/dbUser.dart';
import 'package:appbase/locals/dblg.dart';
import 'package:appbase/login.dart';
import 'package:appbase/models/fontSizeDb.dart';
import 'package:appbase/models/lgDb.dart';
import 'package:appbase/models/pinDb.dart';
import 'package:appbase/models/tfDb.dart';
import 'package:appbase/services/netword.dart';
import 'package:appbase/settings.dart';
import 'package:appbase/tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:local_auth/local_auth.dart';

import 'package:url_launcher/url_launcher.dart';

class Param {
  String token;
  String name;
  String membership_no;
  String sex;
  String lgs;
  double fontsizeapps;

  Param(this.token, this.name, this.membership_no, this.sex, this.lgs,
      this.fontsizeapps);
}

class Pins extends StatefulWidget {
  final String gettitle;

  Pins({Key key, this.gettitle}) : super(key: key);

  @override
  _PinsState createState() => _PinsState();
}

class _PinsState extends State<Pins> {
  PinDb pin = PinDb();
  TFDb tf = TFDb();
  DBLg dBLg;
  LGDb lg = LGDb();

  String getlgs;
  String numberPin = '';
  String numberPin1 = '';
  String title = '';

  DBUser dBUser;
  DBPin dBPin;
  DBTf dBTf;

  DBFs dBFs;
  FontSizeDb fs = FontSizeDb();

  final LocalAuthentication auth = LocalAuthentication();
  bool _canCheckBiometrics = false;
  List<BiometricType> _availableBiometrics;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;

  double _fontSizeApp = 1.0;

  // Future<void> _oneSignal(tag) async {
  //   OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  //
  //   OneSignal.shared.init("4bfb9129-e7fa-40bc-a0e3-aaf22bcf53ae", iOSSettings: {
  //     OSiOSSettings.autoPrompt: false,
  //     OSiOSSettings.inAppLaunchUrl: false
  //   });
  //   OneSignal.shared
  //       .setInFocusDisplayType(OSNotificationDisplayType.notification);
  //   await OneSignal.shared
  //       .promptUserForPushNotificationPermission(fallbackToSettings: true);
  //   await OneSignal.shared.sendTag('membership_no', tag);
  // }

  Future<void> _getversions() {
    Network.fetchVersions('{}').then((value) => _checkversion(value));
  }

  _checkversion(v) {
    if (Platform.isAndroid) {
      double.parse(v[0]['fandroid']) >= double.parse(MyClass.versionApp())
          ? _showfupdateversion(v, 'a')
          : double.parse(v[0]['vandroid']) > double.parse(MyClass.versionApp())
              ? _showupdateversion(v, 'a')
              : null;
      // : _authTF();
    } else if (Platform.isIOS) {
      double.parse(v[0]['fios']) >= double.parse(MyClass.versionApp())
          ? _showfupdateversion(v, 'i')
          : double.parse(v[0]['vios']) > double.parse(MyClass.versionApp())
              ? _showupdateversion(v, 'i')
              : null;
      // : _authTF();
    }
  }

  hiddenDialog(n) {
    Future.delayed(Duration(seconds: n), () {
      Navigator.of(context, rootNavigator: true).pop('dialog');
    });
  }

  _showupdateversion(v, p) {
    setState(() {});
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(Language.pinLg('uversion', getlgs)),
          content: Text(v[0]['msg']),
          actions: <Widget>[
            Row(
              children: [
                FlatButton(
                  child: Text(Language.pinLg('no', getlgs)),
                  onPressed: () {
                    Navigator.of(context).pop();
                    _authTF();
                  },
                ),
                FlatButton(
                  child: Text(Language.pinLg('yes', getlgs)),
                  onPressed: () {
                    _launchURL(v[0][p == 'i' ? 'uios' : 'uandroid']);
                  },
                ),
              ],
            )
          ],
        );
      },
    );
  }

  _showfupdateversion(v, p) {
    setState(() {});
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(Language.pinLg('fversion', getlgs)),
          content: Text(v[0]['fmsg']),
          actions: <Widget>[
            Row(
              children: [
                FlatButton(
                  child: Text(Language.pinLg('update', getlgs)),
                  onPressed: () {
                    _launchURL(v[0][p == 'i' ? 'uios' : 'uandroid']);
                  },
                ),
              ],
            )
          ],
        );
      },
    );
  }

  _checkpassword() {
    dBUser.initDB().then((value) => {
          dBUser.getUsers().then((value) => {
                _gocheckpass(MyClass.json(value)[0]['user'],
                    MyClass.json(value)[0]['password']),
              })
        });
  }

  _gocheckpass(user, pass) {
    Network.fetchCheckpassword(
            '{"membership_no": "' + user + '","password":"' + pass + '"}')
        .then(
      (value) => value.toString() == '1' ? _newlogin() : null,
      // (value) =>  print(value),
    );
  }

  _newlogin() {
    setState(() {});
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(Language.pinLg('changedpassword', getlgs)),
          content: Text(Language.pinLg('changedpasswordlogin', getlgs)),
          actions: <Widget>[
            Row(
              children: [
                FlatButton(
                  child: Text(Language.pinLg('ok', getlgs)),
                  onPressed: () {
                    hiddenDialog(0);
                    _resetall();
                  },
                ),
                // FlatButton(
                //   child: Text(Language.pinLg('yes', getlgs)),
                //   onPressed: () {
                //     _launchURL(v[0][p == 'i' ? 'uios' : 'uandroid']);
                //   },
                // ),
              ],
            )
          ],
        );
      },
    );
  }

  _resetall() {
    dBPin.initDB().then(
          (value) => {
            dBPin.deleteAll().then(
                  (value) => {
                    dBUser.initDB().then(
                          (value) => {
                            dBUser.deleteAll().then((value) => {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => Login(
                                        lgs: getlgs,
                                      ),
                                    ),
                                  )
                                })
                          },
                        ),
                  },
                )
          },
        );
  }

  //
  // getfontsize() async {
  //   _fontSizeApp = await MyClass.getFontsharedPref();
  //   print(_fontSizeApp);
  // }

  @override
  void initState() {
    dBUser = DBUser();
    dBPin = DBPin();
    dBTf = DBTf();
    dBLg = DBLg();
    dBFs = DBFs();

    super.initState();
    _getfs();
    // getfontsize();
    _authTF();
    _gettitles();
    _checkpassword();
    _getversions();

    // _showMaterialDialog();
  }

  @override
  void dispose() {
    dBUser.close();
    dBPin.close();
    dBTf.close();
    dBLg.close();
    dBFs.close();

    super.dispose();
  }

  _getfs() async {
    try {
      await dBFs.initDB();
      dBFs.getFs().then((value) => {
            // _fontSizeApp = double.parse(data.toString());
            print(value.length),
            value.length > 0
                ? _fontSizeApp = double.parse(MyClass.json(value)[0]['fs'])
                : _fontSizeApp = 1.0,
          });
    } catch (err) {
      _fontSizeApp = 1.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/imgs/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                tabletMode == true
                    ? lineSizedBox(context, displayHeight(context) * 0.30)
                    : lineSizedBox(context, displayHeight(context) * 0.25),
                Text(MyClass.company('th'),
                    textScaleFactor: MyClass.fontSizeApp(),
                    style: CustomTextStyle.dataHeadTitleTxt(context, 7)),
                Text(MyClass.company('en'),
                    textScaleFactor: MyClass.fontSizeApp(),
                    style: CustomTextStyle.dataHeadTitleTxt(
                        context, tabletMode == true ? -12 : 0)),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: Text(title,
                      textScaleFactor: MyClass.fontSizeApp(),
                      style: CustomTextStyle.dataBoldTxt(context, 4)),
                ),
                SizedBox(
                  height: 1,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      numberPin.length >= 1
                          ? _joinCodePanel(1)
                          : _joinCodePanel(0),
                      numberPin.length >= 2
                          ? _joinCodePanel(1)
                          : _joinCodePanel(0),
                      numberPin.length >= 3
                          ? _joinCodePanel(1)
                          : _joinCodePanel(0),
                      numberPin.length >= 4
                          ? _joinCodePanel(1)
                          : _joinCodePanel(0),
                      numberPin.length >= 5
                          ? _joinCodePanel(1)
                          : _joinCodePanel(0),
                      numberPin.length >= 6
                          ? _joinCodePanel(1)
                          : _joinCodePanel(0),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 3,
                    childAspectRatio: tabletMode == true ? 2.8 : 1.8,
                    mainAxisSpacing: 10,
                    padding: EdgeInsets.all(10),
                    children: <Widget>[
                      _buttompin('1'),
                      _buttompin('2'),
                      _buttompin('3'),
                      _buttompin('4'),
                      _buttompin('5'),
                      _buttompin('6'),
                      _buttompin('7'),
                      _buttompin('8'),
                      _buttompin('9'),
                      title == Language.pinLg('setPassword', getlgs)
                          ? _buttompin(Language.pinLg('reset', getlgs))
                          : title == Language.pinLg('confirmPassword', getlgs)
                              ? _buttompin(Language.pinLg('reset', getlgs))
                              : title ==
                                      Language.pinLg(
                                          'confirmPleaseTryAgain', getlgs)
                                  ? _buttompin(Language.pinLg('reset', getlgs))
                                  : _buttompin(
                                      Language.pinLg('forgot', getlgs)),
                      _buttompin('0'),
                      _buttompin(Language.pinLg('delete', getlgs)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
          ),
          Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(top: 60),
              child: Image.asset('assets/imgs/icon.png',
                  width: tabletMode == true
                      ? displayWidth(context) * 0.2
                      : displayWidth(context) * 0.3,
                  height: tabletMode == true
                      ? displayWidth(context) * 0.2
                      : displayWidth(context) * 0.3)),
        ],
      ),
    );
  }

  _buttompin(n) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return InkResponse(
      onTap: () {
        _onCodeClick(n);
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: MyColor.color('button'),
                blurRadius: 3,
                spreadRadius: 0,
              )
            ]),
        child: Center(
          child: Text(
            n.toString(),
            textScaleFactor: MyClass.fontSizeApp(),
            style: CustomTextStyle.defaultTxt(context, tabletMode ? -7 : 5),
          ),
        ),
      ),
    );
  }

  _onCodeClick(n) {
    setState(() {
      numberPin += n;
      if (n == Language.pinLg('delete', getlgs)) {
        numberPin = '';
      }

      if (n.toString() == Language.pinLg('reset', getlgs)) {
        numberPin = '';
        numberPin1 = '';
        title = Language.pinLg('setPassword', getlgs);
      }

      if (n.toString() == Language.pinLg('forgot', getlgs)) {
        numberPin = '';
        numberPin1 = '';
        _resetall();
      }
    });
    if (numberPin.length >= 6) {
      // print(title);
      // print(Language.pinLg('originalPINCode', getlgs));
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              backgroundColor: Colors.transparent, content: MyClass.loading());
        },
      );
      // hiddenDialog(20);

      if (title == Language.pinLg('setPassword', getlgs)) {
        hiddenDialog(2);
        numberPin1 = numberPin;
        numberPin = '';
        title = Language.pinLg('confirmPassword', getlgs);
      } else if (title == Language.pinLg('confirmPassword', getlgs) ||
          title == Language.pinLg('confirmPleaseTryAgain', getlgs)) {
        // hiddenDialog(2);
        if (numberPin == numberPin1) {
          pin.pinnumber = numberPin1;
          dBPin.initDB().then((value) => {
                dBPin.deleteAll().then((value) => {
                      dBPin.insertPins(pin).then((value) => {
                            numberPin = '',
                            _onLogin('n'),
                            title = Language.pinLg('pinCode', getlgs),
                          })
                    })
              });
        } else {
          numberPin = '';
          hiddenDialog(2);
          title = Language.pinLg('confirmPleaseTryAgain', getlgs);
        }
      } else if (title == Language.pinLg('pinCode', getlgs) ||
          title == Language.pinLg('pleaseTryAgain', getlgs)) {
        dBPin.initDB().then((value) => {
              dBPin.getPins().then(
                    (value) => {
                      _onCheckLogin(MyClass.json(value)[0]['pinnumber']),
                    },
                  )
            });
      } else if (title == Language.pinLg('originalPINCode', getlgs) ||
          title == Language.pinLg('incorrectOriginalPINCode', getlgs)) {
        dBPin.initDB().then((value) => {
              dBPin.getPins().then(
                    (value) => {
                      hiddenDialog(2),
                      _onChangpin(
                          MyClass.json(value)[0]['pinnumber'], numberPin),
                    },
                  )
            });
      } else if (title == Language.pinLg('confirmTouchIDAndFaceID', getlgs) ||
          title == Language.pinLg('incorrectconfirmTouchIDAndFaceID', getlgs)) {
        dBPin.initDB().then((value) => {
              dBPin.getPins().then(
                    (value) => {
                      _onTouchIDAndFaceID(
                          MyClass.json(value)[0]['pinnumber'], numberPin),
                    },
                  )
            });
      }
    }
    // });
  }

  _onTouchIDAndFaceID(pin, pinnum) {
    if (pin == pinnum) {
      hiddenDialog(0);
      tf.tf = '1';
      dBTf.initDB().then((value) => {
            dBTf.insertTf(tf).then((value) => {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => Setting(lgs: getlgs),
                    ),
                  )
                }),
          });
      numberPin = '';
    } else {
      title = Language.pinLg('incorrectconfirmTouchIDAndFaceID', getlgs);
      numberPin = '';
    }
  }

  _onChangpin(pin, pinnum) {
    if (pin == pinnum) {
      title = Language.pinLg('setPassword', getlgs);
      numberPin = '';
    } else {
      title = Language.pinLg('incorrectOriginalPINCode', getlgs);
      numberPin = '';
    }
  }

  _onCheckLogin(pin) {
    if (pin == numberPin) {
      // numberPin = '';
      _onLogin('n');
    } else {
      title = Language.pinLg('pleaseTryAgain', getlgs);
      numberPin = '';
      hiddenDialog(2);
    }
  }

  _onLogin(n) {
    dBUser.initDB().then((value) => {
          dBUser.getUsers().then((value) => {
                _goMenu(MyClass.json(value)[0]['user'],
                    MyClass.json(value)[0]['password'], n),
              })
        });
  }

  _goMenu(user, pass, n) {
    var param;
    var name;
    var sex;
    var lgs;
    n == 'n' ? Navigator.of(context, rootNavigator: true).pop('dialog') : null;

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            backgroundColor: Colors.transparent, content: MyClass.loading());
      },
    );
    Timer t = Timer(Duration(seconds: 10), () {
      Navigator.of(context, rootNavigator: true).pop('AlertDialog');
      setState(() {
        numberPin = '';
      });
    });
    Network.fetchpinlogin(
            '{"membership_no": "' + user + '","mem_password":"' + pass + '"}')
        .then((value) => {
              name = value[0]['member']['PRENAME'] +
                  value[0]['member']['MEMBER_NAME'] +
                  ' ' +
                  value[0]['member']['MEMBER_SURNAME'],
              sex = value[0]['member']['SEX'].toString(),
              lgs = 'th',
              param = Param(
                  value[0]['token'],
                  name,
                  MyClass.genmember(
                          value[0]['member']['MEMBERSHIP_NO'].toString())
                      .toString(),
                  sex,
                  lgs,
                  _fontSizeApp),
              Navigator.of(context, rootNavigator: true).pop('AlertDialog'),
              // _oneSignal(user),
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => Tabs(param),
                ),
              ),
              t.cancel()
            });
  }

  _codePanel(n) {
    if (n == 1) {
      return SizedBox(
          width: 22,
          height: 22,
          child: Container(
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                border: new Border.all(color: Colors.black87, width: 2.0),
                color: Colors.black87),
          ));
    } else {
      return SizedBox(
        width: 22,
        height: 22,
        child: Container(
          decoration: new BoxDecoration(
              shape: BoxShape.circle,
              border: new Border.all(color: Colors.black87, width: 2.0),
              color: Colors.white),
        ),
      );
    }
  }

  Widget _joinCodePanel(n) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: _codePanel(n),
    );
  }

  _authTF() {
    dBPin.initDB().then((value) => {
          dBPin.getPins().then((value) => {_checkpin(MyClass.json(value))})
        });
  }

  _checkpin(pi) {
    if (title != Language.pinLg('setPassword', getlgs)) {
      try {
        if (pi[0]['pinnumber'].toString().length == 6) {
          if (title != Language.pinLg('originalPINCode', getlgs)) {
            dBTf.initDB().then((value) => {
                  // title = 'กรุณาใส่รหัส PIN Code',
                  dBTf.getTf().then(
                      (value) => {_touchandface(MyClass.json(value)[0]['tf'])})
                });
          }
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => IntroScreen(),
            ),
          );
        }
      } catch (e) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => IntroScreen(),
          ),
        );
      }
    }
  }

  _touchandface(check) async {
    List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();
    if (check == '1') {
      if (Platform.isIOS) {
        if (availableBiometrics.contains(BiometricType.face)) {
          _authenticate();
        } else if (availableBiometrics.contains(BiometricType.fingerprint)) {
          _isAuthenticating ? _cancelAuthentication() : _authenticate();
        }
      } else {
        print(BiometricType);
        print(availableBiometrics.contains(BiometricType.fingerprint));
        if (availableBiometrics.contains(BiometricType.fingerprint)) {
          _isAuthenticating ? _cancelAuthentication() : _authenticate();
        }
      }
    }
  }

  Future<void> _checkBiometrics() async {
    bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {}
    if (!mounted) return;

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
      print(availableBiometrics);
      var localAuth = LocalAuthentication();
      bool didAuthenticate = await localAuth.authenticateWithBiometrics(
          localizedReason: 'Please authenticate to show account balance');
    } on PlatformException catch (e) {}
    if (!mounted) return;

    setState(() {
      _availableBiometrics = availableBiometrics;
    });
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: 'Scan your fingerprint to authenticate',
          useErrorDialogs: true,
          stickyAuth: true);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Authenticating';
      });
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    print(authenticated);
    if (authenticated == true) {
      _onLogin('tf');
    }
    setState(() {
      _authorized = message;
    });
  }

  void _cancelAuthentication() {
    auth.stopAuthentication();
  }

  _gettitles() {
    // dBLg.initDB().then((x) => {
    //       dBLg.getLg().then(
    //             (l) => {
    //               getlgs = MyClass.json(l)[0]['lg'] == '1' ? 'en' : 'th',
    //               _gettitle(MyClass.json(l)[0]['lg'] == '1' ? 'en' : 'th'),
    //             },
    //           ),
    //     });
    getlgs = 'th';
    _gettitle('th');
  }

  _gettitle(l) {
    if (widget.gettitle == null) {
      setState(() {
        title = KeyPin.key('pinCode', l);
      });
    } else {
      setState(() {
        title = KeyPin.key(widget.gettitle, l);
      });
    }
  }
}

class KeyPin {
  static key(k, l) {
    if (k == 'pinCode') {
      return Language.pinLg('pinCode', l);
    }
    if (k == 'originalPINCode') {
      return Language.pinLg('originalPINCode', l);
    }
    if (k == 'setPassword') {
      return Language.pinLg('setPassword', l);
    }
    if (k == 'confirmTouchIDAndFaceID') {
      return Language.pinLg('confirmTouchIDAndFaceID', l);
    }
  }
}

Future<void> _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
    );
  } else {
    throw 'Could not launch $url';
  }
}
