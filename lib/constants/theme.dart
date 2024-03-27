import 'package:aiproof/constants/colors.dart';
import 'package:aiproof/constants/sizes.dart';
import 'package:aiproof/constants/typography.dart';

import 'package:flutter/material.dart';

class APTheme {
  APTheme._();

  static const baseTextStyle = TextStyle(fontFamily: APTypography.fontFamily);

  static TextTheme buildTextTheme() {
    return const TextTheme(
      bodyLarge: baseTextStyle,
      bodyMedium: baseTextStyle,
      bodySmall: baseTextStyle,
      displayLarge: baseTextStyle,
      displayMedium: baseTextStyle,
      displaySmall: baseTextStyle,
      headlineLarge: baseTextStyle,
      headlineMedium: baseTextStyle,
      headlineSmall: baseTextStyle,
      labelLarge: baseTextStyle,
      labelMedium: baseTextStyle,
      labelSmall: baseTextStyle,
      titleLarge: baseTextStyle,
      titleMedium: baseTextStyle,
      titleSmall: baseTextStyle,
    );
  }

  static ThemeData data() {
    const borderRadius = 8.0;
    const scrollbarRadius = 100.0;
    const scrollbarMargin = 5.0;

    return ThemeData(
      primarySwatch: APColor.primary,
      textTheme: buildTextTheme(),
      iconTheme: IconThemeData(color: APColor.dark),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: APColor.primary,
        foregroundColor: APColor.light,
        shape: const CircleBorder(),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(APBorderRadius.lg),
            topRight: Radius.circular(APBorderRadius.lg),
          ),
        ),
        elevation: 0,
        backgroundColor: APColor.light,
      ),
      popupMenuTheme: PopupMenuThemeData(
        textStyle: TextStyle(
          fontFamily: APTypography.fontFamily,
          fontSize: APFontSize.label,
          fontWeight: APFontWeight.regular,
          color: APColor.primary,
        ),
        elevation: 5,
        shadowColor: APColor.primary[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(APBorderRadius.md),
          side: BorderSide(color: APColor.primary, width: 1.0),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        contentTextStyle: TextStyle(
          fontFamily: APTypography.fontFamily,
          fontSize: APFontSize.label,
          fontWeight: APFontWeight.regular,
          color: APColor.light,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
        ),
        behavior: SnackBarBehavior.floating,
        insetPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        backgroundColor: APColor.primary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: APColor.dark),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: APColor.primary),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      scrollbarTheme: const ScrollbarThemeData(
        radius: Radius.circular(scrollbarRadius),
        crossAxisMargin: scrollbarMargin,
        mainAxisMargin: scrollbarMargin,
      ),
    );
  }
}
