import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

void shareFile() async {
  await Share.share('This is Shubham Pednekar :-\n www.github.com/shubyaa');
}

void requestCall(String number) async {
  var uri = Uri.parse(number);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw "Unable to call $number";
  }
}
