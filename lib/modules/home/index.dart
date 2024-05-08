import 'package:aiproof/business_logic/document/document_bloc.dart';
import 'package:aiproof/constants/assets.dart';
import 'package:aiproof/constants/sizes.dart';
import 'package:aiproof/modules/home/components/header_logo.dart';
import 'package:aiproof/modules/home/components/search_bar.dart';
import 'package:aiproof/modules/home/components/view_toggle.dart';
import 'package:aiproof/modules/home/enums/doc_view.dart';
import 'package:aiproof/modules/home/widgets/carousel/carousel_view.dart';
import 'package:aiproof/modules/home/widgets/grid/grid_view.dart';
import 'package:aiproof/modules/home/widgets/list/list_view.dart';
import 'package:aiproof/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:remixicon/remixicon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();
  DocView _currentView = DocView.carousel;

  @override
  void initState() {
    super.initState();
    context.read<DocumentBloc>().add(LoadDocumentEvent());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _handleViewChange(DocView newView) {
    setState(() {
      _currentView = newView;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DocumentBloc, DocumentState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                fit: StackFit.passthrough,
                children: [
                  Positioned(
                    child: SvgPicture.asset(Asset.heading, fit: BoxFit.fill),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Global.paddingBody),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const HeaderLogo(),
                        const SizedBox(height: Spacing.xl),
                        const APSearchBar(),
                        const SizedBox(height: Spacing.xxxl),
                        ViewToggle(
                          documentView: _currentView,
                          onViewChanged: _handleViewChange,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: () {
                  if (state is LoadedDocumentState) {
                    if (_currentView == DocView.carousel) {
                      return APCarouselView(documents: state.documents);
                    } else if (_currentView == DocView.list) {
                      return APListView(documents: state.documents);
                    } else if (_currentView == DocView.grid) {
                      return APGridView(documents: state.documents);
                    }
                    return Container();
                  } else if (state is FilteredDocument) {
                    if (_currentView == DocView.carousel) {
                      return APCarouselView(documents: state.documents);
                    } else if (_currentView == DocView.list) {
                      return APListView(documents: state.documents);
                    } else if (_currentView == DocView.grid) {
                      return APGridView(documents: state.documents);
                    }
                    return Container();
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
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Remix.add_line),
        onPressed: () {
          Navigator.of(context).push(
            createRoute(route: Routes.input),
          );
        },
      ),
    );
  }
}
