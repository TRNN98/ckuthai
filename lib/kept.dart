import 'package:appbase/class/customUI.dart';
import 'package:appbase/class/language.dart';
import 'package:appbase/class/myclass.dart';
import 'package:appbase/class/mycolor.dart';
import 'package:appbase/class/sizes.dart';
import 'package:appbase/class/textstyle.dart';
import 'package:appbase/class/widget.dart';
import 'package:appbase/kept_detail.dart';
import 'package:appbase/models/keptJson.dart';
import 'package:appbase/services/netword.dart';
import 'package:flutter/material.dart';

double _fontsizeapps = 1.0;

class Kept extends StatefulWidget {
  final String token;
  final String name;
  final String membership_no;
  final String lgs;
  final double fontsizeapps;

  Kept(
      {Key key,
      this.token,
      this.membership_no,
      this.name,
      this.lgs,
      this.fontsizeapps})
      : super(key: key);

  @override
  _KeptState createState() => _KeptState();
}

class _KeptState extends State<Kept> {
  var ObjKept = '{"mode": "1"}';

  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.fontsizeapps;
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: MyColor.color('colorheader'),
      //   elevation: 0.0,
      //   flexibleSpace: Padding(
      //     padding: tabletMode == true
      //         ? EdgeInsets.only(top: headpadding(context, -40))
      //         : EdgeInsets.only(top: headpadding(context, 10)),
      //     child: Image.asset('assets/imgs/kept.png'),
      //   ),
      // ),
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
                    child: Text(Language.keptLg('kept', widget.lgs),
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
                    child: FutureBuilder<List<KeptModel>>(
                      future: Network.fetchKept(ObjKept, widget.token, context),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return snapshot.data.length > 0
                              ? _detail(
                                  kept: snapshot.data,
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
          CustomUI.appbarDetailUi('assets/imgs/kept.png', context),
        ],
      ),
    );
  }

  Widget _detail({List kept, token, name, member, tabletMode}) =>
      ListView.separated(
        padding: EdgeInsets.only(top: 0),
        separatorBuilder: (context, index) => Divider(
          color: MyColor.color('linelist'),
        ),
        itemCount: kept.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Kept_detail(
                    receiveYear: kept[index].receiveYear.toString(),
                    receiveMonth: kept[index].receiveMonth.toString(),
                    receiveMonthFp: kept[index].receiveMonthFp.toString(),
                    receiveYearFp: kept[index].receiveYearFp.toString(),
                    receiptNo: kept[index].receiptNo,
                    receiptDate: kept[index].receiptDate,
                    kepMethodAmount: kept[index].kepMethodAmount,
                    token: token,
                    name: name,
                    membership_no: member,
                    lgs: widget.lgs,
                    fontsizeapps: _fontsizeapps,
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
                          MyClass.checkNull(kept[index].receiveMonthFp) +
                              ' ' +
                              MyClass.checkNull(kept[index].receiveYearFp),
                          textAlign: TextAlign.left,
                          textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.dataBoldTxt(context, 0),
                        ),
                        Text(
                          MyClass.checkNull('วันที่ใบเสร็จรับเงิน ' +
                              kept[index].receiptDate),
                          textAlign: TextAlign.left,
                          textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.dataTxt(context, 0),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        MyClass.FormatNumber(
                            kept[index].kepMethodAmount.toString()),
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
                          child: Text(Language.keptLg('member', lgs),
                              textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataHeadTitleTxt(
                                  context, 0)))),
                  Expanded(
                      child: Center(
                          child: Text(Language.keptLg('name', lgs),
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
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Text(
            Language.keptLg('detail', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, 0),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            Language.keptLg('amount', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, 0),
          ),
        ),
      ],
    ),
  );
}
