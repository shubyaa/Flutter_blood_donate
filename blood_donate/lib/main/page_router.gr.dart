// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../addPeople.dart' as _i5;
import '../home.dart' as _i4;
import '../maps.dart' as _i7;
import '../personal_details.dart' as _i6;
import '../profile.dart' as _i9;
import '../settings.dart' as _i8;
import '../subpages/myHistory.dart' as _i10;
import 'main_screen.dart' as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    MainScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.MainScreen();
        }),
    HomeRouter.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i1.EmptyRouterPage();
        }),
    MapsRouter.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i1.EmptyRouterPage();
        }),
    SettingsRouter.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i1.EmptyRouterPage();
        }),
    ProfileRouter.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i1.EmptyRouterPage();
        }),
    HomePageRouter.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.HomePage();
        }),
    AddPeopleRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i5.AddPeople();
        }),
    PersonalDetailsRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i6.PersonalDetails();
        }),
    MapsRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args =
              data.argsAs<MapsRouteArgs>(orElse: () => const MapsRouteArgs());
          return _i7.MapsPage(key: args.key);
        }),
    SettingsRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i8.SettingsPage();
        }),
    ProfileRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i9.ProfilePage();
        }),
    MyHistoryRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<MyHistoryRouteArgs>(
              orElse: () => const MyHistoryRouteArgs());
          return _i10.myHistoryPage(key: args.key);
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(MainScreen.name, path: '/', children: [
          _i1.RouteConfig(HomeRouter.name, path: 'home', children: [
            _i1.RouteConfig(HomePageRouter.name, path: ''),
            _i1.RouteConfig(AddPeopleRoute.name, path: 'people', children: [
              _i1.RouteConfig(PersonalDetailsRoute.name, path: 'personal')
            ])
          ]),
          _i1.RouteConfig(MapsRouter.name,
              path: 'maps',
              children: [_i1.RouteConfig(MapsRoute.name, path: '')]),
          _i1.RouteConfig(SettingsRouter.name, path: 'settings', children: [
            _i1.RouteConfig(SettingsRoute.name, path: ''),
            _i1.RouteConfig(PersonalDetailsRoute.name, path: 'personal'),
            _i1.RouteConfig(ProfileRouter.name, path: 'profile', children: [
              _i1.RouteConfig(ProfileRoute.name, path: ''),
              _i1.RouteConfig(MyHistoryRoute.name, path: 'history'),
              _i1.RouteConfig(PersonalDetailsRoute.name, path: 'personal'),
              _i1.RouteConfig(AddPeopleRoute.name, path: 'people', children: [
                _i1.RouteConfig(PersonalDetailsRoute.name, path: 'personal')
              ])
            ])
          ]),
          _i1.RouteConfig(ProfileRouter.name, path: 'profile', children: [
            _i1.RouteConfig(ProfileRoute.name, path: ''),
            _i1.RouteConfig(MyHistoryRoute.name, path: 'history'),
            _i1.RouteConfig(PersonalDetailsRoute.name, path: 'personal'),
            _i1.RouteConfig(AddPeopleRoute.name, path: 'people', children: [
              _i1.RouteConfig(PersonalDetailsRoute.name, path: 'personal')
            ])
          ])
        ])
      ];
}

class MainScreen extends _i1.PageRouteInfo<void> {
  const MainScreen({List<_i1.PageRouteInfo>? children})
      : super(name, path: '/', initialChildren: children);

  static const String name = 'MainScreen';
}

class HomeRouter extends _i1.PageRouteInfo<void> {
  const HomeRouter({List<_i1.PageRouteInfo>? children})
      : super(name, path: 'home', initialChildren: children);

  static const String name = 'HomeRouter';
}

class MapsRouter extends _i1.PageRouteInfo<void> {
  const MapsRouter({List<_i1.PageRouteInfo>? children})
      : super(name, path: 'maps', initialChildren: children);

  static const String name = 'MapsRouter';
}

class SettingsRouter extends _i1.PageRouteInfo<void> {
  const SettingsRouter({List<_i1.PageRouteInfo>? children})
      : super(name, path: 'settings', initialChildren: children);

  static const String name = 'SettingsRouter';
}

class ProfileRouter extends _i1.PageRouteInfo<void> {
  const ProfileRouter({List<_i1.PageRouteInfo>? children})
      : super(name, path: 'profile', initialChildren: children);

  static const String name = 'ProfileRouter';
}

class HomePageRouter extends _i1.PageRouteInfo<void> {
  const HomePageRouter() : super(name, path: '');

  static const String name = 'HomePageRouter';
}

class AddPeopleRoute extends _i1.PageRouteInfo<void> {
  const AddPeopleRoute({List<_i1.PageRouteInfo>? children})
      : super(name, path: 'people', initialChildren: children);

  static const String name = 'AddPeopleRoute';
}

class PersonalDetailsRoute extends _i1.PageRouteInfo<void> {
  const PersonalDetailsRoute() : super(name, path: 'personal');

  static const String name = 'PersonalDetailsRoute';
}

class MapsRoute extends _i1.PageRouteInfo<MapsRouteArgs> {
  MapsRoute({_i2.Key? key})
      : super(name, path: '', args: MapsRouteArgs(key: key));

  static const String name = 'MapsRoute';
}

class MapsRouteArgs {
  const MapsRouteArgs({this.key});

  final _i2.Key? key;
}

class SettingsRoute extends _i1.PageRouteInfo<void> {
  const SettingsRoute() : super(name, path: '');

  static const String name = 'SettingsRoute';
}

class ProfileRoute extends _i1.PageRouteInfo<void> {
  const ProfileRoute() : super(name, path: '');

  static const String name = 'ProfileRoute';
}

class MyHistoryRoute extends _i1.PageRouteInfo<MyHistoryRouteArgs> {
  MyHistoryRoute({_i2.Key? key})
      : super(name, path: 'history', args: MyHistoryRouteArgs(key: key));

  static const String name = 'MyHistoryRoute';
}

class MyHistoryRouteArgs {
  const MyHistoryRouteArgs({this.key});

  final _i2.Key? key;
}
