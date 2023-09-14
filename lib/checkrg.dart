import 'package:appbase/class/customUI.dart';
import 'package:appbase/class/myclass.dart';
import 'package:appbase/class/mycolor.dart';
import 'package:appbase/class/sizes.dart';
import 'package:appbase/class/textstyle.dart';
import 'package:appbase/class/widget.dart';
import 'package:appbase/login.dart';
import 'package:appbase/notrg.dart';
import 'package:flutter/material.dart';

class Checkrg extends StatefulWidget {
  @override
  _CheckrgState createState() => _CheckrgState();
}

class _CheckrgState extends State<Checkrg> {
  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      body: Stack(
        children: [
          // CustomTextStyle.headcolor(context, 100),

          // Container(
          //   alignment: Alignment.topCenter,
          //   padding: const EdgeInsets.only(top: 70),
          //   child: Column(
          //     children: [
          //       Image.asset('assets/imgs/icon.png', width: 120, height: 120),
          //     ],
          //   ),
          // ),
          Container(
            decoration: MyWidget.bgApp(),
            child: Column(
              children: [
                SizedBox(
                  height: tabletMode == true
                      ? displayHeight(context) * 0.30
                      : displayHeight(context) * 0.30,
                ),
                Column(
                  children: [
                    Center(
                        child: Text(
                      'ยินดีต้อนรับเข้าสู่แอปพลิเคชัน',
                      textScaleFactor:MyClass.fontSizeApp() ,style:  CustomTextStyle.dataBoldBTxt(context, 10),
                    )),
                    Center(
                        child: Text(
                      MyClass.company('th'),
                      textScaleFactor:MyClass.fontSizeApp() ,style:  CustomTextStyle.dataBoldBTxt(context, 10),
                    )),
                  ],
                ),
                lineSizedBox(context, 0),
                // Center(
                //     child: Text(
                //   'คุณเคยลงทะเบียนใช้งานระบบบริการสมาชิก',
                //   textScaleFactor:MyClass.fontSizeApp() ,style:  CustomTextStyle.defaultTxt(context, 3),
                // )),
                //  Center(
                //     child: Text(
                //   'แบบออนไลน์',
                //   textScaleFactor:MyClass.fontSizeApp() ,style:  CustomTextStyle.defaultTxt(context, 3),
                // )),
                // Center(
                //     child: Text(
                //   '(เว็บไซต์ หรือ โมบายแอปพลิเคชั่น)',
                //   textScaleFactor:MyClass.fontSizeApp() ,style:  CustomTextStyle.defaultTxt(context, 3),
                // )),
                Center(
                    child: Text(
                  'คุณเป็นสมาชิกสหกรณ์ ใช่หรือไม่ ?',
                  textScaleFactor:MyClass.fontSizeApp() ,style:  CustomTextStyle.dataBoldBTxt(context, 3),
                )),
                // lineSizedBox(context, 0),
                _onSubmit()
              ],
            ),
          ),
          CustomUI.appbarBackgroundUi(context),
          // CustomUI.appbarTxtTitleUi('ข้อมูลส่วนตัว', context),
          CustomUI.appbarDetailUi('assets/imgs/icon.png', context),
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
                    builder: (context) => Notrg(),
                  ),
                );
              },
              child: Center(
                child: Text(
                  'ไม่ใช่',
                  textScaleFactor:MyClass.fontSizeApp() ,style:  CustomTextStyle.buttonTxt(context, 5),
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
                    builder: (context) => Login(),
                  ),
                );
              },
              child: Center(
                child: Text(
                  '   ใช่   ',
                  textScaleFactor:MyClass.fontSizeApp() ,style:  CustomTextStyle.buttonTxt(context, 5),
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
}
