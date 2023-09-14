import 'package:appbase/class/customUI.dart';
import 'package:appbase/class/language.dart';
import 'package:appbase/class/myclass.dart';
import 'package:appbase/class/mycolor.dart';
import 'package:appbase/class/sizes.dart';
import 'package:appbase/class/textstyle.dart';
import 'package:appbase/locals/dbFontSize.dart';
import 'package:appbase/models/fontSizeDb.dart';
import 'package:appbase/pins.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

double _fontsizeapps = 1.0;

class FontSize extends StatefulWidget {
  String lgs;
  double fontsizeapps;

  FontSize({Key key, this.lgs, this.fontsizeapps}) : super(key: key);

  @override
  _FontSizeState createState() => _FontSizeState();
}

class _FontSizeState extends State<FontSize> {
  String _myActivity;
  String _myActivityResult;
  final formKey = new GlobalKey<FormState>();
  String _font = '';

  DBFs dBFs;
  FontSizeDb fs = FontSizeDb();

  @override
  void initState() {
    dBFs = DBFs();

    super.initState();
    _getfs();
    _myActivity = '';
    _myActivityResult = '';
  }

  @override
  void dispose() {
    dBFs.close();
    super.dispose();
  }

  _getfs() async {
    try {
      await dBFs.initDB();
      dBFs
          .getFs()
          .then(
            (value) => {
              _fontxt(MyClass.json(value)[0]['fs']),
            },
          )
          .catchError((e) {
        _fontxt('1.0'); // Future completes with 42.
      });
    } catch (err) {
      _fontxt('1.0');
    }
  }

  _fontxt(t) {
    setState(() {
      if (t == '0.85') {
        _font = Language.settingLg('small', widget.lgs);
      } else if (t == '1.0') {
        _font = Language.settingLg('normal', widget.lgs);
      } else if (t == '1.1') {
        _font = Language.settingLg('large', widget.lgs);
      } else {
        _font = Language.settingLg('normal', widget.lgs);
      }
    });
  }

  _saveForm() async {
    if (_myActivity.isEmpty) {
      MyClass.showToast(Language.settingLg('selectfont', widget.lgs));
    } else {
      await _insertfs(_myActivity);
      await Navigator.pushReplacement(
        context,
        new MaterialPageRoute(
            builder: (context) => new Pins(gettitle: 'pinCode')),
      );
    }

    // var form = formKey.currentState;
    // if (form.validate()) {
    //   form.save();
    //   print(_myActivity);
    // const pref_fontsize = 'fontsize';
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // await preferences.setDouble(pref_fontsize, double.parse(_myActivity));
    // await _insertfs(_myActivity);
    // await Navigator.pushReplacement(
    //   context,
    //   new MaterialPageRoute(
    //       builder: (context) => new Pins(gettitle: 'pinCode')),
    // );
    // setState(() {
    //   _myActivityResult = _myActivity;
    // });
    // }
  }

  _insertfs(f) async {
    fs.fs = f;
    await dBFs.initDB();
    await dBFs.deleteAll();
    await dBFs.insertFs(fs);
  }

  bool _enabled = true;
  var value;

  List<Map> _items = [];

  @override
  Widget build(BuildContext context) {
    _items = [
      {"value": '0.85', "text": Language.settingLg('small', widget.lgs)},
      {"value": '1.0', "text": Language.settingLg('normal', widget.lgs)},
      {"value": '1.1', "text": Language.settingLg('large', widget.lgs)}
    ];
    _fontsizeapps = widget.fontsizeapps;
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
            child: Container(
              padding: EdgeInsets.only(top: displayHeight(context) * 0.10),
              child: Center(
                child: Form(
                  key: formKey,
                  child: Container(
                    padding: EdgeInsets.all(displayHeight(context) * 0.05),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Text(
                            Language.settingLg('fontsize', widget.lgs),
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.dataBoldBTxt(context, 5),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: DropdownButton(
                            iconSize: displayWidth(context) * 0.05,
                            itemHeight: displayWidth(context) * 0.2,
                            hint: Text(
                              _font,
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataBoldBTxt(context, 5),
                            ),
                            disabledHint: value != null
                                ? Text(
                                    _items.firstWhere((item) =>
                                        item["value"] == value)["text"],
                                    textScaleFactor:
                                        MyClass.blocFontSizeApp(_fontsizeapps),
                                    style:
                                        CustomTextStyle.dataBoldBTxt(context, 5),
                                  )
                                : null,
                            items: _items
                                .map((item) => DropdownMenuItem(
                                      value: item["value"],
                                      child: Text(
                                        item["text"],
                                        textScaleFactor:
                                            MyClass.blocFontSizeApp(
                                                _fontsizeapps),
                                        style: CustomTextStyle.dataBoldBTxt(
                                            context, 5),
                                      ),
                                    ))
                                .toList(),
                            onChanged: _enabled
                                ? (v) => setState(() {
                                      print(v);
                                      _myActivity = v;
                                      value = v;
                                    })
                                : null,
                            value: value,
                          ),
                        )
                      ],
                    ),
                  ),
                  // child: Column(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: <Widget>[
                  //     Container(
                  //       // padding: EdgeInsets.all(33),
                  //       width: 700.0,
                  //       child: DropdownButton<String>(
                  //         hint: Text(
                  //           Language.settingLg('fontsize', widget.lgs),
                  //           textScaleFactor:
                  //               MyClass.blocFontSizeApp(_fontsizeapps),
                  //           // style: TextStyle(color: Colors.green),
                  //           style: CustomTextStyle.defaultTxt(context, 20),
                  //         ),
                  //         elevation: 10,
                  //         style: TextStyle(color: Colors.black),
                  //         // value: dropdownValue,
                  //         // icon: Icon(Icons.arrow_downward),
                  //         // iconSize: 55,
                  //         // elevation: 55,
                  //         // style: TextStyle(color: Colors.deepPurple),
                  //         // underline: Container(
                  //         //   height: 20,
                  //         //   width: 200,
                  //         //   color: Colors.deepPurpleAccent,
                  //         // ),
                  //         onChanged: (String newValue) {
                  //           setState(() {
                  //             // dropdownValue = newValue;
                  //           });
                  //         },
                  //
                  //         items: <String>['One', 'Two', 'Free']
                  //             .map<DropdownMenuItem<String>>((String value) {
                  //           return DropdownMenuItem<String>(
                  //             value: value,
                  //             child: Text(
                  //               value,
                  //               textScaleFactor:
                  //               MyClass.blocFontSizeApp(_fontsizeapps),
                  //               // style: TextStyle(color: Colors.green),
                  //               style: CustomTextStyle.defaultTxt(context, 20),
                  //             ),
                  //           );
                  //         }).toList(),
                  //       ),
                  //
                  //       // child: DropDownFormField(
                  //       //   titleText: Language.settingLg('fontsize', widget.lgs),
                  //       //   hintText: _font,
                  //       //   value: _myActivity,
                  //       //   onSaved: (value) {
                  //       //     setState(() {
                  //       //       _myActivity = value;
                  //       //     });
                  //       //   },
                  //       //   onChanged: (value) {
                  //       //     setState(() {
                  //       //       _myActivity = value;
                  //       //     });
                  //       //   },
                  //       //   dataSource: [
                  //       //     {
                  //       //       "display":
                  //       //           Language.settingLg('small', widget.lgs),
                  //       //       "value": "0.85",
                  //       //     },
                  //       //     {
                  //       //       "display":
                  //       //           Language.settingLg('normal', widget.lgs),
                  //       //       "value": "1.0",
                  //       //     },
                  //       //     {
                  //       //       "display":
                  //       //           Language.settingLg('large', widget.lgs),
                  //       //       "value": "1.1",
                  //       //     },
                  //       //   ],
                  //       //   textField: 'display',
                  //       //   valueField: 'value',
                  //       // ),
                  //     ),
                  //   ],
                  // ),
                ),
              ),
            ),
          ),
          CustomUI.appbarBackgroundUi(context),
          CustomUI.appbarUi(),
          CustomUI.appbarDetailUi1('assets/imgs/icon.png', context),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: MyColor.color('tabs'),
        child: Container(
          width: displayWidth(context) * 1,
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
              _saveForm();
            },
            child: Center(
              child: Text(
                Language.settingLg('save', widget.lgs),
                textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                style: CustomTextStyle.buttonTxt(context, 0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
