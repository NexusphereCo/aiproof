import 'package:aiproof/constants/colors.dart';
import 'package:aiproof/constants/sizes.dart';
import 'package:aiproof/constants/typography.dart';
import 'package:aiproof/data/models/document_model.dart';
import 'package:aiproof/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';

class APCarouselView extends StatelessWidget {
  final List<DocumentModel> documents;

  const APCarouselView({super.key, required this.documents});

  Widget _card(DocumentModel document, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          createRoute(route: Routes.input, args: document),
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
              Image.memory(
                document.thumbnail!,
                fit: BoxFit.cover,
                width: 1000.0,
                alignment: Alignment.topCenter,
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  height: 90,
                  color: APColor.light,
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: APTypography.h2(document.title, cutOverflow: true, maxLines: 1, fontWeight: APFontWeight.bold),
                      ),
                      // APTypography.base(document.fileSize, color: APColor.dark.withOpacity(0.5)),
                      const SizedBox(height: Spacing.sm), // Add this line
                      APTypography.small(DateFormat('MMMM d, yyyy - h:mm a').format(document.createdAt), color: APColor.dark.withOpacity(0.5)),
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

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: false,
            aspectRatio: 1,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
          ),
          items: documents.map((document) => _card(document, context)).toList(),
        ),
      ],
    );
  }
}
