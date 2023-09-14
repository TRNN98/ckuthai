import 'dart:convert';
import 'package:appbase/class/customUI.dart';
import 'package:appbase/class/language.dart';
import 'package:appbase/class/myclass.dart';
import 'package:appbase/class/mycolor.dart';
import 'package:appbase/class/sizes.dart';
import 'package:appbase/class/textstyle.dart';
import 'package:appbase/class/widget.dart';
import 'package:appbase/models/depJson.dart';

import 'package:appbase/deposit_detail.dart';
import 'package:appbase/services/netword.dart';
import 'package:flutter/material.dart';
import 'package:loading_gifs/loading_gifs.dart';

double _fontsizeapps = 1.0;

class Deposit extends StatefulWidget {
  final String token;
  final String name;
  final String membership_no;
  final String lgs;
  final double fontsizeapps;

  Deposit(
      {Key key,
      this.token,
      this.membership_no,
      this.name,
      this.lgs,
      this.fontsizeapps})
      : super(key: key);

  @override
  _DepositState createState() => _DepositState();

  static fromJson(i) {}
}

class _DepositState extends State<Deposit> {
  var ObjDep = '{"mode": "1"}';

  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.fontsizeapps;
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/imgs/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: <Widget>[
                tabletMode == true
                    ? hSizedBox(context, 100)
                    : hSizedBox(context, 0),
                Container(
                  padding: EdgeInsets.only(top: headpadding(context, 0)),
                  child: Center(
                    child: Text(Language.deposit('deposit', widget.lgs),
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.subTitleTxt(context, 10)),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: _subdatahead(widget.membership_no, widget.name,
                        context, widget.lgs)),
                Padding(
                  padding: EdgeInsets.only(
                      left: paddinglist(context, 0),
                      right: paddinglist(context, 0)),
                  child: _head(context, widget.lgs),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: paddinglist(context, 0),
                        right: paddinglist(context, 0)),
                    child: FutureBuilder<List<Deposits>>(
                      future: Network.fetchDep(ObjDep, widget.token, context),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return snapshot.data.length > 0
                              ? _detail(
                                  dep: snapshot.data,
                                  token: widget.token,
                                  name: widget.name,
                                  member: widget.membership_no,
                                  tabletMode: tabletMode)
                              : MyWidget.nodata(widget.lgs, context);
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return MyClass.loading();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomUI.appbarBackgroundUi(context),
          CustomUI.appbarUi(),
          CustomUI.appbarDetailUi('assets/imgs/deposit.png', context),
        ],
      ),
    );
  }

  // Widget _header1() {
  //   return Column(
  //     children: <Widget>[
  //       Padding(
  //         padding: EdgeInsets.only(bottom: 10),
  //         child: Center(
  //           child: Text(
  //             'รายละเอียดทุนเรือนหุ้น',
  //             textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style:  TextStyle(fontSize: 20),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Widget _header({List<Subheader> headers}) => ListView.builder(
  //       shrinkWrap: true,
  //       physics: const NeverScrollableScrollPhysics(),
  //       itemCount: headers.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         return Padding(
  //           padding: EdgeInsets.only(left: 25),
  //           child: Row(
  //             children: <Widget>[
  //               Text(
  //                 headers[index].title,
  //                 textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style:  TextStyle(fontSize: 13),
  //               ),
  //               Text(
  //                 headers[index].data,
  //                 textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style:  TextStyle(fontSize: 13),
  //               ),
  //             ],
  //           ),
  //         );
  //       },
  //     );

  Widget _detail({List dep, token, name, member, tabletMode}) =>
      ListView.separated(
        padding: EdgeInsets.only(top: 0),
        separatorBuilder: (context, index) => Divider(
          color: MyColor.color('linelist'),
        ),
        itemCount: dep.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Deposit_detail(
                    pram: '[' + jsonEncode(dep[index]) + ']',
                    token: token,
                    name: name,
                    membership_no: member,
                    lgs: widget.lgs,
                    fontsizeapps: widget.fontsizeapps,
                  ),
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          MyClass.checkNull(
                            dep[index].depositAccountNo,
                          ),
                          textAlign: TextAlign.left,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.dataBoldTxt(context, 0),
                        ),
                        Text(
                          MyClass.checkNull(dep[index].depositName),
                          textAlign: TextAlign.left,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.dataTxt(context, 0),
                        ),
                        Text(
                          MyClass.checkNull(dep[index].depositAccountName),
                          textAlign: TextAlign.left,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.dataTxt(context, 0),
                        ),
                        Text(
                          MyClass.checkNull(dep[index].atmStatus),
                          textAlign: TextAlign.left,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.dataRTxt(context, 0),
                        ),
                      ],
                    ),
                  ),
                ),
                // dep[index].depositBalance)
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        MyClass.FormatNumber(
                            dep[index].depositBalance.toString()),
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.defaultTxt(context, 0),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        size: iconnext(context, 0),
                        color: MyColor.color('buttonnext'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
}

Center _subdatahead(member, name, context, lgs) {
  return Center(
    child: Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0)),
            // color: Colors.brown[100],
          ),
          padding: EdgeInsets.all(0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                      child: Center(
                          child: Text(member,
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataHeadDataTxt(
                                  context, 0)))),
                  Expanded(
                      child: Center(
                          child: Text(name,
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataHeadDataTxt(
                                  context, 0)))),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Center(
                          child: Text(Language.deposit('member', lgs),
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataHeadTitleTxt(
                                  context, 0)))),
                  Expanded(
                      child: Center(
                          child: Text(Language.deposit('name', lgs),
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataHeadTitleTxt(
                                  context, 0)))),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Container _head(context, lgs) {
  return Container(
    padding: EdgeInsets.all(12),
    color: MyColor.color('detailhead'),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Text(
            Language.deposit('detail', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, 0),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            Language.deposit('amount', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, 0),
          ),
        ),
      ],
    ),
  );
}
// class CustomShapeBorder extends ContinuousRectangleBorder {
//   @override
//   Path getOuterPath(Rect rect, {TextDirection textDirection}) {
//     final double innerCircleRadius = 3.0;
//     Path p = new Path();
//     p.lineTo(rect.width * innerCircleRadius, 0.0);
//     p.lineTo(
//         rect.width * innerCircleRadius, rect.height * innerCircleRadius / 8.75);
//     p.lineTo(0.0, rect.height * innerCircleRadius / 1.75);
//     p.close();
//     return p;
//   }
// }
