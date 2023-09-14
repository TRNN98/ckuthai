import 'package:appbase/checkRegister.dart';
import 'package:appbase/class/customUI.dart';
import 'package:appbase/class/language.dart';
import 'package:appbase/class/myclass.dart';
import 'package:appbase/class/mycolor.dart';
import 'package:appbase/class/sizes.dart';
import 'package:appbase/class/textstyle.dart';
import 'package:appbase/login.dart';
import 'package:appbase/services/netword.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:imagebutton/imagebutton.dart';
import 'package:intl/intl.dart';

String lgs1 = '';
String xxx = '';
final format = DateFormat("y-MMM-d");
TextEditingController txtUser;
TextEditingController txtDate;

class UserReFo {
  UserReFo() {
    this.user = '';
    this.idcard = '';
    this.date = '';
    this.password = '';
    this.conPassword = '';
  }

  String user;
  String idcard;
  String date;
  String password;
  String conPassword;
}

UserReFo userrefo = UserReFo();

class Seandfo extends StatefulWidget {
  String title;
  String sex;
  String member;
  String idcard;
  String brithDate;
  String lgs;
  Seandfo(
      {Key key,
      this.title,
      this.sex,
      this.member,
      this.idcard,
      this.brithDate,
      this.lgs})
      : super(key: key);
  @override
  _SeandfoState createState() => _SeandfoState();
}

class _SeandfoState extends State<Seandfo> {
  final _formKey = GlobalKey<FormState>();

  String digits(int value, int length) {
    return '$value'.padLeft(length, "0");
  }

  DateTime dateTime;
  Duration duration;
  // text = 'Your initial value';
  String imgprofile = '';
  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    lgs1 = widget.lgs;
    txtUser = TextEditingController()..text = widget.member;
    if (widget.sex == 'M') {
      imgprofile = 'assets/imgs/icon.png';
    } else {
      imgprofile = 'assets/imgs/icon.png';
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            // Container(
            //   child: ClipPath(
            //     clipper: DiagonalPathClipperTwo(),
            //     child: Container(
            //       height: displayHeight(context) * 0.20,
            //       color: MyColor.color('colorheader'),
            //     ),
            //   ),
            // ),
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(top: 33),
              child: Column(
                children: [
                  // Container(
                  //   alignment: Alignment.topCenter,
                  //   padding: const EdgeInsets.only(top: 10),
                  //   child: Image.asset(imgprofile,
                  //       width: tabletMode == true
                  //           ? displayWidth(context) * 0.1
                  //           : displayWidth(context) * 0.2,
                  //       height: tabletMode == true
                  //           ? displayWidth(context) * 0.1
                  //           : displayWidth(context) * 0.2),
                  // ),
                ],
              ),
            ),

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
                          ? displayHeight(context) * 0.25
                          : displayHeight(context) * 0.15,
                    ),
                    Container(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            _user(txtUser, context, widget.lgs),
                            Text(
                              Language.loginLg('memberDetail', widget.lgs),
                              textScaleFactor: MyClass.fontSizeApp(),
                              style: CustomTextStyle.defaultTxt(context, -3),
                            ),
                            _idCard(context, widget.lgs),
                            Text(
                              Language.loginLg('idCardDetail', widget.lgs),
                              textScaleFactor: MyClass.fontSizeApp(),
                              style: CustomTextStyle.defaultTxt(context, -3),
                            ),
                            _date(txtDate, context, widget.lgs),
                            dateImg(context),
                            Text(
                              Language.loginLg('birthDayDetail', widget.lgs),
                              textScaleFactor: MyClass.fontSizeApp(),
                              style: CustomTextStyle.defaultTxt(context, -3),
                            ),
                            lineSizedBox(context, 0),
                            _password(context, widget.lgs),
                            _confpassword(context, widget.lgs),
                            Text(
                              Language.loginLg('passwordDetail', widget.lgs),
                              textScaleFactor: MyClass.fontSizeApp(),
                              style: CustomTextStyle.defaultTxt(context, -3),
                            ),
                            _onLogin(widget.title, context),
                            lineSizedBox(context, 0),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CustomUI.appbarBackgroundUi(context),
            // CustomUI.appbarTxtTitleUi(Language.loginLg(widget.title, widget.lgs), context),
            CustomUI.appbarDetailUi1(imgprofile, context),
          ],
        ),
      ),
    );
  }

  Widget dateImg(context) {
    return ImageButton(
      children: <Widget>[],
      width: 44,
      height: 44,
      paddingTop: 5,
      pressedImage: Image.asset(
        "assets/imgs/date.png",
      ),
      unpressedImage: Image.asset("assets/imgs/date.png"),
      onTap: () async {
        DateTime newDateTime = await showRoundedDatePicker(
          context: context,
          // locale: Locale("th", "TH"),
          era: EraMode.BUDDHIST_YEAR,
          theme: ThemeData.dark(),
          firstDate: DateTime(DateTime.now().year - 100),
          lastDate: DateTime(DateTime.now().year + 1),
        );
        if (newDateTime != null) {
          setState(() {
            String date = '';
            date = newDateTime.day.toString() +
                '/' +
                newDateTime.month.toString() +
                '/' +
                (newDateTime.year + 543).toString();
            txtDate = TextEditingController()..text = date;
          });
        }
      },
    );
    // return ImageButton(
    //   children: <Widget>[],
    //   width: 44,
    //   height: 44,
    //   paddingTop: 5,
    //   pressedImage: Image.asset(
    //     "assets/imgs/date.png",
    //   ),
    //   unpressedImage: Image.asset("assets/imgs/date.png"),
    //   onTap: () async {
    //     await CupertinoRoundedDatePicker.show(
    //       context,
    //       locale: Locale('th', 'TH'),
    //       fontFamily: "Mali",
    //       textColor: Colors.white,
    //       era: EraMode.BUDDHIST_YEAR,
    //       background: MyColor.color("settings"),
    //       minimumYear: DateTime.now().year - 100,
    //       maximumYear: DateTime.now().year,
    //       borderRadius: 16,
    //       initialDatePickerMode: CupertinoDatePickerMode.date,
    //       onDateTimeChanged: (newDateTime) {
    //         if (newDateTime != null) {
    //           setState(() {
    //             String date = '';
    //             date = newDateTime.day.toString() +
    //                 '/' +
    //                 newDateTime.month.toString() +
    //                 '/' +
    //                 (newDateTime.year + 543).toString();
    //             txtDate = TextEditingController()..text = date;
    //           });
    //         }
    //       },
    //     );
    //   },
    // );
  }

  Widget _onLogin(title, context) {
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
                  Language.loginLg('save', widget.lgs),
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
            padding: const EdgeInsets.only(right: 5),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) =>
                        Checkregister(title: title, lgs: lgs1),
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

      if (widget.idcard != userrefo.idcard) {
        MyClass.showToast(Language.loginLg('invalidIDCard', widget.lgs));
      } else if (userrefo.password != userrefo.conPassword) {
        MyClass.showToast(Language.loginLg('invalidConPassword', widget.lgs));
      } else if (MyClass.formatDate(userrefo.date) != widget.brithDate) {
        MyClass.showToast(Language.loginLg('invalidBirthday', widget.lgs));
      } else {
        if (widget.title == Language.loginLg('memberRegis', widget.lgs)) {
          Network.fetchAuthRe('{"membership_no": "' +
                  userrefo.user +
                  '","password":"' +
                  userrefo.password +
                  '","id_card":"' +
                  userrefo.idcard +
                  '","member_name":"' +
                  ' ' +
                  '","member_surname":"' +
                  ' ' +
                  '","date_of_birth":"' +
                  MyClass.formatDateC(widget.brithDate) +
                  '"}')
              .then((value) => {
                    print(value),
                    _onLoginsRe(value, context, widget.lgs),
                  });
        } else {
          Network.fetchAuthFo('{"membership_no": "' +
                  userrefo.user +
                  '","password":"' +
                  userrefo.password +
                  '","id_card":"' +
                  userrefo.idcard +
                  '","member_name":"' +
                  ' ' +
                  '","member_surname":"' +
                  ' ' +
                  '","date_of_birth":"' +
                  MyClass.formatDateC(widget.brithDate) +
                  '"}')
              .then((value) => {
                    print(value),
                    _onLoginsFo(value, context, widget.lgs),
                  });
        }
      }
    }
  }
}

_onLoginsRe(value, context, lgs) {
  try {
    if (MyClass.json(value)[0]['rc_code'] == '1') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Login(lgs: lgs1),
        ),
      );
    } else {
      MyClass.showToast(Language.loginLg('registrationFailed', lgs));
    }
  } catch (e) {
    MyClass.showToast(Language.loginLg('registrationFailed', lgs));
  }
}

_onLoginsFo(value, context, lgs) {
  try {
    if (MyClass.json(value)[0]['rc_code'] == '1') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Login(lgs: lgs1),
        ),
      );
    } else {
      MyClass.showToast(Language.loginLg('passwordChangeUnsuccessful', lgs));
    }
  } catch (e) {
    MyClass.showToast(Language.loginLg('passwordChangeUnsuccessful', lgs));
  }
}

Padding _password(context, lgs) {
  return Padding(
    padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 0),
    child: MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaleFactor: MyClass.fontSizeApp(),
      ),
      child: TextFormField(
        textAlign: TextAlign.center,
        style: CustomTextStyle.defaultTxt(context, 0),
        decoration: InputDecoration(
          labelText: Language.loginLg('password', lgs),
          labelStyle: TextStyle(color: MyColor.color('TextFormFieldTextStyle')),
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
          userrefo.password = value;
        },
      ),
    ),
  );
}

String _validatPassword(String value) {
  if (value.isEmpty) {
    return Language.loginLg('pleaseYourpassword', lgs1);
  } else if (value.length <= 5) {
    return Language.loginLg('passwordDetail', lgs1);
  }
}

Padding _confpassword(context, lgs) {
  return Padding(
    padding: const EdgeInsets.only(left: 30, right: 30, top: 1, bottom: 0),
    child: MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaleFactor: MyClass.fontSizeApp(),
      ),
      child: TextFormField(
        textAlign: TextAlign.center,
        style: CustomTextStyle.defaultTxt(context, 0),
        decoration: InputDecoration(
          labelText: Language.loginLg('confirmPassword', lgs),
          labelStyle: TextStyle(color: MyColor.color('TextFormFieldTextStyle')),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: MyColor.color('TextFormFieldBorderSide'),
              width: 2.0,
            ),
          ),
          border: OutlineInputBorder(),
        ),
        obscureText: true,
        validator: _validatConPassword,
        onSaved: (String value) {
          userrefo.conPassword = value;
        },
      ),
    ),
  );
}

String _validatConPassword(String value) {
  if (value.isEmpty) {
    return Language.loginLg('pleaseConfirmPassword', lgs1);
  } else if (value.length <= 5) {
    return Language.loginLg('passwordDetail', lgs1);
  }
}

Padding _user(txtUser, context, lgs) {
  return Padding(
    padding: const EdgeInsets.only(left: 30, right: 30, top: 100, bottom: 0),
    child: MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaleFactor: MyClass.fontSizeApp(),
      ),
      child: TextFormField(
        controller: txtUser,
        enabled: false,
        textAlign: TextAlign.center,
        style: CustomTextStyle.defaultTxt(context, 0),
        decoration: InputDecoration(
          labelText: Language.loanLg('member', lgs),
          labelStyle: TextStyle(color: MyColor.color('TextFormFieldTextStyle')),
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
          userrefo.user = MyClass.genmember(value);
        },
      ),
    ),
  );
}

String _validatUser(String value) {
  if (value.isEmpty) {
    return Language.loginLg('memberDetail', lgs1);
  }
}

Padding _idCard(context, lgs) {
  return Padding(
    padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 0),
    child: MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaleFactor: MyClass.fontSizeApp(),
      ),
      child: TextFormField(
        textAlign: TextAlign.center,
        maxLength: 13,
        style: CustomTextStyle.defaultTxt(context, 0),
        // keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: Language.loginLg('idCard', lgs),
          labelStyle: TextStyle(color: MyColor.color('TextFormFieldTextStyle')),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: MyColor.color('TextFormFieldBorderSide'),
              width: 2.0,
            ),
          ),
          border: OutlineInputBorder(),
        ),
        validator: _validatIdCard,
        onSaved: (String value) {
          userrefo.idcard = value;
        },
      ),
    ),
  );
}

String _validatIdCard(String value) {
  if (value.isEmpty) {
  } else if (value.length <= 12) {
    return Language.loginLg('idCardDetail', lgs1);
  }
}

Padding _date(txtDate, context, lgs) {
  return Padding(
    padding: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 0),
    child: MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaleFactor: MyClass.fontSizeApp(),
      ),
      child: TextFormField(
        controller: txtDate,
        textAlign: TextAlign.center,
        style: CustomTextStyle.defaultTxt(context, 0),
        decoration: InputDecoration(
          labelText: Language.loginLg('birthday', lgs),
          labelStyle: TextStyle(color: MyColor.color('TextFormFieldTextStyle')),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: MyColor.color('TextFormFieldBorderSide'),
              width: 2.0,
            ),
          ),
          border: OutlineInputBorder(),
        ),
        validator: _validatDate,
        onSaved: (String value) {
          userrefo.date = value;
        },
      ),
    ),
  );
}

String _validatDate(String value) {
  if (value.isEmpty) {
    return Language.loginLg('birthDayDetail', lgs1);
  }
}
