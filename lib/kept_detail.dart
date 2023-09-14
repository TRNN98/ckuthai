import 'package:appbase/class/customUI.dart';
import 'package:appbase/class/language.dart';
import 'package:appbase/class/myclass.dart';
import 'package:appbase/class/mycolor.dart';
import 'package:appbase/class/sizes.dart';
import 'package:appbase/class/textstyle.dart';
import 'package:appbase/class/widget.dart';
import 'package:appbase/models/keptJson.dart';
import 'package:appbase/services/netword.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

double _fontsizeapps = 1.0;

class Kept_detail extends StatefulWidget {
  final String token;
  final String name;
  final String membership_no;
  final String kepMethodAmount;
  final String receiptDate;
  final String receiptNo;
  final String receiveYear;
  final String receiveYearFp;
  final String receiveMonthFp;
  final String receiveMonth;
  final String lgs;
  final double fontsizeapps;

  Kept_detail(
      {Key key,
      this.token,
      this.membership_no,
      this.name,
      this.kepMethodAmount,
      this.receiptDate,
      this.receiptNo,
      this.receiveYearFp,
      this.receiveMonthFp,
      this.receiveMonth,
      this.receiveYear,
      this.lgs,
      this.fontsizeapps});

  // receiveYearFp, receiveMonthFp, receiveMonth, receiveYear
  @override
  _Kept_detailState createState() => _Kept_detailState();
}

class _Kept_detailState extends State<Kept_detail> {
  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.fontsizeapps;
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    var ObjKeptDetail = '{"mode": "2","receive_year":"' +
        widget.receiveYear +
        '","receive_month":"' +
        widget.receiveMonth +
        '"}';

    return Scaffold(
      body: Stack(
        children: [
          // CustomTextStyle.headcolor(context, 0),
          // Padding(
          //   padding: EdgeInsets.all(displayWidth(context) * 0.04),
          //   child: _subdataHeadcolor(
          //       widget.membership_no,
          //       widget.name,
          //       widget.kepMethodAmount,
          //       widget.receiptDate,
          //       widget.receiptNo,
          //       widget.receiveYearFp,
          //       widget.receiveMonthFp,
          //       context),
          // ),
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
                    child: FutureBuilder<List<KeptDetailModel>>(
                      future: Network.fetchKeptDetail(
                          ObjKeptDetail, widget.token, context),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return snapshot.data.length > 0
                              ? _detail(kept: snapshot.data)
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
          CustomUI.appbarTxtTitleUi(
              Language.keptLg('kept', widget.lgs), _fontsizeapps, context),

          Padding(
            padding: EdgeInsets.only(
              right: displayWidth(context) * 0.07,
              left: displayWidth(context) * 0.07,
              top: displayHeight(context) * 0.13,
            ),
            child: _subdataHeadcolor(
                widget.membership_no,
                widget.name,
                widget.kepMethodAmount,
                widget.receiptDate,
                widget.receiptNo,
                widget.receiveYearFp,
                widget.receiveMonthFp,
                context,
                widget.lgs),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Container(
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
                  _launchURL("${MyClass.hostApp()}/api/member/print_pdf/" +
                      widget.receiveYear +
                      "/" +
                      widget.receiveMonth +
                      "?token=" +
                      widget.token);
                },
                child: Center(
                  child: Text(
                    Language.keptLg('printBilledMonthly', widget.lgs),
                    textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                    style: CustomTextStyle.buttonTxt(context, 0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detail({List kept}) => ListView.separated(
        padding: EdgeInsets.only(top: 0),
        separatorBuilder: (context, index) => Divider(
          color: MyColor.color('linelist'),
        ),
        itemCount: kept.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          MyClass.checkNull(kept[index].keepingTypeName),
                          textAlign: TextAlign.left,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.dataBoldTxt(context, -2),
                        ),
                        Text(
                          MyClass.checkNull(kept[index].receiveDescription),
                          textAlign: TextAlign.left,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.dataTxt(context, -2),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    MyClass.FormatNumber(kept[index].principalOfLoan),
                    textAlign: TextAlign.right,
                    textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                    style: CustomTextStyle.defaultTxt(context, -2),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    MyClass.FormatNumber(kept[index].interest),
                    textAlign: TextAlign.right,
                    textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                    style: CustomTextStyle.defaultTxt(context, -2),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    MyClass.FormatNumber(kept[index].moneyAmount),
                    textAlign: TextAlign.right,
                    textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                    style: CustomTextStyle.defaultTxt(context, -2),
                  ),
                ),
              ],
            ),
          );
        },
      );
}

Center _subdataHeadcolor(member, name, kepMethodAmount, receiptDate, receiptNo,
    receiveYearFp, receiveMonthFp, context, lgs) {
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
                                  context, -5)))),
                  Expanded(
                      child: Center(
                          child: Text(receiveMonthFp,
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataHeadDataTxt(
                                  context, -5)))),
                  Expanded(
                      child: Center(
                          child: Text(receiveYearFp,
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataHeadDataTxt(
                                  context, -5)))),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Center(
                          child: Text(Language.keptLg('member', lgs),
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataHeadTitleTxt(
                                  context, -5)))),
                  Expanded(
                      child: Center(
                          child: Text(Language.keptLg('month', lgs),
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataHeadTitleTxt(
                                  context, -5)))),
                  Expanded(
                      child: Center(
                          child: Text(Language.keptLg('year', lgs),
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataHeadTitleTxt(
                                  context, -5)))),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Center(
                          child: Text(receiptNo,
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataHeadDataTxt(
                                  context, -5)))),
                  Expanded(
                      child: Center(
                          child: Text(receiptDate,
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataHeadDataTxt(
                                  context, -5)))),
                  Expanded(
                      child: Center(
                          child: Text(MyClass.FormatNumber(kepMethodAmount),
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataHeadDataTxt(
                                  context, -5)))),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Center(
                          child: Text(Language.keptLg('receiptNumber', lgs),
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataHeadTitleTxt(
                                  context, -5)))),
                  Expanded(
                      child: Center(
                          child: Text(Language.keptLg('receiptDate', lgs),
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataHeadTitleTxt(
                                  context, -5)))),
                  Expanded(
                      child: Center(
                          child: Text(Language.keptLg('billedCharge', lgs),
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataHeadTitleTxt(
                                  context, -5)))),
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
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Text(
            Language.keptLg('detail', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, -4),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            Language.keptLg('principal', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, -4),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            Language.keptLg('interest', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, -4),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            Language.keptLg('amount', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, -4),
          ),
        ),
      ],
    ),
  );
}

Future<void> _launchURL(String url) async {
  // if (await canLaunch(url)) {
  await launch(
    url,
    forceSafariVC: false,
    forceWebView: false,
  );
  // } else {
  //   throw 'Could not launch $url';
  // }
}
