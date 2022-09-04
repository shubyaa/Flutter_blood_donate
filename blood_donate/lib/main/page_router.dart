import 'package:auto_route/auto_route.dart';
import 'package:blood_donate/addPeople.dart';
import 'package:blood_donate/home.dart';
import 'package:blood_donate/main/main_screen.dart';
import 'package:blood_donate/maps.dart';
import 'package:blood_donate/profile.dart';
import 'package:blood_donate/settings.dart';
import 'package:blood_donate/subpages/myHistory.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: MainScreen,
      children: [
        AutoRoute(
          path: 'home',
          name: 'HomeRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: HomePage,
            ),
            AutoRoute(
              path: 'people',
              name: 'AddPeopleRoute',
              page: AddPeople,
            ),
          ],
        ),
        AutoRoute(
          path: 'maps',
          name: 'MapsRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: MapsPage),
          ],
        ),
        AutoRoute(
          path: 'settings',
          name: 'SettingsRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: SettingsPage),
          ],
        ),
        AutoRoute(
          path: 'profile',
          name: 'ProfileRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: ProfilePage),
            AutoRoute(
              path: 'history',
              name: 'MyHistoryRoute',
              page: myHistoryPage,
            ),
          ],
        ),
      ],
    ),
  ],
)
class $AppRouter {}
