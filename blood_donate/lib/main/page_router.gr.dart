// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:auto_route/empty_router_widgets.dart' as _i2;
import 'package:flutter/cupertino.dart' as _i12;
import 'package:flutter/material.dart' as _i11;

import '../addPeople.dart' as _i4;
import '../home.dart' as _i3;
import '../maps.dart' as _i6;
import '../personal_details.dart' as _i5;
import '../profile.dart' as _i8;
import '../settings.dart' as _i7;
import '../subpages/myHistory.dart' as _i9;
import 'sign_in.dart' as _i1;

class AppRouter extends _i10.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    SignInRoute.name: (routeData) {
      final args = routeData.argsAs<SignInRouteArgs>(
          orElse: () => const SignInRouteArgs());
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.SignInPage(key: args.key),
      );
    },
    HomeRouter.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    MapsRouter.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    SettingsRouter.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    ProfileRouter.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    HomePageRouter.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    AddPeopleRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.AddPeople(),
      );
    },
    PersonalDetailsRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.PersonalDetails(),
      );
    },
    MapsRoute.name: (routeData) {
      final args =
          routeData.argsAs<MapsRouteArgs>(orElse: () => const MapsRouteArgs());
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.MapsPage(key: args.key),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.SettingsPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.ProfilePage(),
      );
    },
    MyHistoryRoute.name: (routeData) {
      final args = routeData.argsAs<MyHistoryRouteArgs>(
          orElse: () => const MyHistoryRouteArgs());
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.myHistoryPage(key: args.key),
      );
    },
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(
          SignInRoute.name,
          path: '/',
          children: [
            _i10.RouteConfig(
              HomeRouter.name,
              path: 'home',
              parent: SignInRoute.name,
              children: [
                _i10.RouteConfig(
                  HomePageRouter.name,
                  path: '',
                  parent: HomeRouter.name,
                ),
                _i10.RouteConfig(
                  AddPeopleRoute.name,
                  path: 'people',
                  parent: HomeRouter.name,
                  children: [
                    _i10.RouteConfig(
                      PersonalDetailsRoute.name,
                      path: 'personal',
                      parent: AddPeopleRoute.name,
                    )
                  ],
                ),
              ],
            ),
            _i10.RouteConfig(
              MapsRouter.name,
              path: 'maps',
              parent: SignInRoute.name,
              children: [
                _i10.RouteConfig(
                  MapsRoute.name,
                  path: '',
                  parent: MapsRouter.name,
                )
              ],
            ),
            _i10.RouteConfig(
              SettingsRouter.name,
              path: 'settings',
              parent: SignInRoute.name,
              children: [
                _i10.RouteConfig(
                  SettingsRoute.name,
                  path: '',
                  parent: SettingsRouter.name,
                ),
                _i10.RouteConfig(
                  PersonalDetailsRoute.name,
                  path: 'personal',
                  parent: SettingsRouter.name,
                ),
                _i10.RouteConfig(
                  ProfileRouter.name,
                  path: 'profile',
                  parent: SettingsRouter.name,
                  children: [
                    _i10.RouteConfig(
                      ProfileRoute.name,
                      path: '',
                      parent: ProfileRouter.name,
                    ),
                    _i10.RouteConfig(
                      MyHistoryRoute.name,
                      path: 'history',
                      parent: ProfileRouter.name,
                    ),
                    _i10.RouteConfig(
                      PersonalDetailsRoute.name,
                      path: 'personal',
                      parent: ProfileRouter.name,
                    ),
                    _i10.RouteConfig(
                      AddPeopleRoute.name,
                      path: 'people',
                      parent: ProfileRouter.name,
                      children: [
                        _i10.RouteConfig(
                          PersonalDetailsRoute.name,
                          path: 'personal',
                          parent: AddPeopleRoute.name,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            _i10.RouteConfig(
              ProfileRouter.name,
              path: 'profile',
              parent: SignInRoute.name,
              children: [
                _i10.RouteConfig(
                  ProfileRoute.name,
                  path: '',
                  parent: ProfileRouter.name,
                ),
                _i10.RouteConfig(
                  MyHistoryRoute.name,
                  path: 'history',
                  parent: ProfileRouter.name,
                ),
                _i10.RouteConfig(
                  PersonalDetailsRoute.name,
                  path: 'personal',
                  parent: ProfileRouter.name,
                ),
                _i10.RouteConfig(
                  AddPeopleRoute.name,
                  path: 'people',
                  parent: ProfileRouter.name,
                  children: [
                    _i10.RouteConfig(
                      PersonalDetailsRoute.name,
                      path: 'personal',
                      parent: AddPeopleRoute.name,
                    )
                  ],
                ),
              ],
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.SignInPage]
class SignInRoute extends _i10.PageRouteInfo<SignInRouteArgs> {
  SignInRoute({
    _i12.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          SignInRoute.name,
          path: '/',
          args: SignInRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignInRoute';
}

class SignInRouteArgs {
  const SignInRouteArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'SignInRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.EmptyRouterPage]
class HomeRouter extends _i10.PageRouteInfo<void> {
  const HomeRouter({List<_i10.PageRouteInfo>? children})
      : super(
          HomeRouter.name,
          path: 'home',
          initialChildren: children,
        );

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class MapsRouter extends _i10.PageRouteInfo<void> {
  const MapsRouter({List<_i10.PageRouteInfo>? children})
      : super(
          MapsRouter.name,
          path: 'maps',
          initialChildren: children,
        );

  static const String name = 'MapsRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class SettingsRouter extends _i10.PageRouteInfo<void> {
  const SettingsRouter({List<_i10.PageRouteInfo>? children})
      : super(
          SettingsRouter.name,
          path: 'settings',
          initialChildren: children,
        );

  static const String name = 'SettingsRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class ProfileRouter extends _i10.PageRouteInfo<void> {
  const ProfileRouter({List<_i10.PageRouteInfo>? children})
      : super(
          ProfileRouter.name,
          path: 'profile',
          initialChildren: children,
        );

  static const String name = 'ProfileRouter';
}

/// generated route for
/// [_i3.HomePage]
class HomePageRouter extends _i10.PageRouteInfo<void> {
  const HomePageRouter()
      : super(
          HomePageRouter.name,
          path: '',
        );

  static const String name = 'HomePageRouter';
}

/// generated route for
/// [_i4.AddPeople]
class AddPeopleRoute extends _i10.PageRouteInfo<void> {
  const AddPeopleRoute({List<_i10.PageRouteInfo>? children})
      : super(
          AddPeopleRoute.name,
          path: 'people',
          initialChildren: children,
        );

  static const String name = 'AddPeopleRoute';
}

/// generated route for
/// [_i5.PersonalDetails]
class PersonalDetailsRoute extends _i10.PageRouteInfo<void> {
  const PersonalDetailsRoute()
      : super(
          PersonalDetailsRoute.name,
          path: 'personal',
        );

  static const String name = 'PersonalDetailsRoute';
}

/// generated route for
/// [_i6.MapsPage]
class MapsRoute extends _i10.PageRouteInfo<MapsRouteArgs> {
  MapsRoute({_i12.Key? key})
      : super(
          MapsRoute.name,
          path: '',
          args: MapsRouteArgs(key: key),
        );

  static const String name = 'MapsRoute';
}

class MapsRouteArgs {
  const MapsRouteArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'MapsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.SettingsPage]
class SettingsRoute extends _i10.PageRouteInfo<void> {
  const SettingsRoute()
      : super(
          SettingsRoute.name,
          path: '',
        );

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i8.ProfilePage]
class ProfileRoute extends _i10.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i9.myHistoryPage]
class MyHistoryRoute extends _i10.PageRouteInfo<MyHistoryRouteArgs> {
  MyHistoryRoute({_i12.Key? key})
      : super(
          MyHistoryRoute.name,
          path: 'history',
          args: MyHistoryRouteArgs(key: key),
        );

  static const String name = 'MyHistoryRoute';
}

class MyHistoryRouteArgs {
  const MyHistoryRouteArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'MyHistoryRouteArgs{key: $key}';
  }
}
