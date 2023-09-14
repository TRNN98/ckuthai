import 'package:appbase/class/customUI.dart';
import 'package:appbase/class/language.dart';
import 'package:appbase/class/myclass.dart';
import 'package:appbase/class/mycolor.dart';
import 'package:appbase/class/sizes.dart';
import 'package:appbase/class/textstyle.dart';
import 'package:appbase/class/widget.dart';
import 'package:appbase/dividend_detail.dart';
import 'package:appbase/models/dividendJson.dart';
import 'package:flutter/material.dart';
import 'services/netword.dart';

double _fontsizeapps = 1.0;

class Dividend extends StatefulWidget {
  final String token;
  final String name;
  final String membership_no;
  final String lgs;
  final double fontsizeapps;

  Dividend(
      {Key key,
      this.token,
      this.membership_no,
      this.name,
      this.lgs,
      this.fontsizeapps})
      : super(key: key);

  @override
  _DividendState createState() => _DividendState();
}

class _DividendState extends State<Dividend> {
  var ObjDiv = '{"mode": "1"}';

  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.fontsizeapps;
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      body: Stack(
        children: [
          // CustomTextStyle.headcolor(context, 0),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/imgs/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                tabletMode == true
                    ? hSizedBox(context, 100)
                    : hSizedBox(context, 0),

                Container(
                  padding: EdgeInsets.only(top: headpadding(context, 0)),
                  child: Center(
                    child: Text(
                        Language.dividendLg(
                            'dividendAverageRefund', widget.lgs),
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.subTitleTxt(context, 10)),
                  ),
                ),
                // lineSizedBox(context, 0),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: _subdatahead(widget.membership_no, widget.name,
                        context, widget.lgs)),
                // lineSizedBox(context, -30),
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
                    child: FutureBuilder<List<DividendModel>>(
                      future:
                          Network.fetchDividend(ObjDiv, widget.token, context),
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
          CustomUI.appbarUi(),
          CustomUI.appbarDetailUi('assets/imgs/dividend.png', context),
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
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Dividend_detail(
                    year:div[index].year,
                    token: widget.token,
                    name: widget.name,
                    membership_no: widget.membership_no,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          MyClass.checkNull(div[index].accountYear),
                          textAlign: TextAlign.left,
                          textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.defaultTxt(context, -4),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        MyClass.FormatNumber(div[index].dividend.toString()),
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.defaultTxt(context, -4),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        MyClass.FormatNumber(
                            div[index].averageReturn.toString()),
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.defaultTxt(context, -4),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        MyClass.FormatNumber(div[index].totalSum.toString()),
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.defaultTxt(context, -4),
                      ),
                      // Icon(
                      //   Icons.keyboard_arrow_right,
                      //   size: iconnext(context, 0),
                      //   color: MyColor.color('buttonnext'),
                      // ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      // Text(
                      //   MyClass.FormatNumber(div[index].totalSum.toString()),
                      //   textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      //   style: CustomTextStyle.defaultTxt(context, -4),
                      // ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        size: iconnext(context, -10),
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
                              textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataHeadDataTxt(
                                  context, 0)))),
                  Expanded(
                      child: Center(
                          child: Text(name,
                              textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataHeadDataTxt(
                                  context, 0)))),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Center(
                          child: Text(Language.dividendLg('member', lgs),
                              textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataHeadTitleTxt(
                                  context, 0)))),
                  Expanded(
                      child: Center(
                          child: Text(Language.dividendLg('name', lgs),
                              textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
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
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Text(
            Language.dividendLg('fiscalYear', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, 0),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            Language.dividendLg('dividend', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, 0),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            Language.dividendLg('averageRefund', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, 0),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            Language.dividendLg('getMoney', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, 0),
          ),
        ),
      ],
    ),
  );
}
