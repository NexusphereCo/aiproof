// widgets/custom_container.dart

import 'package:aiproof/constants/colors.dart';
import 'package:aiproof/constants/sizes.dart';
import 'package:aiproof/constants/typography.dart';
import 'package:aiproof/data/models/document_model.dart';
import 'package:flutter/material.dart';

class ListViewCard extends StatelessWidget {
  final DocumentModel document;

  const ListViewCard({required this.document});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: Spacing.md),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(APBorderRadius.md),
        border: Border.all(color: APColor.primary.withOpacity(0.1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            document.image,
            width: 100,
            height: 80,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: Spacing.md,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              APTypography.base(document.fileName),
              APTypography.base(document.fileSize, color: APColor.dark.withOpacity(0.5)),
              APTypography.small(document.dateUploaded, color: APColor.dark.withOpacity(0.5)),
            ],
          ),
        ],
      ),
    );
  }
}
