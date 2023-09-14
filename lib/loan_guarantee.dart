import 'package:appbase/class/customUI.dart';
import 'package:appbase/class/language.dart';
import 'package:appbase/class/myclass.dart';
import 'package:appbase/class/mycolor.dart';
import 'package:appbase/class/sizes.dart';
import 'package:appbase/class/textstyle.dart';
import 'package:appbase/class/widget.dart';
import 'package:appbase/models/loanJson.dart';
import 'package:appbase/services/netword.dart';
import 'package:flutter/material.dart';

double _fontsizeapps = 1.0;

class Loan_guarantee extends StatefulWidget {
  final String token;
  final String name;
  final String membership_no;
  final String loanContractNo;
  final String principalBalance;
  final String lgs;
  final double fontsizeapps;

  Loan_guarantee(
      {Key key,
      this.token,
      this.membership_no,
      this.name,
      this.loanContractNo,
      this.principalBalance,
      this.lgs,
      this.fontsizeapps})
      : super(key: key);

  @override
  _Loan_guaranteeState createState() => _Loan_guaranteeState();
}

class _Loan_guaranteeState extends State<Loan_guarantee> {
  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.fontsizeapps;
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    var ObjLoan = '{"mode": "3","contract_no":"' + widget.loanContractNo + '"}';
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(displayWidth(context) * 0.20),
      //   child: AppBar(
      //     backgroundColor: MyColor.color('colorheader'),
      //     elevation: 0.0,
      //     flexibleSpace: Padding(
      //       padding: EdgeInsets.only(top: headpadding(context, -20)),
      //       child: Center(
      //           child: Text(
      //         "หลักประกันสัญญาเงินกู้",
      //         textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style:  CustomTextStyle.titleTxt(context, 0),
      //       )),
      //     ),
      //   ),
      // ),
      body: Stack(
        children: [
          // CustomTextStyle.headcolor(context, 0),
          // Padding(
          //   padding: EdgeInsets.all(displayWidth(context) * 0.04),
          //   child: _subdataHeadcolor(widget.membership_no, widget.name,
          //       widget.loanContractNo, widget.principalBalance, context),
          // ),
          Container(
            height: double.infinity,
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
                      : displayHeight(context) * 0.35,
                ),
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
                    child: FutureBuilder<List<LoanGuaranteeModel>>(
                      future: Network.fetchLoanGuarantee(
                          ObjLoan, widget.token, context),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return snapshot.data.length > 0
                              ? _detail(
                                  loanGuarantee: snapshot.data,
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
          CustomUI.appbarTxtTitleUi(
              Language.loanLg('collateralForLoanAgreement', widget.lgs),
              _fontsizeapps,
              context),

          Padding(
            padding: EdgeInsets.only(
              right: displayWidth(context) * 0.04,
              left: displayWidth(context) * 0.04,
              top: displayHeight(context) * 0.15,
            ),
            child: _subdataHeadcolor(
                widget.membership_no,
                widget.name,
                widget.loanContractNo,
                widget.principalBalance,
                context,
                widget.lgs),
          ),
        ],
      ),
    );
  }

  Widget _detail({List loanGuarantee, tabletMode}) => ListView.separated(
        padding: EdgeInsets.only(top: 0),
        separatorBuilder: (context, index) => Divider(
          color: MyColor.color('linelist'),
        ),
        itemCount: loanGuarantee.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {},
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
                          MyClass.checkNull(loanGuarantee[index].refOwnName),
                          textAlign: TextAlign.left,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.dataBoldTxt(context, -1),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        MyClass.FormatNumber(loanGuarantee[index].usedAmount),
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.dataBoldTxt(context, 0),
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

Center _subdataHeadcolor(
    member, name, loanContractNo, principalBalance, context, lgs) {
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
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Center(
                          child: Text(loanContractNo,
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataHeadDataTxt(
                                  context, 0)))),
                  Expanded(
                      child: Center(
                          child: Text(MyClass.FormatNumber(principalBalance),
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
                          child: Text(
                              Language.loanLg('loanContractNumber', lgs),
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataHeadTitleTxt(
                                  context, 0)))),
                  Expanded(
                      child: Center(
                          child: Text(Language.loanLg('balance', lgs),
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
          flex: 1,
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
            Language.loanLg('guaranteeAmount', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, 0),
          ),
        ),
      ],
    ),
  );
}
