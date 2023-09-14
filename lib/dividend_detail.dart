import 'package:appbase/class/customUI.dart';
import 'package:appbase/class/language.dart';
import 'package:appbase/class/myclass.dart';
import 'package:appbase/class/mycolor.dart';
import 'package:appbase/class/sizes.dart';
import 'package:appbase/class/textstyle.dart';
import 'package:appbase/class/widget.dart';
import 'package:appbase/models/dividendJson.dart';
import 'package:appbase/services/netword.dart';
import 'package:flutter/material.dart';

double _fontsizeapps = 1.0;

class Dividend_detail extends StatefulWidget {
  final int year;
  final String token;
  final String name;
  final String membership_no;
  final String lgs;
  final double fontsizeapps;

  Dividend_detail(
      {Key key,
      this.year,
      this.token,
      this.membership_no,
      this.name,
      this.lgs,
      this.fontsizeapps})
      : super(key: key);

  @override
  _Dividend_detailState createState() => _Dividend_detailState();
}

class _Dividend_detailState extends State<Dividend_detail> {
  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.fontsizeapps;
    var ObjDividend =
        '{"mode": "2","account_year":"' + widget.year.toString() + '"}';

    bool tabletMode = MediaQuery.of(context).size.width > 600;
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
                SizedBox(
                  height: tabletMode == true
                      ? displayHeight(context) * 0.35
                      : displayHeight(context) * 0.30,
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
                    child: FutureBuilder<List<DividendDetailModel>>(
                      future: Network.fetchDividendDetail(
                          ObjDividend, widget.token, context),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return snapshot.data.length > 0
                              ? _detail(div: snapshot.data)
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
              Language.dividendLg('dividendAverageDetail', widget.lgs),_fontsizeapps, context),
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
                context,
                widget.lgs),
          ),
        ],
      ),
    );
  }

  Widget _detail({List div}) => ListView.separated(
    padding: EdgeInsets.only(top: 0),
    separatorBuilder: (context, index) => Divider(
      color: MyColor.color('linelist'),
    ),
    itemCount: div.length,
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
                      MyClass.checkNull(div[index].moneyTypeName),
                      textAlign: TextAlign.left,
                      textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style:  CustomTextStyle.dataBoldTxt(context, -3),
                    ),
                    // Text("")
                    Text(
                      "ธนาคาร: " + MyClass.checkNull(div[index].bankName),
                      textAlign: TextAlign.left,
                      textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style:  CustomTextStyle.dataTxt(context, 0),
                    ),
                    Text(
                      "เลขที่บัญชี: " + MyClass.checkNull(div[index].bankId),
                      textAlign: TextAlign.left,
                      textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style:  CustomTextStyle.dataTxt(context, 0),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
               MyClass.FormatNumber( div[index].itemAmount),
                textAlign: TextAlign.right,
                textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style:  CustomTextStyle.defaultTxt(
                  context, -3),
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
          flex: 3,
          child: Text(
            Language.dividendLg('detail', lgs),
            textAlign: TextAlign.center,
            textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style:  CustomTextStyle.headTitleTxt(context, 0),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            Language.dividendLg('amount', lgs),
            textAlign: TextAlign.center,
            textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style:  CustomTextStyle.headTitleTxt(context, 0),
          ),
        ),
      ],
    ),
  );
}



Center _subdataHeadcolor(
    member, name, context, lgs) {
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

            ],
          ),
        ),
      ],
    ),
  );
}
