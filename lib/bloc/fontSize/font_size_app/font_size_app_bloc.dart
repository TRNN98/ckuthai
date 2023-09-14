// import 'dart:async';
// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// part 'font_size_app_event.dart';

// part 'font_size_app_state.dart';

// const pref_fontsize = 'fontsize';


// class FontSizeAppBloc extends Bloc<FontSizeAppEvent, FontSizeAppState> {
//   FontSizeAppBloc(FontSizeAppState initialState)
//       : super(InitialFontSizeAppState());

//   // @override
//   // FontSizeAppState get initialState => InitialFontSizeAppState();

//   @override
//   Stream<FontSizeAppState> mapEventToState(FontSizeAppEvent event) async* {
//     if (event is LoadFontSizeApp) {
//       yield* _mapLoadFontSizeAppToState();
//       // yield 1.4;
//     }
//   }


//       Stream<FontSizeAppState> _mapLoadFontSizeAppToState() async* {
//     try {
//       // yield LoadingFontSizeAppState();
//       SharedPreferences preferences = await SharedPreferences.getInstance();
//       double fontsizes = preferences.getDouble(pref_fontsize) ?? 1.1;
//       // await Future.delayed(Duration(seconds: 2));
//       yield LoadedFontSizeAppState(fontsizes);
//     } catch (ex) {
//       yield ErrorFontSizeAppState(ex.toString());
//     }
//   }
// }
