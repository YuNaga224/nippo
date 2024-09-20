import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => _themeData(Brightness.light);
  static ThemeData get dark => _themeData(Brightness.dark);

  static ThemeData _themeData(Brightness brightness) {
    final themeData = ThemeData.from(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        brightness: brightness,
        seedColor: Colors.deepPurple,
      ),
    );
    final listTextStyle = themeData.textTheme.bodyMedium;

    return themeData.copyWith(
      splashFactory: InkSparkle.splashFactory,
      // textTheme: themeData.textTheme.apply(
      //   fontFamily: GoogleFonts.lato().fontFamily,
      // ),
      // スクロール時にAppBarのElevationがでカラーが切り替わる表現を無効化
      appBarTheme: const AppBarTheme(scrolledUnderElevation: 0),
      dividerTheme: const DividerThemeData(space: 0),
      listTileTheme: ListTileThemeData(
        titleTextStyle: listTextStyle,
        leadingAndTrailingTextStyle: listTextStyle,
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        contentPadding: EdgeInsets.all(12),
        alignLabelWithHint: true,
      ),
    );
  }
}
