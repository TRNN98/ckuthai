import 'dart:convert';

import 'package:appbase/checkRegister.dart';
import 'package:appbase/class/customUI.dart';
import 'package:appbase/class/language.dart';
import 'package:appbase/class/myclass.dart';
import 'package:appbase/class/mycolor.dart';
import 'package:appbase/class/sizes.dart';
import 'package:appbase/class/textstyle.dart';
import 'package:appbase/locals/dbTF.dart';
import 'package:appbase/locals/dbUser.dart';
import 'package:appbase/models/userDb.dart';
import 'package:appbase/pins.dart';
import 'package:appbase/services/netword.dart';
import 'package:flutter/material.dart';
import 'package:loading_gifs/loading_gifs.dart';

import 'locals/dbPin.dart';

class Login extends StatefulWidget {
  String lgs;
  Login({Key key, this.lgs}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class Param {
  String token;
  String name;
  String membership_no;
  Param(this.token, this.name, this.membership_no);
}

class _LoginState extends State<Login> {
  UserDb user = UserDb();
  final _formKey = GlobalKey<FormState>();

  DBUser dBUser;
  DBPin dBPin;
  DBTf dBTf;

  @override
  void initState() {
    dBUser = DBUser();
    dBPin = DBPin();
    dBTf = DBTf();

    super.initState();
  }

  @override
  void dispose() {
    dBUser.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    _initusers();
    return Scaffold(
      body: Stack(
        children: [
          // Container(
          //   child: ClipPath(
          //     clipper: DiagonalPathClipperTwo(),
          //     child: Container(
          //       height: 130,
          //       color: MyColor.color('colorheader'),
          //     ),
          //   ),
          // ),
          // Container(
          //   alignment: Alignment.topCenter,
          //   padding: const EdgeInsets.only(top: 30),
          //   child: Image.asset('assets/imgs/icon.png',
          //       width: tabletMode == true
          //           ? displayWidth(context) * 0.2
          //           : displayWidth(context) * 0.3,
          //       height: tabletMode == true
          //           ? displayWidth(context) * 0.2
          //           : displayWidth(context) * 0.3),
          // ),
          // Container(
          //   padding: EdgeInsets.only(top: displayHeight(context) * 0.21),
          //   alignment: Alignment.topCenter,
          //   child: Column(
          //     children: [
          //       Text(MyClass.company('th'),
          //           textScaleFactor:MyClass.fontSizeApp() ,style:  CustomTextStyle.dataHeadTitleTxt(context, 7)),
          //       Text(MyClass.company('en'),
          //           textScaleFactor:MyClass.fontSizeApp() ,style:  CustomTextStyle.dataHeadTitleTxt(context, -4)),
          //     ],
          //   ),
          // ),
          Container(
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/imgs/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: tabletMode == true
                          ? displayHeight(context) * 0.35
                          : displayHeight(context) * 0.29,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 30, right: 30, top: 100, bottom: 0),
                      child: MediaQuery(
                        data: MediaQuery.of(context).copyWith(
                          textScaleFactor: MyClass.fontSizeApp(),
                        ),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          style: CustomTextStyle.defaultTxt(context, 0),
                          // // keyboardType: TextInputType.numberWithOptions(decimal: true,signed: false),
                          // keyboardType: TextInputType.number,
                          // // keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                          decoration: InputDecoration(
                            labelText: Language.loginLg('member', widget.lgs),
                            labelStyle: TextStyle(
                                color: MyColor.color('TextFormFieldTextStyle')),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: MyColor.color('TextFormFieldBorderSide'),
                                width: 2.0,
                              ),
                            ),
                            border: OutlineInputBorder(),
                          ),
                          validator: _validatUser,
                          onSaved: (String value) {
                            user.user = MyClass.genmember(value);
                          },
                        ),
                      ),
                    ),
                    Text(
                      Language.loginLg('memberDetail', widget.lgs),
                      textScaleFactor: MyClass.fontSizeApp(),
                      style: CustomTextStyle.defaultTxt(context, -3),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, top: 20, bottom: 0),
                      child: MediaQuery(
                        data: MediaQuery.of(context).copyWith(
                          textScaleFactor: MyClass.fontSizeApp(),
                        ),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          style: CustomTextStyle.defaultTxt(context, 0),
                          decoration: InputDecoration(
                            labelText: Language.loginLg('password', widget.lgs),
                            labelStyle: TextStyle(
                                color: MyColor.color('TextFormFieldTextStyle')),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: MyColor.color('TextFormFieldBorderSide'),
                                width: 2.0,
                              ),
                            ),
                            border: OutlineInputBorder(),
                          ),
                          obscureText: true,
                          validator: _validatPassword,
                          onSaved: (String value) {
                            user.password = value;
                          },
                        ),
                      ),
                    ),
                    Text(
                      Language.loginLg('pleaseYourpassword', widget.lgs),
                      textScaleFactor: MyClass.fontSizeApp(),
                      style: CustomTextStyle.defaultTxt(context, -3),
                    ),
                    _buildsubmitButton(),
                    _buildRegitResetButton(),
                    SizedBox(
                      height: 150,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: displayHeight(context) * 0.30),
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(MyClass.company('th'),
                      textScaleFactor: MyClass.fontSizeApp(),
                      style: CustomTextStyle.dataHeadTitleTxt(context, 5)),
                  Text(MyClass.company('en'),
                      textScaleFactor: MyClass.fontSizeApp(),
                      style: CustomTextStyle.dataHeadTitleTxt(
                          context, tabletMode == true ? -12 : -3)),
                ],
              ),
            ),
          ),
          CustomUI.appbarBackgroundUi(context),
          // CustomUI.appbarTxtTitleUi('ข้อมูลส่วนตัว', context),
          CustomUI.appbarDetailUi1('assets/imgs/icon.png', context),
        ],
      ),
    );
  }

  Widget _buildRegitResetButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 32),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: FlatButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Checkregister(
                        title: Language.loginLg('memberRegis', widget.lgs),
                        lgs: widget.lgs),
                  ),
                );
              },
              child: Text(
                Language.loginLg('memberRegis', widget.lgs),
                textScaleFactor: MyClass.fontSizeApp(),
                style: CustomTextStyle.defaultTxt(context, 4),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(''),
          ),
          Expanded(
            flex: 2,
            child: FlatButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Checkregister(
                        title: Language.loginLg('forgotPassword', widget.lgs),
                        lgs: widget.lgs),
                  ),
                );
              },
              child: Text(
                Language.loginLg('forgotPassword', widget.lgs),
                textScaleFactor: MyClass.fontSizeApp(),
                style: CustomTextStyle.defaultTxt(context, 5),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildsubmitButton() {
    return Container(
      width: displayWidth(context) * 0.8,
      height: displayHeight(context) * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        gradient: LinearGradient(
          colors: <Color>[
            MyColor.color('buttongra'),
            MyColor.color('buttongra1'),
          ],
        ),
      ),
      padding: const EdgeInsets.only(right: 5),
      child: InkWell(
        onTap: _submit,
        child: Center(
          child: Text(
            Language.loginLg('logIn', widget.lgs),
            textScaleFactor: MyClass.fontSizeApp(),
            style: CustomTextStyle.buttonTxt(context, 5),
          ),
        ),
      ),
    );
  }

  void _submit() {
    print('submit press');
    if (this._formKey.currentState.validate()) {
      print('pass');
      _formKey.currentState.save();
      print(user.user);
      print(user.password);
      Network.fetchpinlogin('{"membership_no": "' +
              user.user +
              '","mem_password":"' +
              user.password +
              '"}')
          .then((value) => {
                _onLoadingParm(value),
              });
    } else {}
  }

  void _onLoadingParm(value) {
    // print(value);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Image.asset(cupertinoActivityIndicator, scale: 2);
      },
    );
    if (value != 'NoData') {
      new Future.delayed(new Duration(), () {
        // Navigator.pop(context);
        Navigator.of(context, rootNavigator: true).pop('dialog');
        _checklogin(value);
      });
    } else {
      new Future.delayed(new Duration(), () {
        // Navigator.pop(context);
        Navigator.of(context, rootNavigator: true).pop('dialog');
        MyClass.showToast(Language.loginLg('alertlogin', widget.lgs));
      });
    }
  }

  _checklogin(value) async {
    await dBPin.initDB();
    await dBPin.deleteAll();
    await dBPin.close();

    await dBTf.initDB();
    await dBTf.deleteAll();
    await dBTf.close();

    await dBUser.initDB();
    await dBUser.deleteAll();
    await dBUser.insertUsers(user).then(
      (value) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => Pins(
              gettitle: 'setPassword',
            ),
          ),
        );
      },
    );
    await dBUser.close();
  }

  // _checklogin(value) {
  //   dBPin.initDB().then((value) => {
  //         dBPin.deleteAll().then((value) => {
  //               dBTf.initDB().then((value) => {
  //                     dBTf.deleteAll().then((value) => {
  //                           dBUser.initDB().then((value) => {
  //                                 dBUser.deleteAll().then(
  //                                       (value) => {
  //                                         dBUser.insertUsers(user).then(
  //                                           (value) {
  //                                             Navigator.of(context)
  //                                                 .pushReplacement(
  //                                               MaterialPageRoute(
  //                                                 builder: (context) => Pins(
  //                                                   gettitle: 'ตั้งรหัสผ่าน',
  //                                                 ),
  //                                               ),
  //                                             );
  //                                           },
  //                                         ),
  //                                       },
  //                                     )
  //                               })
  //                         })
  //                   })
  //             }),
  //       });
  // }

  String _validatUser(String value) {
    if (value.isEmpty) {
      return Language.loginLg('memberDetail', widget.lgs);
    }
  }

  String _validatPassword(String value) {
    // if (value.length < 6) {
    //   return "Password not length >= 6";
    // }
    if (value.isEmpty) {
      return Language.loginLg('pleaseYourpassword', widget.lgs);
    }
  }

  _initusers() => FutureBuilder(
        future: dBUser.initDB(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {}
          return Center(
            child: snapshot.hasError
                ? Text(snapshot.error.toString())
                : CircularProgressIndicator(),
          );
        },
      );

  _json(s) {
    return jsonDecode(jsonEncode(s));
  }
}
