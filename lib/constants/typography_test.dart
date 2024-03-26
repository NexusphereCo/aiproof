import 'package:ai_proof/constants/colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

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

class APTypography extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final bool muted;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final bool? cutOverflow;

  const APTypography({
    super.key,
    required this.text,
    required this.fontSize,
    this.color,
    this.muted = false,
    this.fontWeight = FontWeight.normal,
    this.textAlign,
    this.maxLines,
    this.cutOverflow,
  });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
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
}

class h1 extends APTypography {
  const h1({
    super.key,
    required String text,
    Color? color,
    bool muted = false,
    FontWeight fontWeight = FontWeight.bold,
    TextAlign? textAlign,
    int? maxLines,
    bool? cutOverflow,
  }) : super(
          text: text,
          fontSize: APFontSize.h1,
          color: color,
          muted: muted,
          fontWeight: fontWeight,
          textAlign: textAlign,
          maxLines: maxLines,
          cutOverflow: cutOverflow,
        );
}

class h2 extends APTypography {
  const h2({
    super.key,
    required String text,
    Color? color,
    bool muted = false,
    FontWeight fontWeight = FontWeight.bold,
    TextAlign? textAlign,
    int? maxLines,
    bool? cutOverflow,
  }) : super(
          text: text,
          fontSize: APFontSize.h2,
          color: color,
          muted: muted,
          fontWeight: fontWeight,
          textAlign: textAlign,
          maxLines: maxLines,
          cutOverflow: cutOverflow,
        );
}

class h3 extends APTypography {
  const h3({
    super.key,
    required String text,
    Color? color,
    bool muted = false,
    FontWeight fontWeight = FontWeight.bold,
    TextAlign? textAlign,
    int? maxLines,
    bool? cutOverflow,
  }) : super(
          text: text,
          fontSize: APFontSize.h3,
          color: color,
          muted: muted,
          fontWeight: fontWeight,
          textAlign: textAlign,
          maxLines: maxLines,
          cutOverflow: cutOverflow,
        );
}

class h4 extends APTypography {
  const h4({
    super.key,
    required String text,
    Color? color,
    bool muted = false,
    FontWeight fontWeight = FontWeight.bold,
    TextAlign? textAlign,
    int? maxLines,
    bool? cutOverflow,
  }) : super(
          text: text,
          fontSize: APFontSize.h4,
          color: color,
          muted: muted,
          fontWeight: fontWeight,
          textAlign: textAlign,
          maxLines: maxLines,
          cutOverflow: cutOverflow,
        );
}

class text extends APTypography {
  const text({
    super.key,
    required String text,
    Color? color,
    bool muted = false,
    FontWeight fontWeight = FontWeight.normal,
    TextAlign? textAlign,
    int? maxLines,
    bool? cutOverflow,
  }) : super(
          text: text,
          fontSize: APFontSize.normal,
          color: color,
          muted: muted,
          fontWeight: fontWeight,
          textAlign: textAlign,
          maxLines: maxLines,
          cutOverflow: cutOverflow,
        );
}

class label extends APTypography {
  const label({
    super.key,
    required String text,
    Color? color,
    bool muted = false,
    FontWeight fontWeight = FontWeight.w600,
    TextAlign? textAlign,
    int? maxLines,
    bool? cutOverflow,
  }) : super(
          text: text,
          fontSize: APFontSize.label,
          color: color,
          muted: muted,
          fontWeight: fontWeight,
          textAlign: textAlign,
          maxLines: maxLines,
          cutOverflow: cutOverflow,
        );
}

class small extends APTypography {
  const small({
    super.key,
    required String text,
    Color? color,
    bool muted = false,
    FontWeight fontWeight = FontWeight.normal,
    TextAlign? textAlign,
    int? maxLines,
    bool? cutOverflow,
  }) : super(
          text: text,
          fontSize: APFontSize.small,
          color: color,
          muted: muted,
          fontWeight: fontWeight,
          textAlign: textAlign,
          maxLines: maxLines,
          cutOverflow: cutOverflow,
        );
}
