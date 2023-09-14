import 'dart:convert';

import 'package:appbase/class/customUI.dart';
import 'package:appbase/class/language.dart';
import 'package:appbase/class/myclass.dart';
import 'package:appbase/class/mycolor.dart';
import 'package:appbase/class/sizes.dart';
import 'package:appbase/class/textstyle.dart';
import 'package:appbase/class/widget.dart';
import 'package:appbase/services/netword.dart';
import 'package:flutter/material.dart';
import 'package:appbase/models/shareJson.dart';
import 'package:loading_gifs/loading_gifs.dart';

double _fontsizeapps = 1.0;

class Share extends StatefulWidget {
  final String token;
  final String name;
  final String membership_no;
  final String lgs;
  final double fontsizeapps;

  Share(
      {Key key,
      this.token,
      this.membership_no,
      this.name,
      this.lgs,
      this.fontsizeapps})
      : super(key: key);

  @override
  _ShareState createState() => _ShareState();
}

// class Subheader {
//   final String title;
//   final String data;
//   const Subheader({this.title, this.data});
// }

// const List<Subheader> subheaders = const <Subheader>[
//   const Subheader(title: "ทุนเรือนหุ้น", data: '008qwr9q'),
//   const Subheader(title: "ทุนเรือนหุ้น", data: 'dsaf'),
//   const Subheader(title: "asfd", data: 'e'),
//   const Subheader(title: "ทุนเรือนหุ้น", data: '008qdwr9q'),
//   const Subheader(title: "asdf", data: '008asdfqwr9q'),
// ];

class _ShareState extends State<Share> {
  // final List<String> entries = <String>['A', 'B', 'C'];
  // final List<int> colorCodes = <int>[600, 500, 100];

  var ObjHeadShare = '{"mode": "1"}';
  var ObjShare = '{"mode": "2"}';
  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.fontsizeapps;

    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(displayWidth(context) * 0.15),
      //   child: AppBar(
      //     elevation: 0.0,
      //     backgroundColor: MyColor.color('colorheader'),
      //     flexibleSpace: Padding(
      //       padding: tabletMode == true
      //           ? EdgeInsets.only(top: headpadding(context, -40))
      //           : EdgeInsets.only(top: headpadding(context, 10)),
      //       child: Image.asset('assets/imgs/share.png'),
      //     ),
      //   ),
      // ),
      body: Stack(
        children: <Widget>[
          // CustomTextStyle.headcolor(context, 0),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/imgs/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: <Widget>[
                tabletMode == true
                    ? hSizedBox(context, 100)
                    : hSizedBox(context, 0),

                Container(
                  padding: EdgeInsets.only(top: 8),
                  child: Center(
                    child: Text(Language.shareLg('share', widget.lgs),
                        textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                        style: CustomTextStyle.subTitleTxt(context, 10)),
                  ),
                ),
                // lineSizedBox(context, 0),
                Container(
                  child: FutureBuilder<List<Headshare>>(
                    future: Network.fetchHeadShare(
                        ObjHeadShare, widget.token, context),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return snapshot.data.length > 0
                            ? _subdatahead(
                                widget.membership_no,
                                widget.name,
                                jsonDecode(jsonEncode(snapshot.data))[0]
                                    ['share_stock'],
                                jsonDecode(jsonEncode(snapshot.data))[0]
                                    ['share_amount'],
                                jsonDecode(jsonEncode(snapshot.data))[0]
                                    ['period_recrieve'],
                                context,
                                widget.lgs)
                            : MyWidget.nodata(widget.lgs, context);
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return MyClass.loading();
                    },
                  ),
                ),
                lineSizedBox(context, 0),

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
                    child: FutureBuilder<List<ShareModel>>(
                      future:
                          Network.fetchShare(ObjShare, widget.token, context),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return snapshot.data.length > 0
                              ? _detail(
                                  share: snapshot.data,
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

                // Padding(
                //   padding: EdgeInsets.only(left: 15, right: 15),
                //   child: Container(
                //     padding: EdgeInsets.all(12),
                //     color: Colors.green,
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //       children: <Widget>[
                //         Expanded(
                //           flex: 1,
                //           child: Text(
                //             'วันที่',
                //             textAlign: TextAlign.center,
                //             textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style: TextStyle(fontSize: 13),
                //           ),
                //         ),
                //         Expanded(
                //           flex: 1,
                //           child: Text(
                //             'งวด',
                //             textAlign: TextAlign.center,
                //             textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style: TextStyle(fontSize: 13),
                //           ),
                //         ),
                //         Expanded(
                //           flex: 1,
                //           child: Text(
                //             'จำนวนเงิน',
                //             textAlign: TextAlign.center,
                //             textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style: TextStyle(fontSize: 13),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // Expanded(
                //   flex: 1,
                //   child: Padding(
                //     padding: EdgeInsets.only(left: 15, right: 15),
                //     child: FutureBuilder<List<ShareModel>>(
                //       future: Network.fetchShare(ObjShare, widget.token),
                //       builder: (context, snapshot) {
                //         if (snapshot.hasData) {
                //           print(snapshot.data.length);
                //           return _detail(share: snapshot.data);
                //         } else if (snapshot.hasError) {
                //           return Text("${snapshot.error}");
                //         }

                //         return CircularProgressIndicator();
                //       },
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          CustomUI.appbarBackgroundUi(context),
          CustomUI.appbarUi(),
          CustomUI.appbarDetailUi('assets/imgs/share.png', context),
        ],
      ),
    );
  }

  Widget _detail({List share}) => ListView.separated(
        padding: EdgeInsets.only(top: 0),
        separatorBuilder: (context, index) => Divider(
          color: MyColor.color('linelist'),
        ),
        itemCount: share.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          MyClass.checkNull(share[index].operateDate),
                          textAlign: TextAlign.left,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.dataBoldTxt(context, 0),
                        ),
                        Text(
                          MyClass.checkNull(share[index].itemTypeDescription),
                          textAlign: TextAlign.left,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.dataTxt(context, 1),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          MyClass.checkNull(share[index].period),
                          textAlign: TextAlign.left,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.defaultTxt(context, 1),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          MyClass.FormatNumber(
                              share[index].shareValue.toString()),
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
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

// Widget _detail({List share}) => ListView.separated(
//       separatorBuilder: (context, index) => Divider(
//         color: Colors.black,
//       ),
//       itemCount: share.length,
//       itemBuilder: (BuildContext context, int index) {
//         return Container(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Expanded(
//                 flex: 1,
//                 child: Padding(
//                   padding: EdgeInsets.only(left: 10),
//                   child: Expanded(
//                     flex: 1,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text(
//                           share[index].operateDate,
//                           textAlign: TextAlign.left,
//                           textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style: TextStyle(fontSize: 13),
//                         ),
//                         Text(
//                           share[index].itemTypeDescription,
//                           textAlign: TextAlign.left,
//                           textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style: TextStyle(fontSize: 12),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 flex: 1,
//                 child: Text(
//                   share[index].period.toString(),
//                   textAlign: TextAlign.center,
//                   textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style: TextStyle(fontSize: 13),
//                 ),
//               ),
//               Expanded(
//                 flex: 1,
//                 child: Text(
//                   share[index].shareValue,
//                   textAlign: TextAlign.right,
//                   textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style: TextStyle(fontSize: 13),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );

// Widget _headerlist(List<Subheader> headers) => ListView.builder(
//       itemCount: headers.length,
//       itemBuilder: (context, index) {
//         return Padding(
//           padding: EdgeInsets.only(left: 25),
//           child: Row(
//             children: <Widget>[
//               Text(
//                 headers[index].title + ' : ',
//                 textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style: TextStyle(fontSize: 15),
//               ),
//               Text(
//                 headers[index].data,
//                 textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style: TextStyle(fontSize: 15),
//               ),
//             ],
//           ),
//         );
//       },
//     );

//   Widget _header({List headshare}) {
//     return Column(
//       children: <Widget>[
//         Padding(
//           padding: EdgeInsets.only(bottom: 10),
//           child: Center(
//             child: Text(
//               'รายละเอียดทุนเรือนหุ้น',
//               textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style: TextStyle(fontSize: 20),
//             ),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.only(left: 25),
//           child: Row(
//             children: <Widget>[
//               Text(
//                 'ทุนเรือนหุ้น : ',
//                 textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style: TextStyle(fontSize: 13),
//               ),
//               Text(
//                 headshare[0].shareAmount,
//                 textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style: TextStyle(fontSize: 13),
//               ),
//             ],
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.only(left: 25),
//           child: Row(
//             children: <Widget>[
//               Text(
//                 'งวดล่าสุด : ',
//                 textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style: TextStyle(fontSize: 13),
//               ),
//               Text(
//                 headshare[0].periodRecrieve,
//                 textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style: TextStyle(fontSize: 13),
//               ),
//             ],
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.only(left: 25),
//           child: Row(
//             children: <Widget>[
//               Text(
//                 'หุ้นรายเดือน : ',
//                 textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style: TextStyle(fontSize: 13),
//               ),
//               Text(
//                 headshare[0].shareStock,
//                 textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style: TextStyle(fontSize: 13),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

Center _subdatahead(member, name, amount, stock, period, context, lgs) {
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
                          child: Text(Language.shareLg('member', lgs),
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataHeadTitleTxt(
                                  context, 0)))),
                  Expanded(
                      child: Center(
                          child: Text(Language.shareLg('name', lgs),
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
                          child: Text(MyClass.FormatNumber(amount),
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataHeadDataTxt(
                                  context, 0)))),
                  Expanded(
                      child: Center(
                          child: Text(MyClass.FormatNumber(period),
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataHeadDataTxt(
                                  context, 0)))),
                  Expanded(
                      child: Center(
                          child: Text(MyClass.FormatNumber(stock),
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
                          child: Text(Language.shareLg('share', lgs),
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataHeadTitleTxt(
                                  context, 0)))),
                  Expanded(
                      child: Center(
                          child: Text(Language.shareLg('period', lgs),
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(_fontsizeapps),
                              style: CustomTextStyle.dataHeadTitleTxt(
                                  context, 0)))),
                  Expanded(
                      child: Center(
                          child: Text(Language.shareLg('monthlyShare', lgs),
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
            Language.shareLg('date', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, 0),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            Language.shareLg('period1', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, 0),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            Language.shareLg('amount', lgs),
            textAlign: TextAlign.center,
            textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
            style: CustomTextStyle.headTitleTxt(context, 0),
          ),
        ),
      ],
    ),
  );
}
