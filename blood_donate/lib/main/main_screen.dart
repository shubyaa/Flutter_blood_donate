import 'dart:collection';

import 'package:animations/animations.dart';
import 'package:blood_donate/AppTheme/styles.dart';
import 'package:blood_donate/addPeople.dart';
import 'package:blood_donate/app_widgets.dart';
import 'package:blood_donate/startPage.dart';
import 'package:blood_donate/home.dart';
import 'package:blood_donate/maps.dart';
import 'package:blood_donate/login.dart';
// import 'package:blood_donate/profile.dart';
import 'package:blood_donate/profile.dart';
import 'package:blood_donate/settings.dart';
import 'package:flutter/material.dart';
import 'package:blood_donate/app_widgets.dart';
import 'package:flutter/services.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;
  ListQueue<int> _navigationQueue = ListQueue();
  // PageController pageController_ =
  //     new PageController(initialPage: 0, keepPage: true);

  List<Widget> pageList = [
    const HomePage(),
    MapsPage(),
    SettingsPage(),
    // LoginPage(),
    ProfilePage(),
  ];

  //Page Transition Code
  // PageTransitionSwitcher(
  //         duration: Duration(milliseconds: 500),
  //         transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
  //             FadeThroughTransition(
  //           animation: primaryAnimation,
  //           secondaryAnimation: secondaryAnimation,
  //           child: child,
  //         ),
  //         child: pageList[pageIndex],
  //       ),

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        extendBody: true,
        body: IndexedStack(
            index: pageIndex,
            children:
                // getBody(pageIndex),
                pageList),
        bottomNavigationBar: BottomNavigationBar(
          landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
          onTap: bottomTapped,
          enableFeedback: false,
          currentIndex: pageIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 35,
          elevation: 0,
          unselectedItemColor: const Color.fromRGBO(18, 96, 86, 0.5),
          selectedItemColor: const Color.fromRGBO(18, 96, 86, 1),
          type: BottomNavigationBarType.fixed,
          backgroundColor: midGreen,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.my_location), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          ],
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    if (_navigationQueue.isEmpty) return true;

    setState(() {
      pageIndex = _navigationQueue.last;
      _navigationQueue.removeLast();
    });
    return false;
  }

  Widget getBody(int index) {
    switch (index) {
      case 0:
        return HomePage(); // Create this function, it should return your first page as a widget
      case 1:
        return MapsPage(); // Create this function, it should return your second page as a widget
      case 2:
        return SettingsPage(); // Create this function, it should return your third page as a widget
      case 3:
        return ProfilePage(); // Create this function, it should return your fourth page as a widget
      default:
        return HomePage();
    }
  }

  void bottomTapped(int value) {
    setState(() {
      _navigationQueue.addLast(pageIndex);
      pageIndex = value;
    });
  }
}
