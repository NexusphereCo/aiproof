import 'package:aiproof/constants/colors.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

/// defines the custom font weight
class APFontWeight {
  APFontWeight._();

  static const FontWeight thin = FontWeight.w300;
  static const FontWeight regular = FontWeight.w500;
  static const FontWeight bold = FontWeight.w600;
  static const FontWeight semiBold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
}

/// defines the custom font size
class APFontSize {
  APFontSize._();

  static const double h1 = 24.0;
  static const double h2 = 20.0;
  static const double h3 = 18.0;
  static const double h4 = 15.0;
  static const double normal = 14.0;
  static const double label = 13.0;
  static const double small = 10.0;
}

/// A class that provides typography constants and styles for the application.
class APTypography {
  APTypography._();

  /// The default font family used for text in the application.
  static const String fontFamily = 'Outfit';

  /// Creates a [Widget] with the specified text style.
  ///
  /// The [str] parameter is the text to display.
  /// The [fontSize] parameter is the size of the font.
  /// The [color] parameter is the color of the text.
  /// The [muted] parameter indicates whether the text should be muted.
  /// The [fontWeight] parameter is the weight of the font.
  /// The [textAlign] parameter is the alignment of the text.
  /// The [maxLines] parameter is the maximum number of lines for the text.
  /// The [cutOverflow] parameter indicates whether to cut off the text if it overflows.
  ///
  /// Returns a [Widget] that displays the specified text with the given style.
  static Widget _textStyle(
    String str,
    double fontSize,
    Color? color,
    bool muted,
    FontWeight fontWeight,
    TextAlign? textAlign,
    int? maxLines,
    bool? cutOverflow,
  ) {
    return AutoSizeText(
      str,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? APColor.dark.withOpacity(muted ? 0.5 : 1),
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: (cutOverflow ?? false) ? TextOverflow.ellipsis : null,
    );
  }

  /// Creates a heading 1 text widget with the specified [text] and optional styling properties.
  ///
  /// The [color] parameter sets the color of the text.
  /// The [fontWeight] parameter sets the weight of the text.
  /// The [muted] parameter determines if the text should be displayed as muted.
  /// The [textAlign] parameter sets the alignment of the text.
  /// The [maxLines] parameter limits the number of lines the text can occupy.
  /// The [cutOverflow] parameter determines if the text should be cut off when it overflows.
  static Widget h1(String text, {Color? color, FontWeight? fontWeight, bool muted = false, TextAlign? textAlign, int? maxLines, bool? cutOverflow}) => _textStyle(text, APFontSize.h1, color, muted, fontWeight ?? APFontWeight.extraBold, textAlign, maxLines, cutOverflow);

  /// Creates a heading 2 text widget with the specified [text] and optional styling properties.
  ///
  /// The [color] parameter sets the color of the text.
  /// The [fontWeight] parameter sets the weight of the text.
  /// The [muted] parameter determines if the text should be displayed as muted.
  /// The [textAlign] parameter sets the alignment of the text.
  /// The [maxLines] parameter limits the number of lines the text can occupy.
  /// The [cutOverflow] parameter determines if the text should be cut off when it overflows.
  static Widget h2(String text, {Color? color, FontWeight? fontWeight, bool muted = false, TextAlign? textAlign, int? maxLines, bool? cutOverflow}) => _textStyle(text, APFontSize.h2, color, muted, fontWeight ?? APFontWeight.extraBold, textAlign, maxLines, cutOverflow);

  /// Creates a heading 3 text widget with the specified [text] and optional styling properties.
  ///
  /// The [color] parameter sets the color of the text.
  /// The [fontWeight] parameter sets the weight of the text.
  /// The [muted] parameter determines if the text should be displayed as muted.
  /// The [textAlign] parameter sets the alignment of the text.
  /// The [maxLines] parameter limits the number of lines the text can occupy.
  /// The [cutOverflow] parameter determines if the text should be cut off when it overflows.
  static Widget h3(String text, {Color? color, FontWeight? fontWeight, bool muted = false, TextAlign? textAlign, int? maxLines, bool? cutOverflow}) => _textStyle(text, APFontSize.h3, color, muted, fontWeight ?? APFontWeight.extraBold, textAlign, maxLines, cutOverflow);

  /// Creates a heading 4 text widget with the specified [text] and optional styling properties.
  ///
  /// The [color] parameter sets the color of the text.
  /// The [fontWeight] parameter sets the weight of the text.
  /// The [muted] parameter determines if the text should be displayed as muted.
  /// The [textAlign] parameter sets the alignment of the text.
  /// The [maxLines] parameter limits the number of lines the text can occupy.
  /// The [cutOverflow] parameter determines if the text should be cut off when it overflows.
  static Widget h4(String text, {Color? color, FontWeight? fontWeight, bool muted = false, TextAlign? textAlign, int? maxLines, bool? cutOverflow}) => _textStyle(text, APFontSize.h4, color, muted, fontWeight ?? APFontWeight.extraBold, textAlign, maxLines, cutOverflow);

  /// Creates a normal text widget with the specified [text] and optional styling properties.
  ///
  /// The [color] parameter sets the color of the text.
  /// The [fontWeight] parameter sets the weight of the text.
  /// The [muted] parameter determines if the text should be displayed as muted.
  /// The [textAlign] parameter sets the alignment of the text.
  /// The [maxLines] parameter limits the number of lines the text can occupy.
  /// The [cutOverflow] parameter determines if the text should be cut off when it overflows.
  static Widget base(String text, {Color? color, FontWeight? fontWeight, bool muted = false, TextAlign? textAlign, int? maxLines, bool? cutOverflow}) => _textStyle(text, APFontSize.normal, color, muted, fontWeight ?? APFontWeight.regular, textAlign, maxLines, cutOverflow);

  /// Creates a label text widget with the specified [text] and optional styling properties.
  ///
  /// The [color] parameter sets the color of the text.
  /// The [fontWeight] parameter sets the weight of the text.
  /// The [muted] parameter determines if the text should be displayed as muted.
  /// The [textAlign] parameter sets the alignment of the text.
  /// The [maxLines] parameter limits the number of lines the text can occupy.
  /// The [cutOverflow] parameter determines if the text should be cut off when it overflows.
  static Widget label(String text, {Color? color, FontWeight? fontWeight, bool muted = false, TextAlign? textAlign, int? maxLines, bool? cutOverflow}) => _textStyle(text, APFontSize.label, color, muted, fontWeight ?? APFontWeight.semiBold, textAlign, maxLines, cutOverflow);

  /// Creates a small text widget with the specified [text] and optional styling properties.
  ///
  /// The [color] parameter sets the color of the text.
  /// The [fontWeight] parameter sets the weight of the text.
  /// The [muted] parameter determines if the text should be displayed as muted.
  /// The [textAlign] parameter sets the alignment of the text.
  /// The [maxLines] parameter limits the number of lines the text can occupy.
  /// The [cutOverflow] parameter determines if the text should be cut off when it overflows.
  static Widget small(String text, {Color? color, FontWeight? fontWeight, bool muted = false, TextAlign? textAlign, int? maxLines, bool? cutOverflow}) => _textStyle(text, APFontSize.small, color, muted, fontWeight ?? APFontWeight.regular, textAlign, maxLines, cutOverflow);
}
