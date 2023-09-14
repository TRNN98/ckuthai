import 'dart:io';

import 'package:appbase/class/customUI.dart';
import 'package:appbase/class/language.dart';
import 'package:appbase/class/myclass.dart';
import 'package:appbase/class/sizes.dart';
import 'package:appbase/class/textstyle.dart';
import 'package:appbase/login.dart';
import 'package:appbase/reandfo.dart';
import 'package:appbase/services/netword.dart';
import 'package:flutter/material.dart';

import 'class/mycolor.dart';

class Checkregister extends StatefulWidget {
  final String title;
  final String lgs;
  Checkregister({Key key, this.title, this.lgs});
  @override
  _CheckregisterState createState() => _CheckregisterState();
}

class _CheckregisterState extends State<Checkregister> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String user = '';

  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    title = widget.title;
    return Scaffold(
      body: Stack(
        children: [
          // Container(
          //   child: ClipPath(
          //     clipper: DiagonalPathClipperTwo(),
          //     child: Container(
          //       height: displayHeight(context) * 0.25,
          //       color: MyColor.color('colorheader'),
          //     ),
          //   ),
          // ),
          // Container(
          //   alignment: Alignment.topCenter,
          //   padding: const EdgeInsets.only(top: 60),
          //   child: Image.asset('assets/imgs/icon.png',
          //       width: tabletMode == true
          //           ? displayWidth(context) * 0.2
          //           : displayWidth(context) * 0.3,
          //       height: tabletMode == true
          //           ? displayWidth(context) * 0.2
          //           : displayWidth(context) * 0.3),
          // ),
          // Container(
          //   padding: EdgeInsets.only(top: displayHeight(context) * 0.26),
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: tabletMode == true
                        ? displayHeight(context) * 0.44
                        : displayHeight(context) * 0.44,
                  ),
                  Center(
                    child: Text(
                      title,
                      textScaleFactor: MyClass.fontSizeApp(),
                      style: CustomTextStyle.dataHeadTitleTxt(context, 8),
                    ),
                  ),
                  Container(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 30, right: 30, top: 20, bottom: 0),
                            child: MediaQuery(
                              data: MediaQuery.of(context).copyWith(
                                textScaleFactor: MyClass.fontSizeApp(),
                              ),
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                // keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText:
                                      Language.loginLg('member', widget.lgs),
                                  labelStyle:
                                      CustomTextStyle.defaultTxt(context, 0),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: MyColor.color(
                                          'TextFormFieldBorderSide'),
                                      width: 2.0,
                                    ),
                                  ),
                                  border: OutlineInputBorder(),
                                ),
                                validator: _validatUser,
                                onSaved: (String value) {
                                  user = MyClass.genmember(value);
                                },
                                // onChanged: (text) => {
                                // },
                              ),
                            ),
                          ),
                          lineSizedBox(context, 0),
                          Center(
                            child: Text(
                              Language.loginLg(
                                  'checkMemberRegistration', widget.lgs),
                              textScaleFactor: MyClass.fontSizeApp(),
                              style:
                                  CustomTextStyle.dataHeadTitleTxt(context, 0),
                            ),
                          ),
                          _onSubmit(),
                          // lineSizedBox(context, 0),
                          // SizedBox(
                          //   height: 150,
                          // ),
                        ],
                      ),
                    ),
                  ),
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
                      textScaleFactor: MyClass.fontSizeApp(),
                      style: CustomTextStyle.dataHeadTitleTxt(context, 5)),
                  Text(MyClass.company('en'),
                      textScaleFactor: MyClass.fontSizeApp(),
                      style: CustomTextStyle.dataHeadTitleTxt(
                          context, tabletMode == true ? -15 : -4)),
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

  String _validatUser(String value) {
    if (value.isEmpty) {
      return Language.loginLg('memberDetail', widget.lgs);
    }
  }

  Widget _onSubmit() {
    return Container(
      // width: MediaQuery.of(context).size.width,
      // margin: EdgeInsets.only(top: 32),
      child: Row(
        children: [
          Expanded(
            child: Text(''),
          ),
          Container(
            width: displayWidth(context) * 0.4,
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
                  Language.loginLg('checkInformation', widget.lgs),
                  textScaleFactor: MyClass.fontSizeApp(),
                  style: CustomTextStyle.buttonTxt(context, 5),
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(''),
          ),
          Container(
            width: displayWidth(context) * 0.4,
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
            padding: const EdgeInsets.only(left: 5),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Login(
                      lgs: widget.lgs,
                    ),
                  ),
                );
              },
              child: Center(
                child: Text(
                  Language.loginLg('cancel', widget.lgs),
                  textScaleFactor: MyClass.fontSizeApp(),
                  style: CustomTextStyle.buttonTxt(context, 5),
                ),
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

  void _submit() {
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save();

      if (title == Language.loginLg('forgotPassword', widget.lgs)) {
        var ObjAuth = '{"pass":"","mode": "1","membership_no":"' + user + '"}';
        Network.fetchAuth(ObjAuth).then((value) => {
              _oncheckfo(value),
            });
      } else {
        var ObjAuth = '{"pass":"","mode": "2","membership_no":"' + user + '"}';
        Network.fetchAuthReg(ObjAuth).then((value) => {
              _oncheckre(value),
            });
      }
    } else {}
  }

  _oncheckfo(value) {
    if (MyClass.json(value)[0]['rc_code'].toString() == "1") {
      print(MyClass.json(value));
      print(MyClass.json(value)[0]['date_of_birth'].toString());
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Seandfo(
              title: title,
              sex: MyClass.json(value)[0]['sex'].toString(),
              member: user,
              idcard: MyClass.json(value)[0]['id_card'].toString(),
              brithDate: MyClass.json(value)[0]['date_of_birth'].toString(),
              lgs: widget.lgs),
        ),
      );
    } else {
      MyClass.showToast(MyClass.json(value)[0]['rc_desc'].toString());
    }
  }

  _oncheckre(value) {
    if (MyClass.json(value)[0]['rc_code'].toString() == "1") {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Seandfo(
              title: title,
              sex: MyClass.json(value)[0]['sex'].toString(),
              member: user,
              idcard: MyClass.json(value)[0]['id_card'].toString(),
              brithDate: MyClass.json(value)[0]['date_of_birth'].toString(),
              lgs: widget.lgs),
        ),
      );
    } else {
      MyClass.showToast(MyClass.json(value)[0]['rc_desc'].toString());
    }
  }
}
