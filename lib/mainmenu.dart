import 'package:appbase/bloc/fontSize/font_size_app/font_size_app_bloc.dart';
import 'package:appbase/class/customUI.dart';
import 'package:appbase/class/language.dart';
import 'package:appbase/class/myclass.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:onesignal_flutter/onesignal_flutter.dart';

class MainMenu extends StatefulWidget {
  String token;
  String name;
  String sex;
  String lgs;
  String membership_no;
  double fontsizeapps;
  MainMenu(
      {Key key,
      this.token,
      this.name,
      this.sex,
      this.lgs,
      this.membership_no,
      this.fontsizeapps})
      : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

var _colorMenu = Color(0xFFe87405);

class Menu {
  final String title;
  final String img;
  final String page;
  const Menu({this.title, this.img, this.page});
}

final List<Menu> menus = const <Menu>[
  const Menu(title: "share", img: 'assets/imgs/share.png', page: '/share'),
  const Menu(title: "loan", img: 'assets/imgs/loan.png', page: '/loan'),
  const Menu(
      title: "deposit", img: 'assets/imgs/deposit.png', page: '/deposit'),
  const Menu(
      title: "guarantee", img: 'assets/imgs/guarantee.png', page: '/guarantee'),
  const Menu(title: "kept", img: 'assets/imgs/kept.png', page: '/kept'),
  const Menu(
      title: "dividend", img: 'assets/imgs/dividend.png', page: '/dividend'),
  const Menu(title: "gain", img: 'assets/imgs/gain.png', page: '/gain'),
  const Menu(
      title: "cremation", img: 'assets/imgs/cremation.png', page: '/cremation'),
];

class Tab {
  final String title;
  final IconData icon;
  const Tab({this.title, this.icon});
}

class _MainMenuState extends State<MainMenu> {
  final _colorheader = Colors.green;
  String imgprofile;

  // FontSizeAppBloc _fontSizeAppBloc;

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

//   _oneSignal() async {
//     OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

//     OneSignal.shared.init("85f840dc-0358-448f-bb21-702519c56343", iOSSettings: {
//       OSiOSSettings.autoPrompt: true,
//       OSiOSSettings.inAppLaunchUrl: false
//     });
//     OneSignal.shared
//         .setInFocusDisplayType(OSNotificationDisplayType.notification);

// // The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
//     await OneSignal.shared
//         .promptUserForPushNotificationPermission(fallbackToSettings: true);
//   }

  @override
  void initState() {
    super.initState();
    // _oneSignal();
  }

  @override
  Widget build(BuildContext context) {
    // _fontSizeAppBloc = BlocProvider.of<FontSizeAppBloc>(context);

    bool tabletMode = MediaQuery.of(context).size.width > 600;
    // print(Language.lone('en'));
    // if (widget.sex == 'M') {
    //   imgprofile = 'assets/imgs/boy.png';
    // } else {
    //   imgprofile = 'assets/imgs/lady.png';
    // }
    if (widget.sex == 'M') {
      imgprofile =
          '${MyClass.hostApp()}/member/profile/${widget.membership_no}.jpg';
    } else {
      imgprofile =
          '${MyClass.hostApp()}/member/profile/${widget.membership_no}.jpg';
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'FC_Lamoon'),
      home: Scaffold(
        body: WillPopScope(
          onWillPop: _onBackPressed,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/imgs/bg.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: GridView.count(
                  primary: false,
                  padding: EdgeInsets.only(
                      left: 20, top: tabletMode == true ? 450 : 200, right: 20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: tabletMode == true ? 4 : 3,
                  children: List.generate(
                    menus.length,
                    (index) => Container(
                      decoration: BoxDecoration(
                          color: _colorMenu,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: _colorMenu, width: 2)),
                      padding: const EdgeInsets.all(8),
                      child: InkWell(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Image.asset(
                                menus[index].img,
                                fit: BoxFit.contain,
                                width: tabletMode == true ? 100 : 50,
                                height: tabletMode == true ? 100 : 50,
                              ),
                            ),
                            AutoSizeText(
                              Language.menuLg(menus[index].title, widget.lgs),
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(widget.fontsizeapps),
                              style: TextStyle(
                                fontSize: tabletMode == true ? 45 : 20,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                              maxFontSize: tabletMode == true ? 40 : 20,
                            )
                          ],
                        ),
                        onTap: () {
                          print(menus[index].page);
                          Navigator.pushNamed(context, menus[index].page);
                        },
                      ),
                    ),
                  ),
                ),
              ),
              CustomUI.appbarUiMainMenu(imgprofile, widget.name, widget.lgs,
                  widget.fontsizeapps, context),
            ],
          ),
        ),
      ),
    );

    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData(fontFamily: 'FC_Lamoon'),
    //   home: Scaffold(
    //     body: BlocBuilder(
    //       cubit: _fontSizeAppBloc,
    //       builder: (context, state) {
    //         if (state is LoadedFontSizeAppState) {
    //           print(state.fontsize);
    //           return WillPopScope(
    //             onWillPop: _onBackPressed,
    //             child: Stack(
    //               children: <Widget>[
    //                 Container(
    //                   decoration: BoxDecoration(
    //                     image: DecorationImage(
    //                       image: AssetImage("assets/imgs/bg.png"),
    //                       fit: BoxFit.cover,
    //                     ),
    //                   ),
    //                   child: GridView.count(
    //                     primary: false,
    //                     padding: EdgeInsets.only(
    //                         left: 20,
    //                         top: tabletMode == true ? 450 : 200,
    //                         right: 20),
    //                     crossAxisSpacing: 10,
    //                     mainAxisSpacing: 10,
    //                     crossAxisCount: tabletMode == true ? 4 : 3,
    //                     children: List.generate(
    //                       menus.length,
    //                       (index) => Container(
    //                         decoration: BoxDecoration(
    //                             color: _colorMenu,
    //                             borderRadius: BorderRadius.circular(20),
    //                             border:
    //                                 Border.all(color: _colorMenu, width: 2)),
    //                         padding: const EdgeInsets.all(8),
    //                         child: InkWell(
    //                           child: Column(
    //                             mainAxisSize: MainAxisSize.min,
    //                             mainAxisAlignment: MainAxisAlignment.center,
    //                             crossAxisAlignment: CrossAxisAlignment.center,
    //                             children: <Widget>[
    //                               Expanded(
    //                                 child: Image.asset(
    //                                   menus[index].img,
    //                                   fit: BoxFit.contain,
    //                                   width: tabletMode == true ? 100 : 50,
    //                                   height: tabletMode == true ? 100 : 50,
    //                                 ),
    //                               ),
    //                               AutoSizeText(
    //                                 Language.menuLg(
    //                                     menus[index].title, widget.lgs),
    //                                 textScaleFactor:
    //                                     MyClass.blocFontSizeApp(state.fontsize),
    //                                 style: TextStyle(
    //                                   fontSize: tabletMode == true ? 45 : 20,
    //                                   color: Colors.black87,
    //                                   fontWeight: FontWeight.bold,
    //                                 ),
    //                                 maxFontSize: tabletMode == true ? 40 : 20,
    //                               )
    //                             ],
    //                           ),
    //                           onTap: () {
    //                             // print(menus[index].page);
    //                             _navigator(menus[index].page);
    //                           },
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //                 CustomUI.appbarUiMainMenu(
    //                     imgprofile, widget.name, widget.lgs, context),
    //               ],
    //             ),
    //           );
    //         }
    //         if (state is InitialFontSizeAppState) {
    //           _fontSizeAppBloc.add(LoadFontSizeApp());
    //         }
    //         return Center(child: CircularProgressIndicator());
    //       },
    //     ),
    //   ),
    // );
  }

  void _navigator(p) {
    Navigator.pushNamed(context, p);
  }
}

class CustomShapeBorder extends ContinuousRectangleBorder {
  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    final double innerCircleRadius = 3.0;
    // Path path = Path();
    // path.lineTo(0, rect.height);
    // // path.quadraticBezierTo(rect.width / 2 - (innerCircleRadius / 2) - 30, rect.height + 15, rect.width / 2 - 75, rect.height + 50);
    // // path.cubicTo(
    // //     rect.width / 2 - 40, rect.height + innerCircleRadius - 40,
    // //     rect.width / 2 + 40, rect.height + innerCircleRadius - 40,
    // //     rect.width / 2 + 75, rect.height + 50
    // // );
    // // path.quadraticBezierTo(rect.width / 2 + (innerCircleRadius / 2) + 30, rect.height + 15, rect.width, rect.height);
    // path.lineTo(rect.width, 0.0);
    // path.close();
    Path p = new Path();
    p.lineTo(rect.width * innerCircleRadius, 0.0);
    p.lineTo(
        rect.width * innerCircleRadius, rect.height * innerCircleRadius / 8.75);
    p.lineTo(0.0, rect.height * innerCircleRadius / 1.75);
    p.close();
    return p;
    // return path;
  }

  // @override
  // bool shouldReclip(CustomClipper oldClipper) {
  //   return true;
  // }
}
