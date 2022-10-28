import 'package:blood_donate/AppTheme/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String description;

  const CustomDialog({Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context, title, description),
    );
  }
}

Widget dialogContent(BuildContext context, String title, String description) {
  return Stack(
    children: [
      Container(
        padding: const EdgeInsets.only(
          top: Consts.avatarRadius + Consts.padding,
          bottom: Consts.padding,
          left: Consts.padding,
          right: Consts.padding,
        ),
        margin: const EdgeInsets.only(top: Consts.avatarRadius),
        decoration: BoxDecoration(
          border: Border.all(
            color: darkGreen,
            width: 2,
          ),
          color: midGreen,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(Consts.padding),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // To make the card compact
          children: <Widget>[
            Text(
              title,
              style: normalDarkGreen,
            ),
            Text(
              description,
              textAlign: TextAlign.center,
              style: normalDarkGreen,
            ),
            SizedBox(height: 24.0),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 50,
                width: 400,
                child: TextButton(
                  style: outlineDarkGreen,
                  onPressed: () {
                    Navigator.of(context).pop(); // To close the dialog
                  },
                  child: Text(
                    'Proceed',
                    style: boldDarkGreen,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Positioned(
        left: Consts.padding,
        right: Consts.padding,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                blurRadius: 1,
                color: darkGreen,
                spreadRadius: 1,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: CircleAvatar(
            backgroundColor: darkGreen,
            radius: Consts.avatarRadius,
            child: CircleAvatar(
              backgroundColor: midGreen,
              radius: Consts.avatarRadius - 2,
              child: Icon(
                Icons.check_outlined,
                color: darkGreen,
                size: 50,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 50.0;
}
