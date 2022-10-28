import 'dart:collection';
import 'package:auto_route/auto_route.dart';
import 'package:blood_donate/AppTheme/styles.dart';
import 'package:blood_donate/app_functions.dart';
import 'package:blood_donate/main/page_router.gr.dart';
import 'package:flutter/material.dart';

int pageIndex = 0;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ListQueue<int> _navigationQueue = ListQueue();

  @override
  void initState() {
    checkPermission();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: AutoTabsScaffold(
        bottomNavigationBuilder: (context, tabsRouter) {
          return BottomNavigationBar(
            landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
            onTap: (value) {
              tabsRouter.setActiveIndex(value);
              bottomTapped(value);
            },
            enableFeedback: false,
            currentIndex: tabsRouter.activeIndex,
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
          );
        },
        routes: const [
          HomeRouter(),
          MapsRouter(),
          SettingsRouter(),
          ProfileRouter(),
        ],
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

  void bottomTapped(int value) {
    setState(() {
      _navigationQueue.addLast(pageIndex);
      pageIndex = value;
    });
  }
}
