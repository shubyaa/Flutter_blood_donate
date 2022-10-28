// import 'package:geolocator/geolocator.dart';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart' as lp;
import 'package:latlong2/latlong.dart';

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
  var status = await Permission.location.status;
  if (status.isDenied) {
    Map<Permission, PermissionStatus> _statusMap = await [
      Permission.location,
    ].request();
  }
  if (status.isPermanentlyDenied) {
    openAppSettings();
  }
}

// void checkPermission() async {
//   LocationPe permission = await Geolocator.checkPermission();

//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//   } else if (permission == LocationPermission.deniedForever) {
//     openAppSettings();
//   } else {
//     print('Location Granted');
//   }
// }

Future<Position> getLocationCordinates() async {
  var status = Geolocator.checkPermission();

  if (status == LocationPermission.denied) {
    print("Location not allowed");
    Position position = Position.fromMap("message");
    return position;
  } else {
    return await Geolocator.getCurrentPosition();
  }
}
