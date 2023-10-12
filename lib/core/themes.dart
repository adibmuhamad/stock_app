import 'package:flutter/material.dart';
import 'package:stock_app/core/constants/palletes.dart';

class Themes {
  final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Palletes.blackColor,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Palletes.blackColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Palletes.blackColor,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Palletes.secondaryColor,
      ),
      actionsIconTheme: IconThemeData(
        color: Palletes.whiteColor,
      ),
    ),
  );

  final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Palletes.whiteColor,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Palletes.whiteColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Palletes.whiteColor,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Palletes.secondaryColor,
      ),
      actionsIconTheme: IconThemeData(
        color: Palletes.blackColor,
      ),
    ),
  );
}
