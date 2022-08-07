// BUTTON STYLES
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// App Colors

Color darkGreen = const Color.fromRGBO(0, 109, 95, 1);

const textWhite = Colors.white;
const offWhite = Color.fromARGB(255, 248, 255, 255);

// Text Styles

TextStyle bloodGroupText = GoogleFonts.lato(
  fontWeight: FontWeight.bold,
  fontSize: 45,
  color: Colors.white,
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
    ]);

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
