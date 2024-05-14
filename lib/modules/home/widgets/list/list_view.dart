import 'package:aiproof/bloc/document/document_bloc.dart';
import 'package:aiproof/constants/colors.dart';
import 'package:aiproof/constants/sizes.dart';
import 'package:aiproof/constants/typography.dart';
import 'package:aiproof/data/models/document_model.dart';
import 'package:aiproof/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class APListView extends StatelessWidget {
  final List<DocumentModel> documents;

  const APListView({super.key, required this.documents});

  Widget _card(DocumentModel document, BuildContext context) {
    return BlocBuilder<DocumentBloc, DocumentState>(builder: (context, state) {
      return InkWell(
        onTap: () {
          Navigator.of(context).push(
            createRoute(route: Routes.input, args: document),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(APBorderRadius.md),
            border: Border.all(color: APColor.primary.withOpacity(0.1)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.memory(
                document.thumbnail!,
                width: 100,
                height: 80,
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
              const SizedBox(width: Spacing.sm),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: APTypography.h4(document.title, cutOverflow: true, maxLines: 1, fontWeight: APFontWeight.bold),
                  ),
                  const SizedBox(height: Spacing.xs), // Add this line
                  // APTypography.base(document.fileSize, color: APColor.dark.withOpacity(0.5)),
                  APTypography.small(DateFormat('MMMM d, yyyy - h:mm a').format(document.createdAt), color: APColor.dark.withOpacity(0.5)),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: Global.paddingBody),
      itemCount: documents.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsetsDirectional.only(bottom: Spacing.md),
          child: _card(documents[index], context),
        );
      },
    );
  }
}
