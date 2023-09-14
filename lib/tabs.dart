import 'package:appbase/bloc/fontSize/font_size_app/font_size_app_bloc.dart';
import 'package:appbase/class/language.dart';
import 'package:appbase/class/myclass.dart';
import 'package:appbase/class/textstyle.dart';
import 'package:appbase/deposit.dart';
import 'package:appbase/dividend.dart';
import 'package:appbase/gain.dart';
import 'package:appbase/guarantee.dart';
import 'package:appbase/kept.dart';
import 'package:appbase/loan.dart';
import 'package:appbase/location.dart';
import 'package:appbase/mainmenu.dart';
import 'package:appbase/news.dart';
import 'package:appbase/pins.dart';
import 'package:appbase/profile.dart';
import 'package:appbase/share.dart';
import 'package:flutter/material.dart';

import 'cremation.dart';

class Params {
  String token;
  Params(this.token);
}

int _selectedPage = 0;

class Tabs extends StatefulWidget {
  Param param;
  Tabs(this.param);

  // Param param;
  // Tabs(this.param);

  @override
  _TabsState createState() => _TabsState(param);
}

class _TabsState extends State<Tabs> {
  Param param;
  _TabsState(this.param);

  // @override
  // void initState() {
  //   _selectedPage = 0;
  //   super.initState();
  //    _selectedPage = 0;
  // }
  // FontSizeAppBloc _fontSizeAppBloc;

  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;

    final _page = [
      MainMenu(
          token: param.token,
          name: param.name,
          sex: param.sex,
          lgs: param.lgs,
          membership_no: param.membership_no,
          fontsizeapps: param.fontsizeapps),
      // News(
      //   token: param.token,
      //   name: param.name,
      //   sex: param.sex,
      //   lgs: param.lgs,
      //   membership_no: param.membership_no,
      //   fontsizeapps:param.fontsizeapps
      // ),
      Location(
          token: param.token,
          name: param.name,
          sex: param.sex,
          lgs: param.lgs,
          membership_no: param.membership_no,
          fontsizeapps: param.fontsizeapps),
      // MyApps(),
      Profile(
          token: param.token,
          name: param.name,
          sex: param.sex,
          lgs: param.lgs,
          membership_no: param.membership_no,
          fontsizeapps: param.fontsizeapps),
    ];
    final _route = <String, WidgetBuilder>{
      '/loan': (BuildContext context) => Loan(
          token: param.token,
          name: param.name,
          membership_no: param.membership_no,
          lgs: param.lgs,
          fontsizeapps: param.fontsizeapps),
      // '/gain': (BuildContext context) => Gain(param),
      '/share': (BuildContext context) => Share(
          token: param.token,
          name: param.name,
          membership_no: param.membership_no,
          lgs: param.lgs,
          fontsizeapps: param.fontsizeapps),
      '/deposit': (BuildContext context) => Deposit(
          token: param.token,
          name: param.name,
          membership_no: param.membership_no,
          lgs: param.lgs,
          fontsizeapps: param.fontsizeapps),
      '/guarantee': (BuildContext context) => Guarantee(
          token: param.token,
          name: param.name,
          membership_no: param.membership_no,
          lgs: param.lgs,
          fontsizeapps: param.fontsizeapps),
      '/kept': (BuildContext context) => Kept(
          token: param.token,
          name: param.name,
          membership_no: param.membership_no,
          lgs: param.lgs,
          fontsizeapps: param.fontsizeapps),
      '/dividend': (BuildContext context) => Dividend(
          token: param.token,
          name: param.name,
          membership_no: param.membership_no,
          lgs: param.lgs,
          fontsizeapps: param.fontsizeapps),
      '/gain': (BuildContext context) => Gain(
          token: param.token,
          name: param.name,
          membership_no: param.membership_no,
          lgs: param.lgs,
          fontsizeapps: param.fontsizeapps),

      '/cremation': (BuildContext context) => Cremation(
          token: param.token,
          name: param.name,
          membership_no: param.membership_no,
          lgs: param.lgs,
          fontsizeapps: param.fontsizeapps)
    };
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        fontFamily: 'FC_Lamoon',
      ),
      routes: _route,
      home: Scaffold(
        body: _page[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              // icon: Icon(Icons.home),
              // icon: ImageIcon(
              //   AssetImage("assets/imgs/menu1.png"),
              //   color: Colors.transparent,
              // ),
              activeIcon: Tooltip(
                message: Language.tabsLg('menu', param.lgs),
                child: Image.asset(
                  "assets/imgs/menu1.png",
                  width: tabletMode == true ? 55 : 30,
                ),
              ),
              icon: Tooltip(
                message: Language.tabsLg('menu', param.lgs),
                child: Image.asset(
                  "assets/imgs/menu2.png",
                  width: tabletMode == true ? 55 : 30,
                ),
              ),
              title: Text(
                Language.tabsLg('menu', param.lgs),
                textScaleFactor: MyClass.fontSizeApp(),
                style: CustomTextStyle.defaultTxt(context, -5),
              ),
            ),
            // BottomNavigationBarItem(
            //   // icon: Icon(Icons.location_on),
            //   activeIcon: Tooltip(
            //     message: Language.tabsLg('news', param.lgs),
            //     child: Image.asset(
            //       "assets/imgs/news1.png",
            //       width: tabletMode == true ? 55 : 30,
            //     ),
            //   ),
            //   icon: Tooltip(
            //     message: Language.tabsLg('news', param.lgs),
            //     child: Image.asset(
            //       "assets/imgs/news2.png",
            //       width: tabletMode == true ? 55 : 30,
            //     ),
            //   ),
            //   title: Text(
            //     Language.tabsLg('news', param.lgs),
            //     textScaleFactor: MyClass.fontSizeApp(),
            //     style: CustomTextStyle.defaultTxt(context, -5),
            //   ),
            // ),
            BottomNavigationBarItem(
              // icon: Icon(Icons.location_on),
              activeIcon: Tooltip(
                message: Language.tabsLg('address', param.lgs),
                child: Image.asset(
                  "assets/imgs/location1.png",
                  width: tabletMode == true ? 55 : 30,
                ),
              ),
              icon: Tooltip(
                message: Language.tabsLg('address', param.lgs),
                child: Image.asset(
                  "assets/imgs/location2.png",
                  width: tabletMode == true ? 55 : 30,
                ),
              ),
              title: Text(
                Language.tabsLg('address', param.lgs),
                textScaleFactor: MyClass.fontSizeApp(),
                style: CustomTextStyle.defaultTxt(context, -5),
              ),
            ),
            BottomNavigationBarItem(
              // icon: Icon(Icons.people),
              activeIcon: Tooltip(
                message: Language.tabsLg('profile', param.lgs),
                child: Image.asset(
                  "assets/imgs/profile1.png",
                  width: tabletMode == true ? 55 : 30,
                ),
              ),
              icon: Tooltip(
                message: Language.tabsLg('profile', param.lgs),
                child: Image.asset(
                  "assets/imgs/profile2.png",
                  width: tabletMode == true ? 55 : 30,
                ),
              ),
              title: Text(
                Language.tabsLg('profile', param.lgs),
                textScaleFactor: MyClass.fontSizeApp(),
                style: CustomTextStyle.defaultTxt(context, -5),
              ),
            ),
          ],
          currentIndex: _selectedPage,
          // selectedItemColor: MyColor.color('tabs'),
          // selectedItemColor:Colors.black,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }
}
