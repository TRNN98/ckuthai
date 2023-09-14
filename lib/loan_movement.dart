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
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:loading_gifs/loading_gifs.dart';

double _fontsizeapps = 1.0;

class Loan_movement extends StatefulWidget {
  final String token;
  final String name;
  final String membership_no;
  final String loanContractNo;
  final String principalBalance;
  final String lgs;
  final double fontsizeapps;

  Loan_movement(
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
  _Loan_movementState createState() => _Loan_movementState();
}

class _Loan_movementState extends State<Loan_movement> {
  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.fontsizeapps;
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    var ObjLoan = '{"mode": "2","contract_no":"' + widget.loanContractNo + '"}';
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
                    child: FutureBuilder<List<LoanMovementModel>>(
                      future: Network.fetchLoanMovement(
                          ObjLoan, widget.token, context),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return snapshot.data.length > 0
                              ? _detail(
                                  loanMovement: snapshot.data,
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
          CustomUI.appbarTxtTitleUi(
              Language.loanLg('showMovementlist', widget.lgs),_fontsizeapps, context),
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

  Widget _detail({List loanMovement}) => ListView.separated(
        padding: EdgeInsets.only(top: 0),
        separatorBuilder: (context, index) => Divider(
          color: MyColor.color('linelist'),
        ),
        itemCount: loanMovement.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => Loan_detail(
              //       pram: jsonEncode(loan),
              //       token: token,
              //       name: name,
              //       membership_no: member,
              //     ),
              //   ),
              // );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 5, left: 5),
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
                            MyClass.checkNull(
                                loanMovement[index].itemTypeDescription),
                            textAlign: TextAlign.left,
                            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.dataBoldTxt(context, -3),
                          ),
                          Text(
                            MyClass.checkNull(
                                loanMovement[index].loanPaymentDate),
                            textAlign: TextAlign.left,
                            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.dataTxt(context, 0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          MyClass.checkNull(loanMovement[index].period),
                          textAlign: TextAlign.left,
                          textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.defaultTxtColor(context, 0,
                              loanMovement[index].signStatus == 1 ? 'R' : 'G'),
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
                              loanMovement[index].paymentAmount),
                          textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.defaultTxtColor(context, 0,
                              loanMovement[index].signStatus == 1 ? 'R' : 'G'),
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
                              loanMovement[index].interestAmount),
                          textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.defaultTxtColor(context, 0,
                              loanMovement[index].signStatus == 1 ? 'R' : 'G'),
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
                          child: Text(Language.loanLg('member', lgs),
                              textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataHeadTitleTxt(
                                  context, 0)))),
                  Expanded(
                      child: Center(
                          child: Text(Language.loanLg('name', lgs),
                              textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
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
                              textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataHeadDataTxt(
                                  context, 0)))),
                  Expanded(
                      child: Center(
                          child: Text(MyClass.FormatNumber(principalBalance),
                              textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
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
                              textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataHeadTitleTxt(
                                  context, 0)))),
                  Expanded(
                      child: Center(
                          child: Text(Language.loanLg('balance', lgs),
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
          flex: 3,
          child: Text(
            Language.loanLg('date', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, 0),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            Language.loanLg('period1', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, 0),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            Language.loanLg('principal', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, 0),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            Language.loanLg('interest', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, 0),
          ),
        ),
      ],
    ),
  );
}
