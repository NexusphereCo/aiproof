import 'package:aiproof/bloc/document_view/document_view_bloc.dart';
import 'package:aiproof/bloc/document/document_bloc.dart';
import 'package:aiproof/constants/typography.dart';
import 'package:aiproof/modules/home/enums/doc_view.dart';
import 'package:aiproof/modules/home/widgets/view/carousel_view.dart';
import 'package:aiproof/modules/home/widgets/view/grid_view.dart';
import 'package:aiproof/modules/home/widgets/view/list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class ViewDocument extends StatefulWidget {
  const ViewDocument({super.key});

  @override
  State<ViewDocument> createState() => _ViewDocumentState();
}

class _ViewDocumentState extends State<ViewDocument> {
  Logger log = Logger();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DocumentBloc, DocumentState>(
      builder: (context, state) {
        return BlocBuilder<DocViewBloc, DocViewState>(
          builder: (context, viewState) {
            return Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: () {
                if (state is LoadedDocumentState) {
                  if (viewState.docView == DocView.carousel) {
                    return APCarouselView(documents: state.documents);
                  } else if (viewState.docView == DocView.list) {
                    return APListView(documents: state.documents);
                  } else if (viewState.docView == DocView.grid) {
                    return APGridView(documents: state.documents);
                  } else {
                    return Center(child: APTypography.base('No view selected'));
                  }
                } else if (state is FilteredDocument) {
                  if (viewState.docView == DocView.carousel) {
                    return APCarouselView(documents: state.documents);
                  } else if (viewState.docView == DocView.list) {
                    return APListView(documents: state.documents);
                  } else if (viewState.docView == DocView.grid) {
                    return APGridView(documents: state.documents);
                  } else {
                    return Center(child: APTypography.base('No view selected'));
                  }
                } else if (state is ErrorDocument) {
                  return Center(
                    child: Text(state.message),
                  );
                } else if (state is InitialDocumentState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Container();
                }
              }(),
            );
          },
        );
      },
    );
  }
}
