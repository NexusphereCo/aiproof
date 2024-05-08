import 'package:aiproof/constants/sizes.dart';
import 'package:aiproof/data/models/document_model.dart';
import 'package:aiproof/modules/home/widgets/carousel/components/carouset_view_card.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class APCarouselView extends StatelessWidget {
  final List<DocumentModel> documents;

  const APCarouselView({super.key, required this.documents});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: APBorderRadius.lg),
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: false,
            aspectRatio: 1,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
          ),
          items: documents.map((document) => CarouselViewCard(document: document)).toList(),
        ),
      ],
    );
  }
}
