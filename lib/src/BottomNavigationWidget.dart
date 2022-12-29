import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jitd_client/src/screens/CreatePost_page.dart';
import 'package:jitd_client/src/screens/Home_page.dart';
import 'package:jitd_client/src/screens/Notification_page.dart';
import 'package:jitd_client/src/screens/Profile_page.dart';
import 'package:jitd_client/src/screens/Search_page.dart';
import 'package:jitd_client/src/screens/TestApi_page.dart';


import 'blocs/counter/counter_event.dart';
import 'constant/Constant_Color.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  // late final TestRepository _testerRepository;
  int currentTab = 0;
  final List<Widget> screens = const [
    Home_page(),
    TestApi_page(),
    Notification_page(),
    Profile_page(),
    Search_page(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Home_page();

  @override
  Widget build(BuildContext context) {
    /// injection covidBloc

    return Scaffold(
      /// body
      body: Center(
        child: MultiBlocProvider(
          providers: [BlocProvider(create: (_) => CounterBloc2())],
          child: PageStorage(
            bucket: bucket,
            child: currentScreen,
          ),
        ),
      ),

      /// FAB
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, size: 40),
        backgroundColor: kThirtery,
        onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => const CreatePost_page())),
      ),
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
            color: currentTab == indexSceeen ? kPrimaryColor : kTextColor,
            size: 24));
  }

  Route _createRoute() {
    print("on click");

    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const TestApi_page(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

}
