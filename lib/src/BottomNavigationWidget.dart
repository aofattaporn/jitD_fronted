import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jitd_client/src/blocs/authentication/authen_bloc.dart';
import 'package:jitd_client/src/blocs/post/post_state.dart';
import 'package:jitd_client/src/constant.dart';
import 'package:jitd_client/src/screens/HomePage.dart';
import 'package:jitd_client/src/screens/NotificationPage.dart';
import 'package:jitd_client/src/screens/Search/Search.dart';
import 'package:jitd_client/src/screens/SearchPage.dart';
import 'package:jitd_client/src/screens/autheentication/SignIn.dart';
import 'package:jitd_client/src/screens/post/CreatePost.dart';
import 'package:jitd_client/src/screens/profile/ProfilePage.dart';
import 'package:jitd_client/src/ui/DialogMessage.dart';

import 'blocs/authentication/authen_state.dart';
import 'blocs/post/post_bloc.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  // late final TestRepository _testerRepository;
  final PostBloc postBloc = PostBloc();
  int currentTab = 0;
  final List<Widget> screens = [
    HomePage(),
    Search(),
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
          BlocProvider<AuthenticationBloc>(create: (_) => AuthenticationBloc()),
          BlocProvider<PostBloc>(create: (_) => PostBloc())
        ],
        child: MultiBlocListener(
            listeners: [
              BlocListener<AuthenticationBloc, AuthenticationState>(
                  listener: (BuildContext context, state) {
                if (state is SignOutSuccess) {
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) => const SignIn()),
                      (r) {
                    return false;
                  });
                }
              }),
              BlocListener<PostBloc, PostState>(
                  listener: (BuildContext context, state) {
                if (state is PostSuccess) {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      // user must tap button!
                      builder: (context) {
                        return const DialogMessage(
                            title: "create data success", desc: "");
                        // return DialogMessage(messag: message);
                      });
                }
              })
            ],
            child: PageStorage(
              bucket: bucket,
              child: currentScreen,
            )),
      )),

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
          height: MediaQuery.of(context).size.height * 0.075,
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

  MaterialButton Button_Page(int indexScreen, IconData xIcon) {
    return MaterialButton(
        onPressed: () {
          setState(() {
            currentScreen = screens[indexScreen];
            currentTab = indexScreen;
          });
        },
        child: Icon(xIcon,
            color: currentTab == indexScreen ? primaryColor : textColor2,
            size: 24));
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          BlocProvider<PostBloc>(
              create: (BuildContext context) => PostBloc(),
              child: const CreatePost()),
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
