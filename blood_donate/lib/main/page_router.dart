import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:blood_donate/addPeople.dart';
import 'package:blood_donate/home.dart';
import 'package:blood_donate/login.dart';
import 'package:blood_donate/main/main_screen.dart';
import 'package:blood_donate/main/sign_in.dart';
import 'package:blood_donate/maps.dart';
import 'package:blood_donate/personal_details.dart';
import 'package:blood_donate/profile.dart';
import 'package:blood_donate/settings.dart';
import 'package:blood_donate/subpages/myHistory.dart';

// ***************************************************************

// flutter pub run build_runner build --delete-conflicting-outputs

// ***************************************************************

// Run this command after making changes in this code.

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      initial: true,
      path: '/',
      page: LoginPage,
      children: [
        AutoRoute(
          path: 'home',
          name: 'HomeRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: HomePage,
              name: 'HomePageRouter',
            ),
            AutoRoute(
              path: 'people',
              name: 'AddPeopleRoute',
              page: AddPeople,
              children: [
                AutoRoute(
                  path: 'personal',
                  name: 'PersonalDetailsRoute',
                  page: PersonalDetails,
                ),
              ],
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
            AutoRoute(
              path: 'personal',
              name: 'PersonalDetailsRoute',
              page: PersonalDetails,
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
                AutoRoute(
                  path: 'personal',
                  name: 'PersonalDetailsRoute',
                  page: PersonalDetails,
                ),
                AutoRoute(
                  path: 'people',
                  name: 'AddPeopleRoute',
                  page: AddPeople,
                  children: [
                    AutoRoute(
                      path: 'personal',
                      name: 'PersonalDetailsRoute',
                      page: PersonalDetails,
                    ),
                  ],
                ),
              ],
            ),
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
            AutoRoute(
              path: 'personal',
              name: 'PersonalDetailsRoute',
              page: PersonalDetails,
            ),
            AutoRoute(
              path: 'people',
              name: 'AddPeopleRoute',
              page: AddPeople,
              children: [
                AutoRoute(
                  path: 'personal',
                  name: 'PersonalDetailsRoute',
                  page: PersonalDetails,
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
)
class $AppRouter {}
