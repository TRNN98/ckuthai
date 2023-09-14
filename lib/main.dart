import 'package:appbase/bloc/fontSize/flow_bloc_delegate.dart';
import 'package:appbase/bloc/fontSize/font_size_app/font_size_app_bloc.dart';
import 'package:appbase/pins.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:flutter/services.dart';

// void main() => runApp(MyApp());
void main() {
  // Bloc.observer = FlowBlocDelegate();

  return runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  final _route = <String, WidgetBuilder>{
    // '/login': (BuildContext context) => Login(),
    // '/tutorial': (BuildContext context) => IntroScreen(),
  };

  // Future<void> _oneSignal() async {
  //   OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  //   OneSignal.shared.init("85f840dc-0358-448f-bb21-702519c56343", iOSSettings: {
  //     OSiOSSettings.autoPrompt: false,
  //     OSiOSSettings.inAppLaunchUrl: false
  //   });
  //   OneSignal.shared
  //       .setInFocusDisplayType(OSNotificationDisplayType.notification);
  //   await OneSignal.shared
  //       .promptUserForPushNotificationPermission(fallbackToSettings: true);
  // }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    // _oneSignal();
    // return BlocProvider(
    //   create: (_)  => FontSizeAppBloc(InitialFontSizeAppState()),
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     localizationsDelegates: [
    //       GlobalMaterialLocalizations.delegate,
    //       GlobalWidgetsLocalizations.delegate,
    //       GlobalCupertinoLocalizations.delegate,
    //     ],
    //     locale: Locale('th', 'TH'),
    //     supportedLocales: [
    //       const Locale('en', 'US'), // English
    //       const Locale('th', 'TH'), // Thai
    //     ],
    //     title: 'PKB App Base',
    //     home: Pins(),
    //     // home: Text('data'),
    //     // routes: _route,
    //   ),
    // );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Locale('th', 'TH'),
      supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('th', 'TH'), // Thai
      ],
      title: 'PKB App Base',
      home: Pins(),
      // home: Text('data'),
      // routes: _route,
      // ),
    );
  }
}
