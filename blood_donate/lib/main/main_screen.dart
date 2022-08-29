import 'package:animations/animations.dart';
import 'package:blood_donate/AppTheme/styles.dart';
import 'package:blood_donate/addPeople.dart';
import 'package:blood_donate/app_widgets.dart';
import 'package:blood_donate/auth.dart';
import 'package:blood_donate/home.dart';
import 'package:blood_donate/maps.dart';
import 'package:blood_donate/settings.dart';
import 'package:flutter/material.dart';
import 'package:blood_donate/app_widgets.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;

  // PageController pageController_ =
  //     new PageController(initialPage: 0, keepPage: true);

  List<Widget> pageList = [
    const HomePage(),
    MapsPage(),
    SettingsPage(),
    Login(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageTransitionSwitcher(
        duration: Duration(milliseconds: 500),
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
            FadeThroughTransition(
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        ),
        child: pageList[pageIndex],
      ),
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
    );
  }

  // void onPageChanged(int value) {
  //   setState(() {
  //     pageIndex = value;
  //   });
  // }

  void bottomTapped(int value) {
    setState(() {
      pageIndex = value;
    });
  }
}
