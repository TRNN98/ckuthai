import 'package:appbase/checkRegister.dart';
import 'package:appbase/checkrg.dart';
import 'package:appbase/class/customUI.dart';
import 'package:appbase/class/myclass.dart';
import 'package:appbase/class/mycolor.dart';
import 'package:appbase/class/sizes.dart';
import 'package:appbase/class/textstyle.dart';
import 'package:appbase/class/widget.dart';
import 'package:flutter/material.dart';

class Notrg extends StatefulWidget {
  @override
  _NotrgState createState() => _NotrgState();
}

class _NotrgState extends State<Notrg> {
  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      body: Stack(
        children: [
          // Container(
          //   child: ClipPath(
          //     clipper: DiagonalPathClipperTwo(),
          //     child: Container(
          //       height: 170,
          //       color: MyColor.color('colorheader'),
          //     ),
          //   ),
          // ),
          // Container(
          //   alignment: Alignment.topCenter,
          //   padding: const EdgeInsets.only(top: 70),
          //   child: Column(
          //     children: [
          //       Image.asset('assets/imgs/regitconfirm.png', width: 120, height: 120),
          //     ],
          //   ),
          // ),
          Container(
            decoration: MyWidget.bgApp(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: tabletMode == true
                        ? displayHeight(context) * 0.25
                        : displayHeight(context) * 0.25,
                  ),
                  // Center(
                  //     child: Text(
                  //   'ยินดีต้อนรับเข้าสู่แอปพลิเคชัน',
                  //   textScaleFactor:MyClass.fontSizeApp() ,style:  CustomTextStyle.dataBoldTxt(context, 15),
                  // )),
                  lineSizedBox(context, 0),

                  Center(
                      child: Text(
                    'แอปพลิเคชัน',
                    textScaleFactor:MyClass.fontSizeApp() ,style:  CustomTextStyle.dataBoldBTxt(context, 2),
                  )),
                  Center(
                      child: Text(
                    MyClass.company('th'),
                    textScaleFactor:MyClass.fontSizeApp() ,style:  CustomTextStyle.dataBoldBTxt(context, 2),
                  )),
                  Center(
                      child: Text(
                    'ขอเชิญพบกับประสบการณ์การให้บริการ',
                    textScaleFactor:MyClass.fontSizeApp() ,style:  CustomTextStyle.dataBoldBTxt(context, 2),
                  )),
                  Center(
                      child: Text(
                    'ข้อมูลสมาชิกที่ครอบคลุมทุกการใช้งาน',
                    textScaleFactor:MyClass.fontSizeApp() ,style:  CustomTextStyle.dataBoldBTxt(context, 2),
                  )),
                  lineSizedBox(context, 0),
                  Center(
                      child: Text(
                    'กรุณาลงทะเบียนสมัครสมาชิก',
                    textScaleFactor:MyClass.fontSizeApp() ,style:  CustomTextStyle.dataBoldBTxt(context, 2),
                  )),
                  _onSubmit()
                ],
              ),
            ),
          ),
          CustomUI.appbarBackgroundUi(context),
          // CustomUI.appbarTxtTitleUi('ข้อมูลส่วนตัว', context),
          CustomUI.appbarDetailUi('assets/imgs/regitconfirm.png', context),
          // CustomUI.appbarDetailUi('assets/imgs/icon.png', context),
        ],
      ),
    );
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
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: RaisedButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              color: MyColor.color('button'),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Checkregister(title: 'สมัครสมาชิก'),
                  ),
                );
              },
              child: Text(
                '    ลงทะเบียน    ',
                textScaleFactor:MyClass.fontSizeApp() ,style:  CustomTextStyle.buttonTxt(context, 5),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: RaisedButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              color: Colors.red,
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Checkrg(),
                  ),
                );
              },
              child: Text(
                '      ยกเลิก      ',
                textScaleFactor:MyClass.fontSizeApp() ,style:  CustomTextStyle.buttonTxt(context, 5),
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
}
