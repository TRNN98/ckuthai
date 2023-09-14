import 'package:appbase/class/customUI.dart';
import 'package:appbase/class/language.dart';
import 'package:appbase/class/myclass.dart';
import 'package:appbase/class/sizes.dart';
import 'package:appbase/class/textstyle.dart';
import 'package:appbase/models/newsJson.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:photo_view/photo_view.dart';
import 'package:url_launcher/url_launcher.dart';

double _fontsizeapps = 1.0;

class NewsDetail extends StatefulWidget {
  NewsModel newdata;
  String lgs;
  double fontsizeapps;

  NewsDetail({Key key, this.newdata, this.lgs, this.fontsizeapps})
      : super(key: key);

  @override
  _NewsDetailState createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  String kHtml = '''  ''';

  @override
  Widget build(BuildContext context) {
    _fontsizeapps = widget.fontsizeapps;
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
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
                  tabletMode == true
                      ? hSizedBox(context, 140)
                      : hSizedBox(context, 30),
                  Container(
                    child: Center(
                      child: Text(Language.newsLg('Coopnews', widget.lgs),
                          textScaleFactor:
                              MyClass.blocFontSizeApp(_fontsizeapps),
                          style: CustomTextStyle.subTitleTxt(context, 0)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.newdata.question,
                      textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                      style: CustomTextStyle.defaultTxt(context, 0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      // child: Hero(
                      //   tag: 'imageHero',
                      child: Image.network(
                        '${MyClass.hostApp()}/mediafiles/' +
                            widget.newdata.nphoto,
                        height: displayHeight(context) * 0.2,
                        width: displayWidth(context) * 1,
                      ),
                      // ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return DetailScreen(
                            url: '${MyClass.hostApp()}/mediafiles/' +
                                widget.newdata.nphoto,
                          );
                        }));
                      },
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.all(8),
                  //   child: HtmlWidget(
                  //     '''${widget.newdata.note}''',
                  //     customStylesBuilder: (element) {
                  //       if (element.classes.contains('')) {
                  //         return {'color': 'red'};
                  //       }

                  //       return null;
                  //     },
                  //     webView: true,
                  //   ),
                  // ),
                  widget.newdata.ndata != null
                      ? widget.newdata.ndata != ''
                          ? _checkloadfile()
                          : Padding(
                              padding: EdgeInsets.all(8),
                            )
                      : Padding(
                          padding: EdgeInsets.all(8),
                        ),
                ],
              ),
            ),
          ),
          CustomUI.appbarTxtTitleUi(
              Language.newsLg('news', widget.lgs), _fontsizeapps, context),
          CustomUI.appbarDetailUi1('assets/imgs/icon.png', context),
          CustomUI.appbarUi(),
        ],
      ),
    );
  }

  Padding _checkloadfile() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => {
              // print(MyClass.formatNumberFone('0,8-0-83-9-1,,,464').toString().length)
              _launchURL(
                  "${MyClass.hostApp()}/mediafiles/" + widget.newdata.ndata)
            },
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(width: 1.5, color: Colors.blue[500]),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.file_download,
                    color: Colors.red[500],
                  ),
                  Text(
                    Language.newsLg('load', widget.lgs),
                    textScaleFactor: MyClass.blocFontSizeApp(_fontsizeapps),
                    style: CustomTextStyle.settingTxt(context, -10),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  String url;

  DetailScreen({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          // child: Hero(
          // tag: 'imageHero',
          child: PhotoView(
            imageProvider: NetworkImage(url),
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
