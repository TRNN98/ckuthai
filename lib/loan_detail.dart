import 'dart:convert';

import 'package:appbase/class/customUI.dart';
import 'package:appbase/class/language.dart';
import 'package:appbase/class/myclass.dart';
import 'package:appbase/class/mycolor.dart';
import 'package:appbase/class/sizes.dart';
import 'package:appbase/class/textstyle.dart';
import 'package:appbase/loan_guarantee.dart';
import 'package:flutter/material.dart';

import 'loan_movement.dart';

double _fontsizeapps = 1.0;

class Loan_detail extends StatefulWidget {
  final String pram;
  final String token;
  final String name;
  final String membership_no;
  final String lgs;
  final double fontsizeapps;

  Loan_detail(
      {Key key,
      this.pram,
      this.token,
      this.membership_no,
      this.name,
      this.lgs,
      this.fontsizeapps})
      : super(key: key);

  @override
  _Loan_detailState createState() => _Loan_detailState();
}

class _Loan_detailState extends State<Loan_detail> {
  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.fontsizeapps;
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      body: Stack(
        children: [
          // CustomTextStyle.headcolor(context, 0),

          Container(
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/imgs/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  hSizedBox(context, 0),
                  Container(
                    padding:
                        EdgeInsets.only(top: displayHeight(context) * 0.07),
                    child: Center(
                      child: Text(
                          Language.loanLg(
                              'loanContractInformation', widget.lgs),
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.subTitleTxt(context, 0)),
                    ),
                  ),
                  lineSizedBox(context, 0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                            alignment: Alignment.bottomRight,
                            child: Text(
                                Language.loanLg(
                                    'loanContractNumber', widget.lgs),
                                textScaleFactor:
                                    MyClass.blocFontSizeApp(_fontsizeapps),
                                style:
                                    CustomTextStyle.dataBoldTxt(context, 0))),
                        flex: 3,
                      ),
                      Expanded(child: Center(child: Text(' : ')), flex: 1),
                      Expanded(
                        child: Text(
                            MyClass.checkNull(
                                jsonDecode(widget.pram)[0]['loan_contract_no']),
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.defaultTxt(context, 0)),
                        flex: 3,
                      ),
                    ],
                  ),
                  // lineSizedBox(context, -30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                            alignment: Alignment.bottomRight,
                            child: Text(
                                Language.loanLg(
                                    'contractStartDate', widget.lgs),
                                textScaleFactor:
                                    MyClass.blocFontSizeApp(_fontsizeapps),
                                style:
                                    CustomTextStyle.dataBoldTxt(context, 0))),
                        flex: 3,
                      ),
                      Expanded(child: Center(child: Text(' : ')), flex: 1),
                      Expanded(
                        child: Text(
                            MyClass.checkNull(jsonDecode(widget.pram)[0]
                                ['begining_of_contract']),
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.defaultTxt(context, 0)),
                        flex: 3,
                      ),
                    ],
                  ),
                  // lineSizedBox(context, -30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                            alignment: Alignment.bottomRight,
                            child: Text(
                                Language.loanLg('approvalLimit', widget.lgs),
                                textScaleFactor:
                                    MyClass.blocFontSizeApp(_fontsizeapps),
                                style:
                                    CustomTextStyle.dataBoldTxt(context, 0))),
                        flex: 3,
                      ),
                      Expanded(child: Center(child: Text(' : ')), flex: 1),
                      Expanded(
                        child: Text(
                            MyClass.FormatNumber(jsonDecode(widget.pram)[0]
                                ['loan_approve_amount']),
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.defaultTxt(context, 0)),
                        flex: 3,
                      ),
                    ],
                  ),
                  // lineSizedBox(context, -30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                            alignment: Alignment.bottomRight,
                            child: Text(
                                Language.loanLg('periodAll', widget.lgs),
                                textScaleFactor:
                                    MyClass.blocFontSizeApp(_fontsizeapps),
                                style:
                                    CustomTextStyle.dataBoldTxt(context, 0))),
                        flex: 3,
                      ),
                      Expanded(child: Center(child: Text(' : ')), flex: 1),
                      Expanded(
                        child: Text(
                            MyClass.checkNull(jsonDecode(widget.pram)[0]
                                ['loan_installment_amount']),
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.defaultTxt(context, 0)),
                        flex: 3,
                      ),
                    ],
                  ),
                  // lineSizedBox(context, -30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                            alignment: Alignment.bottomRight,
                            child: Text(Language.loanLg('payment', widget.lgs),
                                textScaleFactor:
                                    MyClass.blocFontSizeApp(_fontsizeapps),
                                style:
                                    CustomTextStyle.dataBoldTxt(context, 0))),
                        flex: 3,
                      ),
                      Expanded(child: Center(child: Text(' : ')), flex: 1),
                      Expanded(
                        child: Text(
                            MyClass.checkNull(jsonDecode(widget.pram)[0]
                                ['loan_payment_type_code']),
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.defaultTxt(context, 0)),
                        flex: 3,
                      ),
                    ],
                  ),
                  // lineSizedBox(context, -30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                            alignment: Alignment.bottomRight,
                            child: Text(
                                Language.loanLg(
                                    'paymentInInstallments', widget.lgs),
                                textScaleFactor:
                                    MyClass.blocFontSizeApp(_fontsizeapps),
                                style:
                                    CustomTextStyle.dataBoldTxt(context, -2))),
                        flex: 3,
                      ),
                      Expanded(child: Center(child: Text(' : ')), flex: 1),
                      Expanded(
                        child: Text(
                            MyClass.FormatNumber(jsonDecode(widget.pram)[0]
                                ['period_payment_amount']),
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.defaultTxt(context, 0)),
                        flex: 3,
                      ),
                    ],
                  ),
                  // lineSizedBox(context, -30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                            alignment: Alignment.bottomRight,
                            child: Text(Language.loanLg('balance', widget.lgs),
                                textScaleFactor:
                                    MyClass.blocFontSizeApp(_fontsizeapps),
                                style:
                                    CustomTextStyle.dataBoldTxt(context, 0))),
                        flex: 3,
                      ),
                      Expanded(child: Center(child: Text(' : ')), flex: 1),
                      Expanded(
                        child: Text(
                            MyClass.FormatNumber(jsonDecode(widget.pram)[0]
                                ['principal_balance']),
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.defaultTxt(context, 0)),
                        flex: 3,
                      ),
                    ],
                  ),
                  // lineSizedBox(context, -30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                            alignment: Alignment.bottomRight,
                            child: Text(Language.loanLg('period', widget.lgs),
                                textScaleFactor:
                                    MyClass.blocFontSizeApp(_fontsizeapps),
                                style:
                                    CustomTextStyle.dataBoldTxt(context, 0))),
                        flex: 3,
                      ),
                      Expanded(child: Center(child: Text(' : ')), flex: 1),
                      Expanded(
                        child: Text(
                            MyClass.checkNull(
                                jsonDecode(widget.pram)[0]['last_period']),
                            textScaleFactor:
                                MyClass.blocFontSizeApp(_fontsizeapps),
                            style: CustomTextStyle.defaultTxt(context, 0)),
                        flex: 3,
                      ),
                    ],
                  ),
                  // lineSizedBox(context, -30),
                ],
              ),
            ),
          ),
          CustomUI.appbarBackgroundUi(context),
          CustomUI.appbarUi(),
          CustomUI.appbarTxtTitleUi(
              Language.loanLg('listOfLoanAgreements', widget.lgs), _fontsizeapps,context),

          Padding(
            padding: EdgeInsets.only(
              right: displayWidth(context) * 0.10,
              left: displayWidth(context) * 0.10,
              top: displayHeight(context) * 0.13,
            ),
            child: _subdataHeadcolor(
                widget.membership_no, widget.name, context, widget.lgs),
          ),

          // CustomUI.appbarDetailUi('assets/imgs/loan.png',context),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: MyColor.color('tabs'),
        child: Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          height: displayWidth(context) * 0.10,
          child: Row(
            children: [
              Expanded(
                child: Text(''),
              ),
              Container(
                width: displayWidth(context) * 0.4,
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Loan_guarantee(
                          token: widget.token,
                          name: widget.name,
                          membership_no: widget.membership_no,
                          loanContractNo: jsonDecode(widget.pram)[0]
                              ['loan_contract_no'],
                          principalBalance: jsonDecode(widget.pram)[0]
                              ['principal_balance'],
                          lgs: widget.lgs,
                          fontsizeapps: _fontsizeapps,
                        ),
                      ),
                    );
                  },
                  child: Center(
                    child: Text(
                      Language.loanLg('showGuarantees', widget.lgs),
                      textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      style: CustomTextStyle.buttonTxt(context, -1),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Text(''),
              ),
              Container(
                width: displayWidth(context) * 0.4,
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Loan_movement(
                          token: widget.token,
                          name: widget.name,
                          membership_no: widget.membership_no,
                          loanContractNo: jsonDecode(widget.pram)[0]
                              ['loan_contract_no'],
                          principalBalance: jsonDecode(widget.pram)[0]
                              ['principal_balance'],
                          lgs: widget.lgs,
                          fontsizeapps: _fontsizeapps,
                        ),
                      ),
                    );
                  },
                  child: Center(
                    child: Text(
                      Language.loanLg('showMovementlist', widget.lgs),
                      textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      style: CustomTextStyle.buttonTxt(context, -1),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Text(''),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// jsonDecode(widget.pram)[0]['loan_contract_no'] == null ? '' : jsonDecode(widget.pram)[0]['loan_contract_no']
Center _subdataHeadcolor(member, name, context, lgs) {
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
            ],
          ),
        ),
      ],
    ),
  );
}
