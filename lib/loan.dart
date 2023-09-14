import 'dart:convert';

import 'package:appbase/class/customUI.dart';
import 'package:appbase/class/language.dart';
import 'package:appbase/class/myclass.dart';
import 'package:appbase/class/mycolor.dart';
import 'package:appbase/class/sizes.dart';
import 'package:appbase/class/textstyle.dart';
import 'package:appbase/class/widget.dart';
import 'package:appbase/loan_detail.dart';
import 'package:appbase/models/loanJson.dart';
import 'package:appbase/services/netword.dart';
import 'package:flutter/material.dart';

double _fontsizeapps = 1.0;

class Loan extends StatefulWidget {
  final String token;
  final String name;
  final String membership_no;
  final String lgs;
  final double fontsizeapps;

  Loan(
      {Key key,
      this.token,
      this.membership_no,
      this.name,
      this.lgs,
      this.fontsizeapps})
      : super(key: key);

  @override
  _LoanState createState() => _LoanState();
}

class _LoanState extends State<Loan> {
  var ObjLoan = '{"mode": "1"}';

  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.fontsizeapps;
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomTextStyle.headcolor(context, 0),
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
                  padding: EdgeInsets.only(top: 8),
                  child: Center(
                    child: Text(Language.loanLg('loan', widget.lgs),
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.subTitleTxt(context, 10)),
                  ),
                ),

                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: _subdatahead(widget.membership_no, widget.name,
                        context, widget.lgs)),
                // lineSizedBox(context, 0),
                Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, bottom: 0),
                  child: _head(context, widget.lgs),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, bottom: 0),
                    child: FutureBuilder<List<LoanModel>>(
                      future: Network.fetchLoan(ObjLoan, widget.token, context),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return snapshot.data.length > 0
                              ? _detail(
                                  loan: snapshot.data,
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
          CustomUI.appbarDetailUi('assets/imgs/loan.png', context),
        ],
      ),
    );
  }

  Widget _detail({List loan, token, name, member, tabletMode}) =>
      ListView.separated(
        padding: EdgeInsets.only(top: 0),
        separatorBuilder: (context, index) => Divider(
          color: MyColor.color('linelist'),
        ),
        itemCount: loan.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Loan_detail(
                    pram: '[' + jsonEncode(loan[index]) + ']',
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
                          MyClass.checkNull(loan[index].loanContractNo),
                          textAlign: TextAlign.left,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.dataBoldTxt(context, 0),
                        ),
                        Text(
                          MyClass.checkNull(
                              Language.loanLg('contractStartDate', widget.lgs) +
                                  loan[index].beginingOfContract),
                          textAlign: TextAlign.left,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.dataTxt(context, 0),
                        ),
                        Text(
                          MyClass.checkNull(Language.loanLg(
                                  'paymentInInstallments', widget.lgs) +
                              MyClass.FormatNumber(
                                  loan[index].periodPaymentAmount)),
                          textAlign: TextAlign.left,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.dataTxt(context, 0),
                        ),
                        Text(
                          MyClass.checkNull(
                                  Language.loanLg('period', widget.lgs) +
                                      loan[index].lastPeriod.toString()) +
                              '/' +
                              MyClass.checkNull(
                                  loan[index].loanInstallmentAmount.toString()),
                          textAlign: TextAlign.left,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
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
                            loan[index].principalBalance.toString()),
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
                          child: Text(Language.loanLg('member', lgs),
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataHeadTitleTxt(
                                  context, 0)))),
                  Expanded(
                      child: Center(
                          child: Text(Language.loanLg('name', lgs),
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
            Language.loanLg('detail', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, 0),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            Language.loanLg('amount', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, 0),
          ),
        ),
      ],
    ),
  );
}
