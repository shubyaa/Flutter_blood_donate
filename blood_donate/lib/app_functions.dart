// import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart' as ph;
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart' as lp;
import 'package:latlong2/latlong.dart';

Location location = Location();

void shareFile() async {
  await Share.share('This is Shubham Pednekar :-\n www.github.com/shubyaa');
}

void requestCall(String number) async {
  var uri = Uri.parse(number);
  if (await lp.canLaunchUrl(uri)) {
    await lp.launchUrl(uri);
  } else {
    throw Exception;
  }
}

void checkPermission() async {
  var status = await ph.Permission.location.status;
  if (status.isDenied) {
    Map<ph.Permission, ph.PermissionStatus> _statusMap = await [
      ph.Permission.location,
    ].request();
  }
  if (status.isPermanentlyDenied) {
    ph.openAppSettings();
  }
}

Future<UserLocation> getLocation() async {
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  _serviceEnabled = await location.serviceEnabled();

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
  } else {
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
    } else {
      _locationData = await location.getLocation();
      return UserLocation(_locationData.latitude, _locationData.longitude);
    }
  }
  return UserLocation(15.25, 15.50);
}

class UserLocation {
  final double? latitude;
  final double? longitude;

  UserLocation(this.latitude, this.longitude);
}
