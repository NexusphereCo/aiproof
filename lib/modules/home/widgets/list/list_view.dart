import 'package:aiproof/constants/sizes.dart';
import 'package:aiproof/data/models/document_model.dart';
import 'package:aiproof/modules/home/widgets/list/components/list_view_card.dart';
import 'package:flutter/material.dart';

class APListView extends StatelessWidget {
  final List<DocumentModel> documents;

  const APListView({super.key, required this.documents});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: Global.paddingBody),
      itemCount: documents.length,
      itemBuilder: (context, index) {
        return ListViewCard(document: documents[index]);
      },
    );
  }
}
