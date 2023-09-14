import 'package:appbase/class/customUI.dart';
import 'package:appbase/class/mycolor.dart';
import 'package:appbase/class/sizes.dart';
import 'package:appbase/class/textstyle.dart';
import 'package:flutter/material.dart';

class LanguageSettings extends StatefulWidget {
  @override
  _LanguageSettingsState createState() => _LanguageSettingsState();
}

class Lg {
  final String title;
  final String key;
  const Lg({this.title, this.key});
}

final List<Lg> lgs = const <Lg>[
  const Lg(title: "English", key: 'en'),
  const Lg(title: "ไทย", key: 'th'),
];

class _LanguageSettingsState extends State<LanguageSettings> {
  String _radioValue; //Initial definition of radio button value
  String choice;

  void _radioButtonChanges(String value) {
    setState(() {
      _radioValue = value;
      switch (value) {
        case 'en':
          choice = value;
          break;
        case 'th':
          choice = value;
          break;
        case 'three':
          choice = value;
          break;
        default:
          choice = null;
      }
      debugPrint(choice); //Debug the choice in console
    });
  }

    Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ออกจากแอปพลิเคชัน'),
            content: Text('คุณต้องการออกจากแอปพลิเคชัน ใช่ หรือ ไม่'),
            actions: <Widget>[
              FlatButton(
                child: Text('ไม่'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              FlatButton(
                child: Text('ใช่'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
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
            child: Column(
              children: [
                hSizedBox(context, 0),
                // _onBackPressed();
                // Expanded(
                //   child: Padding(
                //     padding: EdgeInsets.only(
                //         left: paddinglist(context, 0),
                //         right: paddinglist(context, 0)),
                //     child: _onBackPressed(),
                //   ),
                // ),
              ],
            ),
          ),
          CustomUI.appbarBackgroundUi(context),
          CustomUI.appbarUi(),
          CustomUI.appbarDetailUi('assets/imgs/icon.png', context),
        ],
      ),
    );
  }

  _detail11() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          int selectedRadio = 0;
          return AlertDialog(
            content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List<Widget>.generate(4, (int index) {
                    return Radio<int>(
                      value: index,
                      groupValue: selectedRadio,
                      onChanged: (int value) {
                        setState(() => selectedRadio = value);
                      },
                    );
                  }),
                );
              },
            ),
          );
        });
  }

  Widget _detail({List lg}) => ListView.separated(
        padding: EdgeInsets.only(top: 0),
        separatorBuilder: (context, index) => Divider(
          color: MyColor.color('linelist'),
        ),
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 5, left: 5),
            child: Column(
              children: [
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Radio(
                          value: 'en',
                          groupValue: _radioValue,
                          onChanged: _radioButtonChanges,
                        ),
                      ),
                      Expanded(
                        child: Text(""),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            lg[0].title,
                            textAlign: TextAlign.right,
                            style: CustomTextStyle.defaultTxt(context, 5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Radio(
                          value: 'th',
                          groupValue: _radioValue,
                          onChanged: _radioButtonChanges,
                        ),
                      ),
                      Expanded(
                        child: Text(""),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            lg[1].title,
                            textAlign: TextAlign.right,
                            style: CustomTextStyle.defaultTxt(context, 5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );

  InkWell _passwordsecurity(context, tabletMode) {
    return InkWell(
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
                          color: MyColor.color('colorheader'), width: 8))),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      'Password Security',
                      style: CustomTextStyle.settingTxt(context, 5),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.keyboard_arrow_right,
                          size: iconnext(context, 0),
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
}
