import 'package:appbase/class/customUI.dart';
import 'package:appbase/class/language.dart';
import 'package:appbase/class/myclass.dart';
import 'package:appbase/class/mycolor.dart';
import 'package:appbase/class/sizes.dart';
import 'package:appbase/class/textstyle.dart';
import 'package:appbase/class/widget.dart';
import 'package:appbase/models/guaranteeJson.dart';
import 'package:appbase/services/netword.dart';
import 'package:flutter/material.dart';

double _fontsizeapps = 1.0;

class Guarantee extends StatefulWidget {
  final String token;
  final String name;
  final String membership_no;
  final String lgs;
  final double fontsizeapps;

  Guarantee(
      {Key key,
      this.token,
      this.membership_no,
      this.name,
      this.lgs,
      this.fontsizeapps})
      : super(key: key);

  @override
  _GuaranteeState createState() => _GuaranteeState();
}

class _GuaranteeState extends State<Guarantee> {
  var ObjGuarantee = '{}';

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
                    child: Text(
                        Language.guaranteeLg(
                            'guaranteeObligations', widget.lgs),
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
                    child: FutureBuilder<List<GuaranteeModel>>(
                      future: Network.fetchGuarantee(
                          ObjGuarantee, widget.token, context),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return snapshot.data.length > 0
                              ? _detail(
                                  guarantee: snapshot.data,
                                )
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
          CustomUI.appbarDetailUi('assets/imgs/guarantee.png', context),
        ],
      ),
    );
  }

  Widget _detail({List guarantee}) => ListView.separated(
        padding: EdgeInsets.only(top: 0),
        separatorBuilder: (context, index) => Divider(
          color: MyColor.color('linelist'),
        ),
        itemCount: guarantee.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(right: 5, left: 5),
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
                            MyClass.checkNull(guarantee[index].loanContractNo),
                            textAlign: TextAlign.left,
                            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.dataBoldTxt(context, 0),
                          ),
                          Text(
                            MyClass.checkNull(guarantee[index].loanName),
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
                              guarantee[index].principalBalance),
                          textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.defaultTxt(context, 0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
                          child: Text(Language.guaranteeLg('member', lgs),
                              textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataHeadTitleTxt(
                                  context, 0)))),
                  Expanded(
                      child: Center(
                          child: Text(Language.guaranteeLg('name', lgs),
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
            Language.guaranteeLg('guarantees', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, 0),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            Language.guaranteeLg('debt', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, 0),
          ),
        ),
      ],
    ),
  );
}
