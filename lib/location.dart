import 'package:appbase/class/customUI.dart';
import 'package:appbase/class/language.dart';
import 'package:appbase/class/myclass.dart';
import 'package:appbase/class/sizes.dart';
import 'package:appbase/class/textstyle.dart';
import 'package:appbase/class/widget.dart';
import 'package:appbase/models/addressJson.dart';
import 'package:appbase/services/netword.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:photo_view/photo_view.dart';
import 'package:url_launcher/url_launcher.dart';

class Location extends StatefulWidget {
  String token;
  String name;
  String sex;
  String lgs;
  String membership_no;
  double fontsizeapps;
  Location(
      {Key key,
      this.token,
      this.name,
      this.sex,
      this.lgs,
      this.membership_no,
      this.fontsizeapps})
      : super(key: key);
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<AddressModel> address;
  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ออกจากแอปพลิเคชัน'),
            content: Text('คุณต้องการออกจากแอปพลิเคชัน ใช่ หรือ ไม่'),
            actions: <Widget>[
              FlatButton(
                child: Text('ไม่'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              FlatButton(
                child: Text('ใช่'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        });
  }

  Future _callNumber(n) async {
    var number = n.toString();
    await FlutterPhoneDirectCaller.callNumber(number);
  }

  Future<AddressModel> _getadress() async {
    await Network.fetchAddress('{"mode": "1"}').then((value) {
      setState(() {
        address = value;
      });
    });
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    _getadress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    print(address);
    return Scaffold(
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              decoration: MyWidget.bgApp(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    tabletMode == true
                        ? hSizedBox(context, 140)
                        : hSizedBox(context, 30),
                    Container(
                      child: Center(
                        child: Column(
                          children: [
                            Text(MyClass.company('th'),
                                textScaleFactor: MyClass.blocFontSizeApp(widget.fontsizeapps),
                                style:
                                    CustomTextStyle.dataHeadTitleTxt(context, 7)),
                            Text(MyClass.company('en'),
                                textScaleFactor: MyClass.blocFontSizeApp(widget.fontsizeapps),
                                style: CustomTextStyle.dataHeadTitleTxt(
                                    context, tabletMode == true ? -15 : -4)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: tabletMode == true ? 70 : 20,
                    ),
                    // SingleChildScrollView(
                    //   child: Column(
                    //     children: [
                    address == null ? SizedBox(height: 1) : _address(address),
                    address == null ? SizedBox(height: 1) : _callnumber(),
                    _img(),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            CustomUI.appbarTxtTitleUi(
                Language.addressLg('address', widget.lgs),widget.fontsizeapps, context),
            CustomUI.appbarDetailUi1('assets/imgs/icon.png', context),
          ],
        ),
      ),
    );
    //  void    _getall() {
    //   _address(address);
    //   // _callnumber();
    // }
  }

  Widget _img() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        // child: Hero(
        //   tag: 'imageHero',
        // child: Image.asset('assets/imgs/phones.png'),
        // ),
        child: Image.asset('assets/imgs/maplaout.png'),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return DetailScreenNetwork(
              url: '${MyClass.hostApp()}/member/imgMobile/phones.png',
            );
          }));
        },
      ),
    );
  }

  Widget _callnumber() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _phonenumber(address[0].numberPhone1, address[0].txtPhone1),
            _phonenumber(address[0].numberPhone2, address[0].txtPhone2),
            _phonenumber(address[0].numberPhone3, address[0].txtPhone3),
            // _phonenumber(address[0].numberPhone2),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _phonenumber(address[0].numberPhone4, address[0].txtPhone4),
            // _phonenumber(address[0].numberPhone2, address[0].txtPhone2),
            // _phonenumber(address[0].numberPhone3, address[0].txtPhone3),
            // _phonenumber(address[0].numberPhone2),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // _phonenumber(address[0].numberPhone3, address[0].txtPhone3),
            _line(address[0].line),
            _facebook(address[0].facebook),
            _maps(address[0].map),
          ],
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     _tt(),
        //   ],
        // ),
      ],
    );
  }

  Widget _null() {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          IconButton(
            icon: Image.asset(''),
            iconSize: tabletMode == true ? 70 : 40,
            onPressed: () {
              // _launchURL();
            },
          ),
          Text(
            '',
            textScaleFactor: MyClass.blocFontSizeApp(widget.fontsizeapps),
            style: CustomTextStyle.defaultTxt(context, -5),
          ),
        ],
      ),
    );
  }

  Widget _tt() {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Padding(
      padding: EdgeInsets.only(
        left: tabletMode == true ? 70 : 25,
        right: tabletMode == true ? 70 : 25,
      ),
      child: Column(
        children: [
          IconButton(
            icon: Image.asset('assets/imgs/maplaout.png'),
            iconSize: tabletMode == true ? 70 : 40,
            onPressed: () {
              // _launchURL(url);
            },
          ),
          Text(
            'Map',
            textScaleFactor: MyClass.blocFontSizeApp(widget.fontsizeapps),
            style: CustomTextStyle.defaultTxt(
              context,
              tabletMode == true ? -5 : 0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _maps(url) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Padding(
      padding: EdgeInsets.only(
        left: tabletMode == true ? 70 : 25,
        right: tabletMode == true ? 70 : 25,
      ),
      child: Column(
        children: [
          IconButton(
            icon: Image.asset('assets/imgs/map.png'),
            iconSize: tabletMode == true ? 70 : 40,
            onPressed: () {
              _launchURL(url);
            },
          ),
          Text(
            'Map',
            textScaleFactor: MyClass.blocFontSizeApp(widget.fontsizeapps),
            style: CustomTextStyle.defaultTxt(
              context,
              tabletMode == true ? -5 : -4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _facebook(url) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Padding(
      padding: EdgeInsets.only(
        left: tabletMode == true ? 70 : 25,
        right: tabletMode == true ? 70 : 25,
      ),
      child: Column(
        children: [
          IconButton(
            icon: Image.asset('assets/imgs/facebook.png'),
            iconSize: tabletMode == true ? 70 : 40,
            onPressed: () {
              _launchURL(url);
            },
          ),
          Text(
            'Facebook',
            textScaleFactor: MyClass.blocFontSizeApp(widget.fontsizeapps),
            style: CustomTextStyle.defaultTxt(
              context,
              tabletMode == true ? -5 : -4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _line(url) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Padding(
      padding: EdgeInsets.only(
        left: tabletMode == true ? 70 : 25,
        right: tabletMode == true ? 70 : 25,
      ),
      child: Column(
        children: [
          IconButton(
            icon: Image.asset('assets/imgs/line.png'),
            iconSize: tabletMode == true ? 70 : 40,
            onPressed: () {
              _launchURL(url);
            },
          ),
          Text(
            'Line',
            textScaleFactor: MyClass.blocFontSizeApp(widget.fontsizeapps),
            style: CustomTextStyle.defaultTxt(
              context,
              tabletMode == true ? -5 : -4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _phonenumber(n, t) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          IconButton(
            icon: Image.asset('assets/imgs/call.png'),
            iconSize: tabletMode == true ? 70 : 40,
            onPressed: () {
              _callNumber(MyClass.formatNumberPhoneI(n));
            },
          ),
          Text(
            n,
            textScaleFactor: MyClass.blocFontSizeApp(widget.fontsizeapps),
            style: CustomTextStyle.defaultTxt(
              context,
              tabletMode == true ? -5 : -4,
            ),
          ),
          Text(
            t,
            textScaleFactor: MyClass.blocFontSizeApp(widget.fontsizeapps),
            style: CustomTextStyle.defaultTxt(
              context,
              tabletMode == true ? -5 : -4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _address(address) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  address[0].address,
                  textScaleFactor: MyClass.blocFontSizeApp(widget.fontsizeapps),
                  style: CustomTextStyle.defaultTxt(context, 0),
                ),
              ],
            ),
          ),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.center ,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Email: ',
                textScaleFactor: MyClass.blocFontSizeApp(widget.fontsizeapps),
                style: CustomTextStyle.dataBoldTxt(context, 0),
              ),
              Text(
                address[0].email,
                textScaleFactor: MyClass.blocFontSizeApp(widget.fontsizeapps),
                style: CustomTextStyle.defaultTxt(context, 0),
              ),
            ],
          ),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.center ,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Fax: ',
                textScaleFactor: MyClass.blocFontSizeApp(widget.fontsizeapps),
                style: CustomTextStyle.dataBoldTxt(context, 0),
              ),
              Text(
                address[0].fax,
                textScaleFactor: MyClass.blocFontSizeApp(widget.fontsizeapps),
                style: CustomTextStyle.defaultTxt(context, 0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class DetailScreenNetwork extends StatelessWidget {
  String url;
  DetailScreenNetwork({Key key, this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GestureDetector(

        child: Center(
          // child: Hero(
          // tag: 'imageHero',
          child: PhotoView(
            imageProvider: AssetImage("assets/imgs/maplaout.png"),
          ),
          // ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}