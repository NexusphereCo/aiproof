import 'package:aiproof/constants/assets.dart';
import 'package:aiproof/constants/sizes.dart';
import 'package:aiproof/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmptyDocsState extends StatelessWidget {
  const EmptyDocsState({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 100),
        SvgPicture.asset(
          Asset.empty,
        ),
        const SizedBox(height: Spacing.lg),
        APTypography.h2('No documents found'),
        APTypography.small('Start scanning to get started.')
      ],
    );
  }
}
