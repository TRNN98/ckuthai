import 'package:appbase/class/customUI.dart';
import 'package:appbase/class/language.dart';
import 'package:appbase/class/myclass.dart';
import 'package:appbase/class/mycolor.dart';
import 'package:appbase/class/sizes.dart';
import 'package:appbase/class/textstyle.dart';
import 'package:appbase/class/widget.dart';
import 'package:appbase/models/depJson.dart';
import 'package:appbase/services/netword.dart';
import 'package:flutter/material.dart';
import 'package:loading_gifs/loading_gifs.dart';

double _fontsizeapps = 1.0;
class Deposit_movement extends StatefulWidget {
  final String token;
  final String name;
  final String membership_no;
  final String withdrawableAmount;
  final String depositAccountNo;
  final String lgs;
  final double fontsizeapps;
  Deposit_movement(
      {Key key,
      this.token,
      this.membership_no,
      this.name,
      this.withdrawableAmount,
      this.depositAccountNo,
      this.lgs,
      this.fontsizeapps})
      : super(key: key);
  @override
  _Deposit_movementState createState() => _Deposit_movementState();
}

class _Deposit_movementState extends State<Deposit_movement> {
  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.fontsizeapps;
    var ObjDepMovement =
        '{"mode": "2","deposit_account_no":"' + widget.depositAccountNo + '"}';

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
                SizedBox(
                  height: tabletMode == true
                      ? displayHeight(context) * 0.40
                      : displayHeight(context) * 0.35,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: paddinglist(context, 0),
                      right: paddinglist(context, 0)),
                  child: _head(context, widget.lgs),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: paddinglist(context, 0),
                        right: paddinglist(context, 0)),
                    child: FutureBuilder<List<DepositMovement>>(
                      future: Network.fetchDepMovement(
                          ObjDepMovement, widget.token, context),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return snapshot.data.length > 0
                              ? _detail(dep: snapshot.data)
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
          CustomUI.appbarTxtTitleUi(
              Language.deposit('accountMovements', widget.lgs),_fontsizeapps, context),
          CustomUI.appbarUi(),

          Padding(
            padding: EdgeInsets.only(
              right: displayWidth(context) * 0.04,
              left: displayWidth(context) * 0.04,
              top: displayHeight(context) * 0.15,
            ),
            child: _subdataHeadcolor(
                widget.membership_no,
                widget.name,
                widget.withdrawableAmount,
                widget.depositAccountNo,
                context,
                widget.lgs),
          ),
        ],
      ),
    );
  }

  Widget _detail({List dep}) => ListView.separated(
        padding: EdgeInsets.only(top: 0),
        separatorBuilder: (context, index) => Divider(
          color: MyColor.color('linelist'),
        ),
        itemCount: dep.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          MyClass.checkNull(dep[index].operateDate),
                          textAlign: TextAlign.left,
                          textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style:  CustomTextStyle.dataBoldTxt(context, 0),
                        ),
                        // Text("")
                        // Text(
                        //   MyClass.checkNull(dep[index].depositItemDescription),
                        //   textAlign: TextAlign.left,
                        //   textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style:  CustomTextStyle.dataTxt(context, 0),
                        // ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    dep[index].depositBalance,
                    textAlign: TextAlign.right,
                    textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style:  CustomTextStyle.defaultTxtColor(
                        context, 0, dep[index].signFlag == -1 ? 'R' : 'G'),
                  ),
                ),
              ],
            ),
          );
        },
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
          flex: 1,
          child: Text(
            Language.deposit('date', lgs),
            textAlign: TextAlign.center,
            textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style:  CustomTextStyle.headTitleTxt(context, 0),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            Language.deposit('amount', lgs),
            textAlign: TextAlign.center,
            textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style:  CustomTextStyle.headTitleTxt(context, 0),
          ),
        ),
      ],
    ),
  );
}

Center _subdataHeadcolor(
    member, name, withdrawableAmount, depositAccountNo, context, lgs) {
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
                      flex: 1,
                      child: Center(
                          child: Text(member,
                              textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style:  CustomTextStyle.dataHeadDataTxt(
                                  context, 0)))),
                  Expanded(
                      flex: 2,
                      child: Center(
                          child: Text(name,
                              textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style:  CustomTextStyle.dataHeadDataTxt(
                                  context, 0)))),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Center(
                          child: Text(Language.deposit('member', lgs),
                              textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style:  CustomTextStyle.dataHeadTitleTxt(
                                  context, 0)))),
                  Expanded(
                      flex: 2,
                      child: Center(
                          child: Text(Language.deposit('name', lgs),
                              textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style:  CustomTextStyle.dataHeadTitleTxt(
                                  context, 0)))),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          MyClass.FormatNumber(withdrawableAmount),
                          textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style:  CustomTextStyle.dataHeadDataTxt(context, 0),
                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: Center(
                          child: Text(depositAccountNo,
                              textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style:  CustomTextStyle.dataHeadDataTxt(
                                  context, 0)))),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Center(
                          child: Text(Language.deposit('balance', lgs),
                              textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style:  CustomTextStyle.dataHeadTitleTxt(
                                  context, 0)))),
                  Expanded(
                      flex: 2,
                      child: Center(
                          child: Text(Language.deposit('accountNumber', lgs),
                              textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style:  CustomTextStyle.dataHeadTitleTxt(
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
