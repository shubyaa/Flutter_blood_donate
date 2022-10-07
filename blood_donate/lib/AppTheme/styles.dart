// BUTTON STYLES
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Icons Size
const double IconSize = 30.0;

// App Colors

Color darkGreen_ = const Color.fromRGBO(18, 96, 86, 1);
Color darkGreen = const Color.fromRGBO(0, 109, 95, 1);
Color midGreen = const Color.fromARGB(255, 118, 196, 185);

const textWhite = Colors.white;
const offWhite = Color.fromARGB(255, 248, 255, 255);

// Text Styles

//_____________________Maps Page ___________________________

TextStyle smallMapsText = GoogleFonts.lato(
  color: darkGreen,
  fontSize: 15,
);

TextStyle largeMapsText = GoogleFonts.lato(
  fontSize: 20,
  color: darkGreen,
);
//_____________________Maps Page ___________________________
TextStyle myHistoryDonatedTextLite = GoogleFonts.montserrat(
  fontSize: 20.0,
  fontWeight: FontWeight.w600,
  color: offWhite,
);
TextStyle myHistoryDonatedTextDark = GoogleFonts.montserrat(
  fontSize: 20.0,
  fontWeight: FontWeight.w600,
  color: darkGreen_,
);

TextStyle number = GoogleFonts.lato(
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
  color: Color.fromRGBO(18, 96, 86, 1.0),
);

TextStyle settingsText = GoogleFonts.montserrat(
  fontSize: 20.0,
  fontWeight: FontWeight.w500,
  color: darkGreen_,
);

TextStyle settingsTextTitle = GoogleFonts.montserrat(
  fontSize: 25.0,
  fontWeight: FontWeight.w700,
  color: Color.fromRGBO(0, 82, 33, 0.3),
);

TextStyle usernameTitle = GoogleFonts.montserrat(
  color: Colors.white,
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
  fontFeatures: [
    const FontFeature.tabularFigures(),
  ],
);

TextStyle appBarTitleText = GoogleFonts.montserrat(
  color: Colors.white,
  fontSize: 35,
  fontWeight: FontWeight.bold,
  fontFeatures: [
    const FontFeature.tabularFigures(),
  ],
);

TextStyle bloodGroupText = GoogleFonts.lato(
  fontWeight: FontWeight.bold,
  fontSize: 45,
  color: Colors.white,
);

TextStyle donorCardText = GoogleFonts.lato(
  fontSize: 15,
  color: darkGreen,
);

TextStyle smallText = GoogleFonts.lato(
  fontSize: 10,
  color: Colors.white,
);

TextStyle titleTextStyle = GoogleFonts.montserrat(
  color: Colors.white,
  fontSize: 20,
  fontWeight: FontWeight.bold,
  fontFeatures: [
    const FontFeature.tabularFigures(),
  ],
);

TextStyle boldWhite = GoogleFonts.lato(
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontSize: 16,
);

TextStyle boldRed = GoogleFonts.lato(
  fontWeight: FontWeight.bold,
  color: Colors.red,
  fontSize: 16,
);

// Button Styles

ButtonStyle greenFill = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(
    darkGreen,
  ),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
);

ButtonStyle outlineRed = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: const BorderSide(width: 3, color: Colors.red),
    ),
  ),
);

ButtonStyle outlineWhite = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: const BorderSide(width: 3, color: Colors.white),
    ),
  ),
);
