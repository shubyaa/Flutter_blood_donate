import 'package:animations/animations.dart';
import 'package:blood_donate/AppTheme/styles.dart';
import 'package:blood_donate/app_widgets.dart';
import 'package:blood_donate/auth.dart';
import 'package:blood_donate/home.dart';
import 'package:blood_donate/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:blood_donate/app_widgets.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;
  List<Widget> pageList = [
    const HomePage(),
    ProfilePage(),
    Login(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageTransitionSwitcher(
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
            FadeThroughTransition(
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        ),
        child: pageList[pageIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: ((value) {
          setState(() {
            pageIndex = value;
          });
        }),
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

        // onTap: ,
      ),
    );
  }
}
