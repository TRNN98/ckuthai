import 'package:appbase/class/customUI.dart';
import 'package:appbase/class/language.dart';
import 'package:appbase/class/myclass.dart';
import 'package:appbase/class/mycolor.dart';
import 'package:appbase/class/sizes.dart';
import 'package:appbase/class/textstyle.dart';
import 'package:appbase/models/newsJson.dart';
import 'package:appbase/news_detail.dart';
import 'package:appbase/services/netword.dart';
import 'package:flutter/material.dart';
import 'package:loading_gifs/loading_gifs.dart';
import 'package:transparent_image/transparent_image.dart';

class News extends StatefulWidget {
  String token;
  String name;
  String sex;
  String lgs;
  String membership_no;
  double fontsizeapps;

  News(
      {Key key,
      this.token,
      this.name,
      this.sex,
      this.lgs,
      this.membership_no,
      this.fontsizeapps})
      : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class New {
  final String title;
  final String img;

  const New({this.title, this.img});
}

class _NewsState extends State<News> {
  var Objnews = '{"mode": "1"}';

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

  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: Stack(
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
                      ? hSizedBox(context, 140)
                      : hSizedBox(context, 30),
                  Container(
                    child: Center(
                      child: Text(Language.newsLg('Coopnews', widget.lgs),
                          textScaleFactor:
                              MyClass.blocFontSizeApp(widget.fontsizeapps),
                          style: CustomTextStyle.subTitleTxt(context, 0)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: displayHeight(context) *
                      (tabletMode == true ? 0.38 : 0.32)),
              // child: _getnew(news1: new12, tabletMode: tabletMode),
              child: FutureBuilder<List<NewsModel>>(
                future: Network.fetchNews(Objnews, widget.token, context),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return _getnew(news1: snapshot.data);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return MyClass.loading();
                },
              ),
            ),
            CustomUI.appbarTxtTitleUi(Language.newsLg('news', widget.lgs),
                widget.fontsizeapps, context),
            CustomUI.appbarDetailUi1('assets/imgs/icon.png', context),
          ],
        ),
      ),
    );
  }

  ListView _getnew({List<NewsModel> news1}) => ListView.separated(
        // padding: EdgeInsets.only(top: 0),
        separatorBuilder: (context, index) => Divider(
          color: MyColor.color('linelist'),
        ),
        itemCount: news1.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsDetail(
                      newdata: news1[index],
                      lgs: widget.lgs,
                      fontsizeapps: widget.fontsizeapps),
                ),
              );
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 5),
                  child: Row(
                    children: [
                      FadeInImage.memoryNetwork(
                        width: displayHeight(context) * 0.07,
                        height: displayHeight(context) * 0.07,
                        fit: BoxFit.fill,
                        placeholder: kTransparentImage,
                        image: '${MyClass.hostApp()}/mediafiles/' +
                            news1[index].nphoto,
                      ),
                      Text('      '),
                      Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              news1[index].date,
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(widget.fontsizeapps),
                              style: CustomTextStyle.dataBoldTxt(context, -2),
                            ),
                            Text(
                              news1[index].question,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(widget.fontsizeapps),
                              style: CustomTextStyle.defaultTxt(context, 0),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
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
                )
              ],
            ),
          );
        },
      );
}
