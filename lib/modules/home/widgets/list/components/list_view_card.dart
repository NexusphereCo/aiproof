import 'package:aiproof/business_logic/document/document_bloc.dart';
import 'package:aiproof/constants/colors.dart';
import 'package:aiproof/constants/sizes.dart';
import 'package:aiproof/constants/typography.dart';
import 'package:aiproof/data/models/document_model.dart';
import 'package:aiproof/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ListViewCard extends StatelessWidget {
  final DocumentModel document;

  const ListViewCard({super.key, required this.document});

  @override
  Widget build(BuildContext context) {
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
              // Image.asset(
              //   document.image,
              //   width: 100,
              //   height: 80,
              //   fit: BoxFit.cover,
              // ),
              const SizedBox(
                width: Spacing.md,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
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
}
