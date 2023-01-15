import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jitd_client/src/blocs/authentication/authen_bloc.dart';
import 'package:jitd_client/src/constant.dart';
import 'package:jitd_client/src/screens/CreatePost_page.dart';

import 'package:jitd_client/src/screens/HomePage.dart';
import 'package:jitd_client/src/screens/NotificationPage.dart';
import 'package:jitd_client/src/screens/ProfilePage.dart';
import 'package:jitd_client/src/screens/SearchPage.dart';
import 'package:jitd_client/src/screens/TestApiPage.dart';
import 'package:jitd_client/src/screens/post/CreatePost.dart';

import 'blocs/authentication/authen_state.dart';
import 'blocs/counter/counter_event.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  // late final TestRepository _testerRepository;
  int currentTab = 0;
  final List<Widget> screens = const [
    HomePage(),
    TestApiPage(),
    NotificationPage(),
    ProfilePage(),
    SearchPage(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomePage();

  @override
  Widget build(BuildContext context) {
    /// injection covidBloc

    return Scaffold(
      /// body
      body: Center(
        child: MultiBlocProvider(
            providers: [
              BlocProvider<CounterBloc2>(create: (_) => CounterBloc2()),
              BlocProvider<AuthenticationBloc>(
                  create: (_) => AuthenticationBloc())
            ],
            child: BlocListener<AuthenticationBloc, AuthenticationState>(
                listener: (BuildContext context, state) {
                  if (state is SignOutSuccess) {
                    Navigator.pop(context);
                  }
                },
                child: PageStorage(
                  bucket: bucket,
                  child: currentScreen,
                ))),
      ),

      /// FAB
      floatingActionButton: FloatingActionButton(
          heroTag: "button1",
          backgroundColor: thirterydColor,
          onPressed: () => Navigator.of(context).push(_createRoute()),
          child: const Icon(Icons.add, size: 40)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      /// Bottom navigation Bar
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Button_Page(0, Icons.home),
                  Button_Page(1, Icons.search),
                ],
              ),
              Row(
                children: [
                  Button_Page(2, Icons.notifications),
                  Button_Page(3, Icons.person),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  MaterialButton Button_Page(int indexSceeen, IconData xicon) {
    return MaterialButton(
        onPressed: () {
          setState(() {
            currentScreen = screens[indexSceeen];
            currentTab = indexSceeen;
          });
        },
        child: Icon(xicon,
            color: currentTab == indexSceeen ? primaryColor : textColor2,
            size: 24));
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const CreatePost(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
