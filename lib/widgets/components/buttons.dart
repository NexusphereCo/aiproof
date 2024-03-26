import 'package:ai_proof/constants/colors.dart';
import 'package:ai_proof/constants/sizes.dart';
import 'package:ai_proof/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

enum APButtonTheme {
  primary,
  primaryOutlined,
  secondary,
  secondaryOutlined,
  warning,
  warningOutlined,
  danger,
  dangerOutlined,
  light,
  lightOutlined,
  dark,
  darkOutlined,
}

enum APButtonSize {
  lg,
  md,
  sm,
}

class APBackButton extends StatelessWidget {
  const APBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Remix.arrow_left_line),
        ),
      ],
    );
  }
}

class APNavButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String text;
  final bool isActive;

  const APNavButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.text,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 24,
            color: APColor.dark.withOpacity(isActive ? 1 : 0.5),
          ),
          const SizedBox(height: 4),
          label(text: text, color: APColor.dark.withOpacity(isActive ? 1 : 0.5)),
        ],
      ),
    );
  }
}

class APButton extends StatelessWidget {
  final String text;
  final APButtonTheme theme;
  final VoidCallback onPressed;

  final Icon? icon;
  final APButtonSize? size;
  final bool? disabled;

  // Array of themes in their categories
  final defaultThemes = {
    APButtonTheme.primary,
    APButtonTheme.secondary,
    APButtonTheme.danger,
    APButtonTheme.light,
    APButtonTheme.dark,
  };
  final outlineThemes = {
    APButtonTheme.primaryOutlined,
    APButtonTheme.secondaryOutlined,
    APButtonTheme.dangerOutlined,
    APButtonTheme.lightOutlined,
    APButtonTheme.darkOutlined,
  };

  // styling
  final double _borderRadius = APBorderRadius.sm;

  APButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.theme,
    this.icon,
    this.size,
    this.disabled,
  });

  @override
  Widget build(BuildContext context) {
    ButtonStyleButton button;
    double height = 50.0;
    double width;

    // if the size is specified
    switch (size ?? APButtonSize.md) {
      case APButtonSize.sm:
        width = MediaQuery.of(context).size.width * 0.4 - Global.paddingBody * 2;
        break;
      case APButtonSize.md:
        width = MediaQuery.of(context).size.width * 0.70 - Global.paddingBody * 2;
        break;
      case APButtonSize.lg:
        width = MediaQuery.of(context).size.width * 0.90 - Global.paddingBody * 2;
        break;
    }

    final btnFixedSize = Size(width, height);
    final btnShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(_borderRadius));
    const textIconSpacing = 6.0;

    // regular button
    if (defaultThemes.contains(theme)) {
      // apply the default styles
      button = ElevatedButton(
        onPressed: !(disabled ?? false) ? onPressed : null,
        style: ElevatedButton.styleFrom(
          shape: btnShape,
          fixedSize: btnFixedSize,
          elevation: 0,
          backgroundColor: _setColor(theme),
          disabledBackgroundColor: _setColor(theme).withOpacity(0.5),
        ),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: textIconSpacing,
          children: [
            switch (size ?? APButtonSize.md) {
              APButtonSize.sm => small(
                  text: text,
                  color: APColor.light,
                ),
              APButtonSize.md => normal(
                  text: text,
                  color: APColor.light,
                ),
              APButtonSize.lg => h3(
                  text: text,
                  color: APColor.light,
                  fontWeight: APFontWeight.regular,
                ),
            },
            if (icon != null) Container(child: icon),
          ],
        ),
      );
    }
    // outlined button
    else {
      // apply the outline button styles
      button = OutlinedButton(
        onPressed: !(disabled ?? false) ? onPressed : null,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: _setColor(theme)),
          shape: btnShape,
          foregroundColor: _setColor(theme),
          backgroundColor: Colors.transparent,
          disabledBackgroundColor: _setColor(theme).withOpacity(0.5),
          fixedSize: btnFixedSize,
          elevation: 0,
        ),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: textIconSpacing,
          children: [
            switch (size ?? APButtonSize.md) {
              APButtonSize.sm => small(
                  text: text,
                  color: _setColor(theme),
                ),
              APButtonSize.md => normal(
                  text: text,
                  color: _setColor(theme),
                ),
              APButtonSize.lg => h3(
                  text: text,
                  color: _setColor(theme),
                  fontWeight: APFontWeight.regular,
                ),
            },
            if (icon != null) Container(child: icon),
          ],
        ),
      );
    }
    return button;
  }

  Color _setColor(APButtonTheme theme) {
    switch (theme) {
      case APButtonTheme.primary || APButtonTheme.primaryOutlined:
        return APColor.primary;
      case APButtonTheme.dark || APButtonTheme.darkOutlined:
        return APColor.dark;
      case APButtonTheme.light || APButtonTheme.lightOutlined:
        return APColor.light;
      case APButtonTheme.danger || APButtonTheme.dangerOutlined:
        return APColor.danger;
      default:
        return APColor.dark;
    }
  }
}
