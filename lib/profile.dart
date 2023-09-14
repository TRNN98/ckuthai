import 'dart:io';

import 'package:appbase/class/customUI.dart';
import 'package:appbase/class/language.dart';
import 'package:appbase/class/myclass.dart';
import 'package:appbase/class/mycolor.dart';
import 'package:appbase/class/sizes.dart';
import 'package:appbase/class/textstyle.dart';
import 'package:appbase/models/infoJson.dart';
import 'package:appbase/pins.dart';
import 'package:appbase/services/netword.dart';
import 'package:appbase/settings.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

// import 'dart:io';
import 'dart:convert';

class Profile extends StatefulWidget {
  String token;
  String name;
  String sex;
  String lgs;
  String membership_no;
  double fontsizeapps;

  Profile(
      {Key key,
      this.token,
      this.name,
      this.sex,
      this.lgs,
      this.membership_no,
      this.fontsizeapps})
      : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File _image;
  String _img;
  String _cremation = '';
  String base64Image;

  // String member = '';
  final picker = ImagePicker();

  // Future<String> _getCremation() {
  //   _cremation = '';
  //   Network.fetchCremation('{"mode": "1"}', widget.token, context)
  //       .then((value) => {
  //             value.forEach(
  //               (data) => {
  //                 _cremation = '\n' + _cremation + data['crem_name'] + '\n',
  //               },
  //             ),
  //           });
  //   setState(() {
  //     _cremation = _cremation;
  //   });
  // }

  startUpload() {
    String fileName = _image.path.split('/').last;
    upload(fileName);
  }

  Future upload(String fileName) async {
    final url = '${MyClass.hostApp()}/api/member/Nupload';
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8'
    };
    var data = '{"image": "' +
        base64Image +
        '", "name": "' +
        widget.membership_no +
        '"}';
    setState(() {});
    String jsons = json.encode(data);
    await http.post(url, headers: headers, body: json.decode(jsons));
  }

  Future getcamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    editimg(File(pickedFile.path));
  }

  Future getgallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    editimg(File(pickedFile.path));
  }

  Future editimg(img) async {
    File croppedFile = await ImageCropper.cropImage(
        sourcePath: File(img.path).path,
        maxHeight: 256,
        maxWidth: 256,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        ));
    if (croppedFile != null) {
      _image = File(croppedFile.path);
      _img = File(croppedFile.path).path;
      setState(() {
        base64Image = base64Encode(File(croppedFile.path).readAsBytesSync());
        showimg();
      });
    } else {
      _image = File(img.path);
      _img = File(img.path).path;
      setState(() {
        showimg();
        base64Image = base64Encode(File(img.path).readAsBytesSync());
      });
    }
  }

  var ObjInfo = '{"mode": "1"}';

  String imgprofile;

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
  void initState() {
    super.initState();
    // _getCremation();
  }

  @override
  Widget build(BuildContext context) {
    // _getCremation();
    bool tabletMode = MediaQuery.of(context).size.width > 600;
    imgprofile =
        '${MyClass.hostApp()}/member/profile/${widget.membership_no}.jpg';
    // if (widget.sex == 'M') {
    //   imgprofile =
    //       '${MyClass.hostApp()}/member/profile/${widget.membership_no}.jpg';
    // } else {
    //   imgprofile =
    //       '${MyClass.hostApp()}/member/profile/${widget.membership_no}.jpg';
    // }
    return Scaffold(
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: Stack(
          children: [
            // CustomTextStyle.headcolor(context, 100),
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
                        ? displayHeight(context) * 0.20
                        : displayHeight(context) * 0.20,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: headpadding(context, 30)),
                    child: Center(
                      child: Text(widget.name,
                          textScaleFactor:
                              MyClass.blocFontSizeApp(widget.fontsizeapps),
                          style: CustomTextStyle.subTitleTxt(context, 0)),
                    ),
                  ),
                  // lineSizedBox(context, -30),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: FutureBuilder<List<InfoModel>>(
                        future:
                            Network.fetchInfo(ObjInfo, widget.token, context),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return _detail(info: snapshot.data);
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
            CustomUI.appbarTxtTitleUi(Language.profileLg('profile', widget.lgs),
                widget.fontsizeapps, context),
            GestureDetector(
              onTap: () {
                showd();
              },
              child: Stack(
                children: [
                  CustomUI.appbarDetailUiPro1(imgprofile, context),
                  Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.only(
                        top: displayHeight(context) * 0.19,
                        left: displayWidth(context) * 0.15),
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.black,
                      size: displayHeight(context) * 0.05,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showd() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          int selectedRadio = numLanguage;
          return AlertDialog(
            content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RaisedButton(
                          color: Colors.brown[50],
                          child: Text(Language.profileLg('camera', widget.lgs),
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(widget.fontsizeapps),
                              style: CustomTextStyle.dataBoldTxt(context, -1)),
                          onPressed: () {
                            getcamera();
                            Navigator.of(context).pop(true);
                          },
                        ),
                        RaisedButton(
                          color: Colors.blue,
                          child: Text(Language.profileLg('gallery', widget.lgs),
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(widget.fontsizeapps),
                              style: CustomTextStyle.dataBoldTxt(context, -1)),
                          onPressed: () {
                            getgallery();
                            Navigator.of(context).pop(true);
                          },
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          );
        });
  }

  void showimg() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: _image == null
                          ? Text('No image selected.',
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(widget.fontsizeapps),
                              style: CustomTextStyle.dataBoldTxt(context, -1))
                          : CircleAvatar(
                              radius: 55,
                              backgroundColor: MyColor.color('imgprofile'),
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage: AssetImage(_img),
                                // child: Image.file(_image),
                              ),
                            ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RaisedButton(
                          color: Colors.red,
                          child: Text(Language.profileLg('cancel', widget.lgs),
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(widget.fontsizeapps),
                              style: CustomTextStyle.dataBoldTxt(context, -1)),
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                        ),
                        RaisedButton(
                          color: Colors.blue,
                          child: Text(Language.profileLg('upload', widget.lgs),
                              textScaleFactor:
                                  MyClass.blocFontSizeApp(widget.fontsizeapps),
                              style: CustomTextStyle.dataBoldTxt(context, -1)),
                          onPressed: () {
                            setState(() {
                              startUpload();
                            });
                            // refresh() {
                            //   setState(() {
                            //     startUpload();
                            //   });
                            // }
                            // startUpload();
                            Navigator.of(context).pop(true);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Pins(gettitle: 'pinCode'),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          );
        });
  }

  Widget _detail({List info}) => ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: MyColor.color('linelist'),
        ),
        itemCount: info.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(
                        color: MyColor.color('imgprofile'), width: 4))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                Language.profileLg('member', widget.lgs),
                                textScaleFactor: MyClass.blocFontSizeApp(
                                    widget.fontsizeapps),
                                style: CustomTextStyle.defaultTxt(context, 0),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                MyClass.checkNull(
                                    info[index].membershipNo.toString()),
                                textScaleFactor: MyClass.blocFontSizeApp(
                                    widget.fontsizeapps),
                                style: CustomTextStyle.defaultTxt(context, 0),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                Language.profileLg('idCard', widget.lgs),
                                textScaleFactor: MyClass.blocFontSizeApp(
                                    widget.fontsizeapps),
                                style: CustomTextStyle.defaultTxt(context, 0),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                MyClass.formatIdCard(
                                    info[index].idCard.toString()),
                                textScaleFactor: MyClass.blocFontSizeApp(
                                    widget.fontsizeapps),
                                style: CustomTextStyle.defaultTxt(context, 0),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                Language.profileLg('birthday', widget.lgs),
                                textScaleFactor: MyClass.blocFontSizeApp(
                                    widget.fontsizeapps),
                                style: CustomTextStyle.defaultTxt(context, 0),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                MyClass.checkNull(
                                        info[index].dateOfBirth.toString()) +
                                    '(' +
                                    MyClass.checkNull(
                                        info[index].ageOfBirth.toString()) +
                                    ')',
                                textScaleFactor: MyClass.blocFontSizeApp(
                                    widget.fontsizeapps),
                                style: CustomTextStyle.defaultTxt(context, 0),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                Language.profileLg(
                                    'dateOfMembership', widget.lgs),
                                textScaleFactor: MyClass.blocFontSizeApp(
                                    widget.fontsizeapps),
                                style: CustomTextStyle.defaultTxt(context, 0),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                MyClass.checkNull(
                                        info[index].dateOfApprove.toString()) +
                                    '(' +
                                    MyClass.checkNull(
                                        info[index].ageOfApprove.toString()) +
                                    ')',
                                textScaleFactor: MyClass.blocFontSizeApp(
                                    widget.fontsizeapps),
                                style: CustomTextStyle.defaultTxt(context, 0),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                Language.profileLg('phone', widget.lgs),
                                textScaleFactor:MyClass.blocFontSizeApp(widget.fontsizeapps) ,style:  CustomTextStyle.defaultTxt(context, 0),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                           MyClass.formatNumberPhoneS(MyClass.checkNull(
                               info[index].phoneNo.toString())     ),
                                textScaleFactor:MyClass.blocFontSizeApp(widget.fontsizeapps) ,style:  CustomTextStyle.defaultTxt(context, 0),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                Language.profileLg('department', widget.lgs),
                                textScaleFactor: MyClass.blocFontSizeApp(
                                    widget.fontsizeapps),
                                style: CustomTextStyle.defaultTxt(context, 0),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                MyClass.checkNull(
                                    info[index].memberGroupName.toString()),
                                textScaleFactor: MyClass.blocFontSizeApp(
                                    widget.fontsizeapps),
                                style: CustomTextStyle.defaultTxt(context, 0),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                Language.profileLg('address', widget.lgs),
                                textScaleFactor: MyClass.blocFontSizeApp(
                                    widget.fontsizeapps),
                                style: CustomTextStyle.defaultTxt(context, 0),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                MyClass.checkNull(
                                    info[index].address.toString()),
                                textScaleFactor: MyClass.blocFontSizeApp(
                                    widget.fontsizeapps),
                                style: CustomTextStyle.defaultTxt(context, 0),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
}
