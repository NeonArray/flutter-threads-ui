import 'package:flutter/material.dart';

var darkTheme = ThemeData(
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    displayMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      height: 1.5,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    bodySmall: TextStyle(
      height: 1.5,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Color(0xFF616161),
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF101010),
    selectedItemColor: Color(0xFF101010),
  ),
  colorScheme: const ColorScheme.dark(
    // primary: Colors.blue,
    // secondary: Colors.white,
    // background: Colors.green,
    surface: Color(0xFF101010), // The bottom drawer bg is inheriting this
    // onPrimary: Colors.white,
    // onSecondary: Colors.white,
    // onBackground: Colors.white,
    // onSurface: Colors.red,
    // primaryContainer: Colors.orange,
    // onPrimaryContainer: Colors.white,
    secondaryContainer: Color(0xFF181818),
    onSecondaryContainer: Color(0xFF262626),
    // tertiary: Colors.white,
    onTertiary: Color(0xFF323232),
    // tertiaryContainer: Colors.white,
    // onTertiaryContainer: Colors.white,
    error: Colors.white,
    onError: Colors.white,
    errorContainer: Colors.white,
    onErrorContainer: Colors.white,
    surfaceVariant: Colors.white,
    onSurfaceVariant: Colors.white,
    outline: Color(0xFF616161),
    // outlineVariant: Colors.white,
    // shadow: Colors.white,
    // scrim: Colors.white,
    // inverseSurface: Colors.white,
    // onInverseSurface: Colors.white,
    // inversePrimary: Colors.white,
    // surfaceTint: Colors.white,
  ),
);
