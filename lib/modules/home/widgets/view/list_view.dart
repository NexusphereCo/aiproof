import 'package:aiproof/bloc/document/document_bloc.dart';
import 'package:aiproof/constants/colors.dart';
import 'package:aiproof/constants/sizes.dart';
import 'package:aiproof/constants/typography.dart';
import 'package:aiproof/data/models/document_model.dart';
import 'package:aiproof/modules/home/widgets/components/empty_docs_state.dart';
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
            createRoute(route: Routes.edit, args: document),
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
                  fit: BoxFit.fitWidth,
                  width: 100.0,
                  height: 80.0,
                  alignment: Alignment.topCenter,
                ),
                Positioned(
                  top: 0.0,
                  bottom: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: APColor.light,
                      border: Border(
                        left: BorderSide(
                          color: APColor.primary.withOpacity(0.1),
                        ),
                      ),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.55,
                          child: APTypography.h4(document.title, cutOverflow: true, maxLines: 1, fontWeight: APFontWeight.bold),
                        ),
                        const SizedBox(height: Spacing.xs), // Add this line
                        // APTypography.base(document.fileSize, color: APColor.dark.withOpacity(0.5)),
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return (documents.isNotEmpty)
        ? ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: Global.paddingBody),
            itemCount: documents.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsetsDirectional.only(bottom: Spacing.md),
                child: _card(documents[index], context),
              );
            },
          )
        : const EmptyDocsState();
  }
}
