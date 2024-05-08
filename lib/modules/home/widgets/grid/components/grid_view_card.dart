// widgets/carousel_view_card.dart

import 'package:aiproof/constants/colors.dart';
import 'package:aiproof/constants/sizes.dart';
import 'package:aiproof/constants/typography.dart';
import 'package:aiproof/data/models/document_model.dart';
import 'package:aiproof/modules/input/index.dart';
import 'package:aiproof/utils/routes.dart';
import 'package:flutter/material.dart';

class GridViewCard extends StatelessWidget {
  final DocumentModel document;

  const GridViewCard({super.key, required this.document});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          createRoute(route: Routes.input),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(APBorderRadius.md),
          border: Border.all(color: APColor.primary.withOpacity(0.1)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(APBorderRadius.md),
          child: Stack(
            children: <Widget>[
              // Image.asset(document.image, fit: BoxFit.cover, width: 1000.0),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  color: APColor.light,
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      APTypography.base(document.title),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
