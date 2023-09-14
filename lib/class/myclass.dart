import 'dart:convert';
import 'dart:io' show Platform;

import 'package:appbase/bloc/fontSize/font_size_app/font_size_app_bloc.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:loading_gifs/loading_gifs.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class MyClass {
  static checkNull(data) {
    return data.toString() == null ? '' : data.toString();
  }

  static FormatNumber(data) {
    double x = double.parse(data.replaceAll(',', '').toString()) % 1;
    return x > 0
        ? NumberFormat.currency(locale: 'th', symbol: '').format(double.parse(
            data.replaceAll(',', '').toString() == null
                ? ''
                : data.replaceAll(',', '').toString()))
        : NumberFormat.currency(locale: 'th', symbol: '', decimalDigits: 0)
            .format(double.parse(data.replaceAll(',', '').toString() == null
                ? ''
                : data.replaceAll(',', '').toString()));
  }

  static company(data) {
    var th = 'สหกรณ์ออมทรัพย์ครูอุทัยธานี จำกัด';
    var en = 'Uthaihani Teacher Savings Cooperative Limited';
    if (data == 'th') {
      return th;
    } else if (data == 'en') {
      return en;
    }
  }

  static showToast(msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 3);
  }

  static onLoading() {
    Image.asset(cupertinoActivityIndicator, scale: 2);
  }

  static json(s) {
    return jsonDecode(jsonEncode(s));
  }

  static genmember(s) {
    var number = 5 - s.toString().length;
    for (int i = 0; i < number; i++) {
      s = '0' + s;
    }
    return s;
  }

  static lengthmember() {
    return 5;
  }

  static monthItoS(s) {
    var monthLong =
        '[[มกราคม],[กุมภาพันธ์],[มีนาคม],[เมษายน],[พฤษภาคม],[มิถุนายน],[กรกฎาคม],[สิงหาคม],[กันยายน],[ตุลาคม],[พฤศจิกายน],[ธันวาคม]}]';

    final regExp = new RegExp(r'(?:\[)?(\[[^\]]*?\](?:,?))(?:\])?');
    final input = monthLong;
    final result = regExp
        .allMatches(input)
        .map((m) => m.group(1))
        .map((String item) => item.replaceAll(new RegExp(r'[\[\],]'), ''))
        .map((m) => m)
        .toList();
    // print(result[index-1].toString());
    return result[s].toString();
  }

  static formatDate(s) {
    String d = s.split('/')[0].toString();
    String m = s.split('/')[1].toString();
    String y = s.split('/')[2].toString();
    if (s.split('/')[0].toString().length < 2) {
      d = '0' + s.split('/')[0].toString();
    }
    if (s.split('/')[1].toString().length < 2) {
      m = '0' + s.split('/')[1].toString();
    }
    return y + '-' + m + '-' + d;
  }

  static formatDateC(s) {
    String d = s.split('-')[2].toString();
    String m = s.split('-')[1].toString();
    String y = (int.parse(s.split('-')[0]) - 543).toString();
    return y + '-' + m + '-' + d;
  }

  static formatIdCard(data) {
    var id = '';
    for (var i = 0; i < 13; i++) {
      if (i == 1) {
        id += '-' + data.split('')[i].toString();
      } else if (i == 5) {
        id += '-' + data.split('')[i].toString();
      } else if (i == 10) {
        id += '-' + data.split('')[i].toString();
      } else if (i == 12) {
        id += '-' + data.split('')[i].toString();
      } else {
        id += data.split('')[i].toString();
      }
    }
    return data.toString() == null ? '' : id.toString();
  }

  static formatIdCardX(data) {
    var id = '';
    for (var i = 0; i < 13; i++) {
      if (i == 1) {
        id += '-' + data.split('')[i].toString();
      } else if (i == 5) {
        id += '-' + data.split('')[i].toString();
      } else if (i == 10) {
        id += '-' + 'x';
      } else if (i == 11 || i == 9 || i == 8) {
        id += 'x';
      } else if (i == 12) {
        id += '-' + 'x';
      } else {
        id += data.split('')[i].toString();
      }
    }
    return data.toString() == null ? '' : id.toString();
  }

  static versionApp() {
    String ios = '2.02';
    String android = '2.02';
    if (Platform.isIOS) {
      // print(ios.toStringAsPrecision(2));
      return ios;
    } else if (Platform.isAndroid) {
      return android;
    }
  }

  static hostApp() {
    return "https://www.ckuthai.org";
  }

  static formatNumberPhoneI(phoneNumberString) {
    return phoneNumberString.toString().replaceAll('-', '').replaceAll(',', '');
  }

  static formatNumberPhoneS(phoneNumberString) {
    var n = '';
    if (phoneNumberString.toString().length == 9) {
      for (var i = 0; i < 9; i++) {
        if (i == 1) {
          n += '-' + phoneNumberString.split('')[i].toString();
        } else if (i == 5) {
          n += '-' + phoneNumberString.split('')[i].toString();
        } else {
          n += phoneNumberString.split('')[i].toString();
        }
      }
    } else if (phoneNumberString.toString().length == 10) {
      for (var i = 0; i < 10; i++) {
        if (i == 3) {
          n += '-' + phoneNumberString.split('')[i].toString();
        } else if (i == 6) {
          n += '-' + phoneNumberString.split('')[i].toString();
        } else {
          n += phoneNumberString.split('')[i].toString();
        }
      }
    } else {
      n = '';
    }

    return n.toString() == null ? '' : n.toString();
  }

  static formatNumberPhoneX(phoneNumberString) {
    var x =
        phoneNumberString.toString().replaceAll('-', '').replaceAll(',', '');
    var n = '';
    if (x.toString().length == 10) {
      for (var i = 0; i < 10; i++) {
        if (i == 2) {
          n += 'x';
        } else if (i == 3) {
          n += '-' + 'x';
        } else if (i == 4 || i == 5) {
          n += 'x';
        } else if (i == 6) {
          n += '-' + phoneNumberString.split('')[i].toString();
        } else {
          n += phoneNumberString.split('')[i].toString();
        }
      }
    } else {
      n = 'รูปแบบแบอร์ผิด';
    }

    return n.toString() == null ? '' : n.toString();
  }

  static loading() {
    return SpinKitWanderingCubes(
      color: Colors.black,
      // size: 50.0,
    );
  }

  static fontSizeApp() {
    // const pref_fontsize = 'fontsize';

    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // var fontsizes = preferences.getDouble(pref_fontsize) ?? 1.0;
    // return fontsizes;
    // // SharedPreferences prefs = await SharedPreferences.getInstance();
    // // double counter = (prefs.getDouble('size') ?? 0) + 1;
    // // print('Pressed $counter times.');

    // // ((_value * 1.5) / 100) + 0.5
    return 1.0;
  }

  static blocFontSizeApp(n) {
    // FontSizeAppBloc _fontSizeAppBloc =
    //     BlocProvider.of<FontSizeAppBloc>(context);

    // BlocBuilder(
    //     cubit: _fontSizeAppBloc,
    //     builder: (context, state) {
    //       if (state is LoadedFontSizeAppState) {
    //         print(state.fontsize);
    //         // return state.fontsize;
    //       }
    //     });

    return n;
  }

  // static getFontsharedPref() async {
  //   const pref_fontsize = 'fontsize';

  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   double fontsizes = preferences.getDouble(pref_fontsize) ?? 0.9;
  //   return fontsizes;
  // }
}
