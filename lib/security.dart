import 'package:appbase/checksecurity.dart';
import 'package:appbase/class/customUI.dart';
import 'package:appbase/class/language.dart';
import 'package:appbase/class/myclass.dart';
import 'package:appbase/class/mycolor.dart';
import 'package:appbase/class/sizes.dart';
import 'package:appbase/class/textstyle.dart';
import 'package:flutter/material.dart';

double _fontsizeapps = 1.0;
class Security extends StatefulWidget {
  String lgs;
  double fontsizeapps;
  Security({Key key, this.lgs,this.fontsizeapps}) : super(key: key);
  @override
  _SecurityState createState() => _SecurityState();
}

class Securitys {
  String title;
  int type;
  Securitys({this.title, this.type});
}

class _SecurityState extends State<Security> {
  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.fontsizeapps;
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    List<Securitys> securitys = <Securitys>[
      Securitys(title: Language.settingLg('changePin', widget.lgs), type: 0),
      Securitys(
          title: Language.settingLg('forgotPassword', widget.lgs), type: 1),
      Securitys(title: Language.settingLg('deactivate', widget.lgs), type: 2),
    ];
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
            child: Container(
              padding: EdgeInsets.only(top: displayHeight(context) * 0.33),
              child:  _genmemu(security: securitys, tabletMode: tabletMode),
            ),
          ),
          CustomUI.appbarBackgroundUi(context),
          CustomUI.appbarUi(),
          CustomUI.appbarDetailUi1('assets/imgs/icon.png', context),
        ],
      ),
    );
  }
  

  ListView _genmemu({List<Securitys> security, tabletMode}) => ListView.builder(
        itemCount: security.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Checksecurity(
                      type: security[index].type, lgs: widget.lgs,fontsizeapps:_fontsizeapps),
                ),
              );
            },
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      top: 5, left: 10, right: 10, bottom: 5),
                  height: MediaQuery.of(context).size.height * 0.11,
                  child: Card(
                    elevation: 8,
                    color: Colors.white,
                    child: ClipPath(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                left: BorderSide(
                                    color: MyColor.color('settings'),
                                    width: 8))),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                security[index].title,
                                textScaleFactor:MyClass.blocFontSizeApp(_fontsizeapps) ,style:  CustomTextStyle.settingTxt(context, 5),
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.keyboard_arrow_right,
                                    size: iconnext(context, 0),
                                    color: MyColor.color('settings'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      clipper: ShapeBorderClipper(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
}
