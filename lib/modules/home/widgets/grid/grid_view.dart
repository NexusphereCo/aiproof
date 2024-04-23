import 'package:aiproof/constants/sizes.dart';
import 'package:aiproof/data/models/document_model.dart';
import 'package:aiproof/modules/home/widgets/grid/components/grid_view_card.dart';
import 'package:aiproof/modules/home/widgets/list/components/list_view_card.dart';
import 'package:flutter/material.dart';

class MyGridView extends StatelessWidget {
  final List<DocumentModel> documents;

  MyGridView({required this.documents});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: Global.paddingBody),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: documents.length,
      itemBuilder: (context, index) {
        return GridViewCard(document: documents[index]);
      },
    );
  }
}
