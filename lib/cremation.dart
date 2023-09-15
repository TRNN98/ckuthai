import 'dart:io';

import 'package:appbase/class/customUI.dart';
import 'package:appbase/class/language.dart';
import 'package:appbase/class/myclass.dart';
import 'package:appbase/class/mycolor.dart';
import 'package:appbase/class/sizes.dart';
import 'package:appbase/class/textstyle.dart';
import 'package:appbase/class/widget.dart';
import 'package:appbase/models/cremationJson.dart';
import 'package:appbase/services/netword.dart';
import 'package:flutter/material.dart';

double _fontsizeapps = 1.0;

class Cremation extends StatefulWidget {
  final String token;
  final String name;
  final String membership_no;
  final String lgs;
  final double fontsizeapps;

  Cremation(
      {Key key,
      this.token,
      this.membership_no,
      this.name,
      this.lgs,
      this.fontsizeapps})
      : super(key: key);

  @override
  _CremationState createState() => _CremationState();
}

class _CremationState extends State<Cremation> {
  var objCremation = '{"mode": "1"}';
  var objCremation2 = '{"mode": "2"}';

  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.fontsizeapps;
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
                tabletMode == true
                    ? hSizedBox(context, 100)
                    : hSizedBox(context, 0),
                Container(
                  padding: EdgeInsets.only(top: headpadding(context, 0)),
                  child: Center(
                    child: Text(Language.cremationLg('cremation', widget.lgs),
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
                  child: FutureBuilder<List<CremationModel>>(
                    future: Network.fetchCremation(
                        objCremation2, widget.token, context),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return snapshot.data.length > 0
                            ? _detail(
                                cremation: snapshot.data,
                              )
                            : MyWidget.nodata(widget.lgs, context);
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return MyClass.loading();
                    },
                  ),
                ),
              ],
            ),
          ),
          CustomUI.appbarBackgroundUi(context),
          CustomUI.appbarUi(),
          CustomUI.appbarDetailUi('assets/imgs/cremation.png', context),
        ],
      ),
    );
  }

  Widget _detail({cremation}) => Container(
        child: ListView.separated(
          padding: EdgeInsets.only(top: 10),
          separatorBuilder: (context, index) => Divider(
            color: Colors.transparent,
            height: 0,
          ),
          itemCount: cremation.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(
                  left: paddinglist(context, 4),
                  right: paddinglist(context, 4)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          MyClass.checkNull(cremation[index].gainShort),
                          textAlign: TextAlign.left,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.dataBoldTxt(context, -2),
                        ),
                      ),
                      Expanded(
                          flex: 4,
                          child: Divider(
                            color: const Color.fromARGB(255, 98, 98, 98),
                            endIndent: 1,
                            height: 1,
                          )),
                    ],
                  ),
                  _gainNameTitle(cremation[index].gainType)
                ],
              ),
            );
          },
        ),
      );
  Widget _gainNameTitle(gaintype) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: FutureBuilder<List<CremationModel>>(
        future: Network.fetchCremation(
            '{"mode": "3","gain_type":"' + gaintype.toString() + '"}',
            widget.token,
            context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MyClass.loading();
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (!snapshot.hasData || snapshot.data.isEmpty) {
            return MyWidget.nodata(widget.lgs, context);
          }
          return ListView.builder(
            padding: EdgeInsets.all(0),
            shrinkWrap: true,
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return MyClass.checkNull(snapshot.data[index].gainCrem) == ''
                  ? ListTile(
                      title: Expanded(
                        flex: 4,
                        child: Text(
                          MyClass.checkNull(snapshot.data[index].memberGain),
                          textAlign: TextAlign.end,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.dataBoldTxt(context, -2),
                        ),
                      ),
                    )
                  : ExpansionTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            MyClass.checkNull(snapshot.data[index].memberGain),
                            textAlign: TextAlign.end,
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.dataBoldTxt(context, -2),
                          ),
                        ],
                      ),
                      children: <Widget>[
                        ListTile(
                          title: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "ผู้รับผลประโยชน์",
                                  textAlign: TextAlign.start,
                                  textScaleFactor:
                                      MyClass.blocFontSizeApp(_fontsizeapps),
                                  style:
                                      CustomTextStyle.defaultTxt(context, -4),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  MyClass.checkNull(
                                      snapshot.data[index].gainCrem),
                                  textAlign: TextAlign.end,
                                  textScaleFactor:
                                      MyClass.blocFontSizeApp(_fontsizeapps),
                                  style:
                                      CustomTextStyle.defaultTxt(context, -4),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
            },
          );
        },
      ),
    );
  }

  Widget _buildExpandableTile(cremation) {
    return ListTile(
      title: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.only(left: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        MyClass.checkNull(cremation.gainShort),
                        textAlign: TextAlign.left,
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.dataBoldTxt(context, -2),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      MyClass.checkNull(cremation.memberGain),
                      textAlign: TextAlign.left,
                      textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      style: CustomTextStyle.dataBoldTxt(context, -2),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
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
                          child: Text(Language.gainLg('member', lgs),
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataHeadTitleTxt(
                                  context, 0)))),
                  Expanded(
                      child: Center(
                          child: Text(Language.gainLg('name', lgs),
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
            Language.cremationLg('type', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, 0),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            Language.cremationLg('name', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, 0),
          ),
        ),
      ],
    ),
  );
}
