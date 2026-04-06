import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  fontFamily: "norse-bold",
  useMaterial3: true,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF212121), 
  cardColor: const Color(0xFF282828), 
  iconTheme: const IconThemeData(
    color: Color(0xFFFE8D00),
    size: 24,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFFFE8D00),
      foregroundColor: Colors.black,
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: Color(0xFFFE8D00), 
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      color: Colors.white, 
      fontSize: 17,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: TextStyle(
      color: Colors.white54, 
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF212121),
    foregroundColor: Color(0xFFFE8D00),
    elevation: 0,
    centerTitle: true,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF1A1A1A),
    selectedItemColor: Color(0xFFFE8D00),
    unselectedItemColor: Colors.white38,
    showUnselectedLabels: true,
    selectedLabelStyle: TextStyle(
      fontWeight: FontWeight.bold,
    ),
  ),
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFFFE8D00),
    secondary: Color(0xFF582101),
    surface: Color(0xFF282828),
    onPrimary: Colors.black,
    onSurface: Colors.white,
  ),
);


final lightTheme = ThemeData(
  fontFamily: "norse-bold",
  useMaterial3: true,
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.grey[100],
  cardColor: Colors.white,
  iconTheme: const IconThemeData(
    color: Colors.black87,
    size: 24,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFFFE8C01),
      foregroundColor: Colors.white,
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: Color(0xFFE67800),
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      color: Colors.black87,
      fontSize: 17,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: TextStyle(
      color: Colors.black45,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black87,
    elevation: 0,
    centerTitle: true,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    hintStyle: const TextStyle(color: Colors.black45),
    prefixIconColor: Colors.black45,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(color: Colors.grey.shade300),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(color: Colors.grey.shade300),
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: Color(0xFFFE8C01),
    unselectedItemColor: Colors.black45,
    showUnselectedLabels: true,
    selectedLabelStyle: TextStyle(
      fontWeight: FontWeight.bold,
    ),
  ),
  colorScheme: ColorScheme.light(
    primary: const Color(0xFFFE8C01),
    secondary: const Color(0xFFE67800),
    surface: Colors.white,
    error: Colors.redAccent,
    onPrimary: Colors.white,
    onSurface: Colors.black87,
    shadow: Colors.grey.withAlpha(70),
  ),
);