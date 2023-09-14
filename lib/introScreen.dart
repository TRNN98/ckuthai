import 'package:appbase/checkrg.dart';
import 'package:appbase/class/myclass.dart';
import 'package:appbase/class/mycolor.dart';
import 'package:appbase/class/textstyle.dart';
import 'package:appbase/locals/dblg.dart';
import 'package:appbase/models/lgDb.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = new List();

  Function goToTab;
  DBLg dBLg;
  LGDb lg = LGDb();

  _insertlg() {
    lg.lg = '0';
    dBLg.initDB().then(
          (x) => {
            dBLg.deleteAll().then((value) => {
                  dBLg.insertLg(lg).then(
                        (l) => {},
                      ),
                })
          },
        );
  }

  @override
  void initState() {
    dBLg = DBLg();
    super.initState();
    _insertlg();
    slides.add(
      new Slide(
        title: 'WELCOME\nTO,' + MyClass.company('en'),
        // styleTitle: TextStyle(
        //     fontSize: 25.0,
        //     fontWeight: FontWeight.bold,
        //     fontFamily: 'FC_Lamoon'),
        description: "ยินดีต้อนรับเข้าสู่ระบบ\nบริการสมาชิกแบบออนไลน์," +
            MyClass.company('th'),
        // styleDescription: TextStyle(
        //     fontSize: 20.0,
        //     fonttextScaleFactor:MyClass.fontSizeApp() ,style:  FontStyle.italic,
        //     fontFamily: 'FC_Lamoon'),
        pathImage: "assets/imgs/tuto1.png",
      ),
    );
    slides.add(
      new Slide(
        title: "Trustworthy,",
        styleTitle: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'FC_Lamoon'),
        description: ",สร้างความมั่นใจในการใช้งานด้วยมาตรฐาน\nระบบความปลอดภัย",
        styleDescription: TextStyle(
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'FC_Lamoon'),
        pathImage: "assets/imgs/tuto2.png",
      ),
    );
    slides.add(
      new Slide(
        title: "Faster and Save time,",
        styleTitle: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'FC_Lamoon'),
        description:
            ",ดีต่อใจ...สะดวกรวดเร็ว และ \nประหยัดเวลากว่าช่องทางอื่นๆ",
        styleDescription: TextStyle(
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'FC_Lamoon'),
        pathImage: "assets/imgs/tuto3.png",
      ),
    );
    slides.add(
      new Slide(
        title: "Answers and Relevant,",
        styleTitle: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'FC_Lamoon'),
        description:
            ",เป็นมากกว่าโปรแกรมสหกรณ์\nตอบโจทย์ทุกการใช้งานบนมือถือ\nFollowME ... Follow to the future.",
        styleDescription: TextStyle(
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'FC_Lamoon'),
        pathImage: "assets/imgs/tuto4.png",
      ),
    );
  }

  void onDonePress() {
    // Back to the first tab
    // this.goToTab(0);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Checkrg(),
      ),
    );
  }

  void onTabChangeCompleted(index) {
    // Index of current tab is focused
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: MyColor.color('slide1'),
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: MyColor.color('slide1'),
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: MyColor.color('slide1'),
    );
  }

  List<Widget> renderListCustomTabs(tabletMode) {
    List<Widget> tabs = new List();
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/imgs/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          // margin: EdgeInsets.only(bottom: 50.0, top: 50.0),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: InkWell(
                    child: Image.asset(
                  'assets/imgs/icon.png',
                  width: tabletMode == true ? 250 : 90,
                  height: tabletMode == true ? 250 : 90,
                  fit: BoxFit.contain,
                )),
              ),
              InkWell(
                  child: Image.asset(
                currentSlide.pathImage,
                width: tabletMode == true ? 500 : 200,
                height: tabletMode == true ? 500 : 200,
                fit: BoxFit.contain,
              )),
              Container(
                child: Column(
                  children: [
                    Text(
                      currentSlide.title.split(',')[0],
                      // textScaleFactor:MyClass.fontSizeApp() ,style:  currentSlide.styleTitle,
                      textScaleFactor: MyClass.fontSizeApp(),
                      style: CustomTextStyle.titleIntoTxt(context, 0),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      currentSlide.title.split(',')[1],
                      // textScaleFactor:MyClass.fontSizeApp() ,style:  currentSlide.styleTitle,
                      textScaleFactor: MyClass.fontSizeApp(),
                      style: CustomTextStyle.titleIntoTxt(context, -10),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                // margin: EdgeInsets.only(top: 10.0),
              ),
              //  Container(
              //   child: Text(
              //     currentSlide.title.split(',')[1],
              //     // textScaleFactor:MyClass.fontSizeApp() ,style:  currentSlide.styleTitle,
              //     textScaleFactor:MyClass.fontSizeApp() ,style:  CustomTextStyle.titleIntoTxt(context, -10),
              //     textAlign: TextAlign.center,
              //   ),
              // ),
              Container(
                child: Text(
                  currentSlide.description.split(',')[0],
                  textScaleFactor: MyClass.fontSizeApp(),
                  style: CustomTextStyle.dataHeadTitleTxt(context, 0),
                  // textScaleFactor:MyClass.fontSizeApp() ,style:  currentSlide.styleDescription,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
              Container(
                child: Text(
                  currentSlide.description.split(',')[1],
                  textScaleFactor: MyClass.fontSizeApp(),
                  style: CustomTextStyle.dataBoldBTxt(context, 3),
                  // textScaleFactor:MyClass.fontSizeApp() ,style:  currentSlide.styleDescription,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
            ],
          ),
        ),
      ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    _insertlg();
    return IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      colorSkipBtn: MyColor.color('slide2'),
      highlightColorSkipBtn: MyColor.color('slide1'),

      // Next button
      renderNextBtn: this.renderNextBtn(),

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      colorDoneBtn: MyColor.color('slide2'),
      highlightColorDoneBtn: MyColor.color('slide1'),

      // Dot indicator
      colorDot: MyColor.color('slide2'),
      sizeDot: 13.0,
      // typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,

      // Tabs
      listCustomTabs: this.renderListCustomTabs(tabletMode),
      backgroundColorAllSlides: Colors.white,
      refFuncGoToTab: (refFunc) {
        this.goToTab = refFunc;
      },

      // Show or hide status bar
      shouldHideStatusBar: true,

      // On tab change completed
      onTabChangeCompleted: this.onTabChangeCompleted,
    );
  }
}

//------------------ Default config ------------------
//class IntroScreenState extends State<IntroScreen> {
//  List<Slide> slides = new List();
//
//  @override
//  void initState() {
//    super.initState();
//
//    slides.add(
//      new Slide(
//        title: "ERASER",
//        description: "Allow miles wound place the leave had. To sitting subject no improve studied limited",
//        pathImage: "images/photo_eraser.png",
//        backgroundColor: Color(0xfff5a623),
//      ),
//    );
//    slides.add(
//      new Slide(
//        title: "PENCIL",
//        description: "Ye indulgence unreserved connection alteration appearance",
//        pathImage: "images/photo_pencil.png",
//        backgroundColor: Color(0xff203152),
//      ),
//    );
//    slides.add(
//      new Slide(
//        title: "RULER",
//        description:
//        "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
//        pathImage: "images/photo_ruler.png",
//        backgroundColor: Color(0xff9932CC),
//      ),
//    );
//  }
//
//  void onDonePress() {
//    // Do what you want
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new IntroSlider(
//      slides: this.slides,
//      onDonePress: this.onDonePress,
//    );
//  }
//}
