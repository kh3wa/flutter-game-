import 'package:flutter/material.dart';

import 'package:game/constants.dart';

final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: lightBackgroundColor,
    typography: Typography(
      englishLike: Typography.englishLike2018,
      dense: Typography.dense2018,
      tall: Typography.tall2018,
    ),
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        fontFamily: 'RobotoMedium',
        fontSize: 34.0,
        color: Colors.black.withOpacity(0.75),
      ),
      headlineSmall: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 24.0,
        color: Colors.black.withOpacity(0.65),
      ),
      titleLarge: TextStyle(
        fontFamily: 'RobotoMedium',
        fontSize: 20.0,
        color: Colors.black.withOpacity(0.65),
      ),
      titleMedium: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 16.0,
        color: Colors.black.withOpacity(0.65),
      ),
      bodyLarge: TextStyle(
        fontFamily: 'RobotoMedium',
        fontSize: 14.0,
        color: Colors.black.withOpacity(0.65),
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 14.0,
        color: Colors.black.withOpacity(0.65),
      ),
    ),
    colorScheme: ColorScheme.light(
      background: lightBackgroundColor,
      primary: Colors.blue,
      onBackground: Colors.black,
    ) // تخصيص اللون على الخلفية
    );
