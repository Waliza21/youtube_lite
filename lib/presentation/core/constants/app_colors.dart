import 'package:flutter/animation.dart';

class AppColors {
  AppColors._(); //static const use korsi so baire theke access korte parbe na. ei class er baire theke access korte chaile tokhn ei named constructor use kora lagbe jeta possible na. so use korte parbe na.

  //brand
  static const Color youtubePrimary = Color(0xFFFF0000);
  static const Color youtubeRed = Color(0xFFCC0000);

  //background
  static const Color backgroundDark = Color(0xFF0F0F0F);
  static const Color surfaceDark = Color(0xFF1A1A1A);
  static const Color cardDark = Color(0xFF272727);

  //text
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFAAAAAA);
  static const Color textHint = Color(0xFF717171);

  //chip
  static const Color chipSelected = Color(0xFFFFFFFF);
  static const Color chipSelectedText = Color(0xFF0F0F0F);
  static const Color chipUnselected = Color(0xFF272727);
  static const Color chipUnselectedText = Color(0xFFFFFFFF);

  //icon
  static const Color iconDefault = Color(0xFFFFFFFF);
  static const Color iconMuted = Color(0xFFAAAAAA);

  //divider
  static const Color divider = Color(0xFF3D3D3D);

  //overlay
  static const Color loadingOverlay = Color(0xFF0F0F0F);
}


//different different instance create kori jokhn, tokhn different different hashnote create hoy.
//sharedPreference jokhn use kori tokhn singleton use kori, karon nahole multiple storage use hocche, jar karone memory waste hocche.
//token akta jaygay save kore rakhte chai obviously, multiple jaygay store korte chai na. tai sqlite, sharedPreference e singleton use hoy.
