import 'package:flutter/material.dart';

class ThemeService {
  // Font Sizes
  static const double fontSizeTitleLarge = 20;
  static const double fontSizeTitleMedium = 18;
  static const double fontSizeTitleSmall = 16;
  static const double fontSizeBodyLarge = 18;
  static const double fontSizeBodyMedium = 16;
  static const double fontSizeBodySmall = 14;
  static const double fontSizeButton = 16;
  static const double fontSizeAppBar = 22;
  static const double fontSizeCardValue = 18;
  static const double fontSizeCardTitle = 13;
  static const double fontSizeLabel = 20;

  // Font Weights
  static const FontWeight fontWeightBold = FontWeight.bold;
  static const FontWeight fontWeightNormal = FontWeight.normal;
  static const FontWeight fontWeightW500 = FontWeight.w500;

  // Text Styles
  static const TextStyle titleLarge = TextStyle(
    fontWeight: fontWeightBold,
    fontSize: fontSizeTitleLarge,
  );
  static const TextStyle titleMedium = TextStyle(
    fontWeight: fontWeightBold,
    fontSize: fontSizeTitleMedium,
  );
  static const TextStyle titleSmall = TextStyle(
    fontWeight: fontWeightBold,
    fontSize: fontSizeTitleSmall,
  );
  static const TextStyle bodyLarge = TextStyle(fontSize: fontSizeBodyLarge);
  static const TextStyle bodyMedium = TextStyle(fontSize: fontSizeBodyMedium);
  static const TextStyle bodySmall = TextStyle(fontSize: fontSizeBodySmall);
  static const TextStyle button = TextStyle(
    fontSize: fontSizeButton,
    fontWeight: fontWeightBold,
  );
  static const TextStyle appBar = TextStyle(
    fontSize: fontSizeAppBar,
    fontWeight: fontWeightBold,
  );
  static const TextStyle cardValue = TextStyle(
    fontSize: fontSizeCardValue,
    fontWeight: fontWeightBold,
    color: Color(0xFF1A237E),
  );
  static const TextStyle cardTitle = TextStyle(
    fontSize: fontSizeCardTitle,
    color: Colors.black,
  );
  static const TextStyle label = TextStyle(
    fontSize: fontSizeLabel,
    fontWeight: fontWeightBold,
  );
}
