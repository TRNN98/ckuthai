import 'dart:async';

import 'package:appbase/services/netword.dart';
import 'package:appbase/tabs.dart';
// import 'package:appbase/tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_lock_screen/flutter_lock_screen.dart';
import 'package:loading_gifs/loading_gifs.dart';
import 'package:local_auth/local_auth.dart';
import 'package:appbase/models/pinJson.dart';

import 'mainmenu.dart';
import 'models/shareJson.dart';

// import 'package:flutter_passcode_example/empty.dart';
// import 'package:local_auth/local_auth.dart';

class Param {
  String token;
  String name;
  String membership_no;
  Param(this.token, this.name, this.membership_no);
}

class Pins extends StatefulWidget {
  @override
  _PinsState createState() => _PinsState();
}

class _PinsState extends State<Pins> {
  bool isFingerprint = false;

  Future<Null> biometrics() async {
    final LocalAuthentication auth = new LocalAuthentication();
    bool authenticated = false;

    try {
      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: 'Scan your fingerprint to authenticate',
          useErrorDialogs: true,
          stickyAuth: false);
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
    if (authenticated) {
      setState(() {
        isFingerprint = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var myPass = [1, 2, 3, 4];
    return LockScreen(
      title: "This is Screet ",
      passLength: myPass.length,
      bgImage: "assets/imgs/bg.png",
      fingerPrintImage: "images/fingerprint.png",
      showFingerPass: true,
      fingerFunction: biometrics,
      numColor: Colors.blue,
      fingerVerify: isFingerprint,
      borderColor: Colors.white,
      showWrongPassDialog: true,
      wrongPassContent: "Wrong pass please try again.",
      wrongPassTitle: "Opps!",
      wrongPassCancelButtonText: "Cancel",
      passCodeVerify: (passcode) async {
        for (int i = 0; i < myPass.length; i++) {
          if (passcode[i] != myPass[i]) {
            return false;
          }
        }

        return true;
      },
      onSuccess: () {
        var param;
        var name;
        // Network.fetchpinlogin(
        //         '{"membership_no": "000866","mem_password":"123456"}')
        //     .then((value) => {
        //           name = value[0]['member']['PRENAME'] +
        //               value[0]['member']['MEMBER_NAME'] +
        //               ' ' +
        //               value[0]['member']['MEMBER_SURNAME'],
        //           param = Param(value[0]['token'], name,
        //               value[0]['member']['MEMBERSHIP_NO'].toString()),
        //           Navigator.of(context).pushReplacement(
        //             MaterialPageRoute(
        //               builder: (context) => Tabs(param),
        //             ),
        //           )
                  
        //         }
                
        //         );
      },
    );
  }
}
