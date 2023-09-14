import 'dart:convert';

import 'package:appbase/class/customUI.dart';
import 'package:appbase/class/language.dart';
import 'package:appbase/class/myclass.dart';
import 'package:appbase/class/mycolor.dart';
import 'package:appbase/class/sizes.dart';
import 'package:appbase/class/textstyle.dart';
import 'package:appbase/deposit_movement.dart';
import 'package:flutter/material.dart';

double _fontsizeapps = 1.0;

class Deposit_detail extends StatefulWidget {
  final String pram;
  final String token;
  final String name;
  final String membership_no;
  final String lgs;
  final double fontsizeapps;

  Deposit_detail(
      {Key key,
      this.pram,
      this.token,
      this.membership_no,
      this.name,
      this.lgs,
      this.fontsizeapps})
      : super(key: key);

  @override
  _Deposit_detailState createState() => _Deposit_detailState();
}

class _Deposit_detailState extends State<Deposit_detail> {
  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.fontsizeapps;
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      body: Stack(
        children: <Widget>[
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
                children: <Widget>[
                  hSizedBox(context, 0),
                  Container(
                    padding:
                        EdgeInsets.only(top: displayHeight(context) * 0.07),
                    child: Center(
                      child: Text(
                          Language.deposit('depositAccountDetails', widget.lgs),
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.subTitleTxt(context, 0)),
                    ),
                  ),
                  lineSizedBox(context, -10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                            alignment: Alignment.bottomRight,
                            child: Text(
                                Language.deposit('accountNumber', widget.lgs),
                                textScaleFactor:
                                    MyClass.blocFontSizeApp(_fontsizeapps),
                                style:
                                    CustomTextStyle.dataBoldTxt(context, 0))),
                        flex: 3,
                      ),
                      Expanded(
                        child: Center(child: Text(' : ')),
                        flex: 1,
                      ),
                      Expanded(
                        child: Text(
                            jsonDecode(widget.pram)[0]['depositAccountNo'],
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.defaultTxt(context, 0)),
                        flex: 3,
                      ),
                    ],
                  ),
                  // lineSizedBox(context, -30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                            alignment: Alignment.bottomRight,
                            child: Text(
                                Language.deposit('accountName', widget.lgs),
                                textScaleFactor:
                                    MyClass.blocFontSizeApp(_fontsizeapps),
                                style:
                                    CustomTextStyle.dataBoldTxt(context, 0))),
                        flex: 3,
                      ),
                      Expanded(child: Center(child: Text(' : ')), flex: 1),
                      Expanded(
                        child: Text(
                            jsonDecode(widget.pram)[0]['depositAccountName'],
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.defaultTxt(context, 0)),
                        flex: 3,
                      ),
                    ],
                  ),
                  // lineSizedBox(context, -30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                            alignment: Alignment.bottomRight,
                            child: Text(
                                Language.deposit('accountType', widget.lgs),
                                textScaleFactor:
                                    MyClass.blocFontSizeApp(_fontsizeapps),
                                style:
                                    CustomTextStyle.dataBoldTxt(context, 0))),
                        flex: 3,
                      ),
                      Expanded(child: Center(child: Text(' : ')), flex: 1),
                      Expanded(
                        child: Text(jsonDecode(widget.pram)[0]['depositName'],
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.defaultTxt(context, 0)),
                        flex: 3,
                      ),
                    ],
                  ),
                  // lineSizedBox(context, -30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                            alignment: Alignment.bottomRight,
                            child: Text(
                                Language.deposit(
                                    'accountOpeningDate', widget.lgs),
                                textScaleFactor:
                                    MyClass.blocFontSizeApp(_fontsizeapps),
                                style:
                                    CustomTextStyle.dataBoldTxt(context, 0))),
                        flex: 3,
                      ),
                      Expanded(child: Center(child: Text(' : ')), flex: 1),
                      Expanded(
                        child: Text(
                            jsonDecode(widget.pram)[0]['depositOpenedDate'],
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.defaultTxt(context, 0)),
                        flex: 3,
                      ),
                    ],
                  ),
                  // lineSizedBox(context, -30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                            alignment: Alignment.bottomRight,
                            child: Text(
                                Language.deposit('remainingAmount', widget.lgs),
                                textScaleFactor:
                                    MyClass.blocFontSizeApp(_fontsizeapps),
                                style:
                                    CustomTextStyle.dataBoldTxt(context, 0))),
                        flex: 3,
                      ),
                      Expanded(child: Center(child: Text(' : ')), flex: 1),
                      Expanded(
                        child: Text(
                            MyClass.FormatNumber(
                                jsonDecode(widget.pram)[0]['depositBalance']),
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.defaultTxt(context, 0)),
                        flex: 3,
                      ),
                    ],
                  ),
                  // lineSizedBox(context, -30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                            alignment: Alignment.bottomRight,
                            child: Text(
                                Language.deposit('amountWithdrawn', widget.lgs),
                                textScaleFactor:
                                    MyClass.blocFontSizeApp(_fontsizeapps),
                                style:
                                    CustomTextStyle.dataBoldTxt(context, 0))),
                        flex: 3,
                      ),
                      Expanded(child: Center(child: Text(' : ')), flex: 1),
                      Expanded(
                        child: Text(
                            MyClass.FormatNumber(jsonDecode(widget.pram)[0]
                                ['withdrawableAmount']),
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.defaultTxt(context, 0)),
                        flex: 3,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          CustomUI.appbarBackgroundUi(context),
          CustomUI.appbarUi(),
          CustomUI.appbarTxtTitleUi(
              Language.deposit('depositAccountDetails', widget.lgs),
              _fontsizeapps,
              context),
          Padding(
            padding: EdgeInsets.only(
              right: displayWidth(context) * 0.10,
              left: displayWidth(context) * 0.10,
              top: displayHeight(context) * 0.13,
            ),
            child:
                _subdataHeadcolor(widget.membership_no, widget.name, context),
          ),
        ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // persistentFooterButtons: <Widget>[
      //   RaisedButton(
      //     onPressed: () => {},
      //     child: Text(
      //       'ดูรายการเคลื่อนไหวบัญชีเงินฝาก',
      //     ),
      //   ),
      // ],
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Deposit_movement(
                    token: widget.token,
                    name: widget.name,
                    membership_no: widget.membership_no,
                    withdrawableAmount: jsonDecode(widget.pram)[0]
                        ['withdrawableAmount'],
                    depositAccountNo: jsonDecode(widget.pram)[0]
                        ['depositAccountNo'],
                    lgs: widget.lgs,
                    fontsizeapps: _fontsizeapps,
                  ),
                ),
              );
            },
            child: Center(
              child: Text(
                Language.deposit('accountMovements', widget.lgs),
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

Center _subdataHeadcolor(member, name, context) {
  return Center(
    child: Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0)),
            color: MyColor.color('datatitle'),
          ),
          padding: EdgeInsets.all(10),
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
                          child: Text("ทะเบียนสมาชิก",
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataHeadTitleTxt(
                                  context, 0)))),
                  Expanded(
                      child: Center(
                          child: Text("ชื่อ - สกุล",
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
