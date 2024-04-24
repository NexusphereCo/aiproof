import 'package:aiproof/constants/colors.dart';
import 'package:aiproof/constants/sizes.dart';
import 'package:aiproof/constants/typography.dart';
import 'package:flutter/material.dart';

class APSearchBar extends StatelessWidget {
  const APSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        APTypography.h1("Greetings!", color: APColor.light),
        const SizedBox(height: Spacing.sm),
        TextField(
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: 'Search',
            prefixIcon: Icon(Icons.search, color: APColor.primary),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(APBorderRadius.md)),
              borderSide: BorderSide.none,
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(APBorderRadius.md)),
              borderSide: BorderSide.none,
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(APBorderRadius.md)),
              borderSide: BorderSide.none,
            ),
            hintStyle: TextStyle(color: APColor.primary),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
          ),
        )
      ],
    );
  }
}
