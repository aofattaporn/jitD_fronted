// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:jitd_client/src/screens/HomePage.dart';
//
// import 'App.dart';
//
// /// Custom [BlocObserver] that observes all bloc and cubit state changes.
// class AppBlocObserver extends BlocObserver {
//   @override
//   void onChange(BlocBase bloc, Change change) {
//     super.onChange(bloc, change);
//     if (bloc is Cubit) {
//       print(change);
//     }
//   }
//
//   @override
//   void onTransition(Bloc bloc, Transition transition) {
//     super.onTransition(bloc, transition);
//     if (kDebugMode) {
//       print(transition);
//     }
//   }
// }
//
// Future<void> main() async {
//
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//
//   /// custom observer for check log on state
//   Bloc.observer = AppBlocObserver();
//   runApp(const App());
//  }
// import 'package:flutter/material.dart';
// import 'package:jitd_client/src/screens/Setting/Setting_about.dart';
// import 'package:jitd_client/src/screens/Setting/Setting_account.dart';
// import 'package:jitd_client/src/screens/Setting/Setting_admin.dart';
// import 'package:jitd_client/src/screens/Setting/Setting_change_password.dart';
// import 'package:jitd_client/src/screens/Setting/Setting_deleteaccount.dart';
// import 'package:jitd_client/src/screens/Setting/Setting_homepage.dart';
// import 'package:jitd_client/src/screens/Setting/Setting_logout.dart';
// import 'package:jitd_client/src/screens/Setting/Setting_notification.dart';
// import 'package:jitd_client/src/screens/Setting/Setting_overview.dart';
// import 'package:jitd_client/src/screens/Setting/Setting_setting.dart';
// import 'package:jitd_client/src/screens/Setting/Setting_user_data.dart';
// import 'package:jitd_client/src/screens/Setting/Setting_user_status.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: const Setting_setting(),
//     );
//   }
// }
