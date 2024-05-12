import 'package:aiproof/business_logic/document/document_bloc.dart';
import 'package:aiproof/constants/assets.dart';
import 'package:aiproof/constants/sizes.dart';
import 'package:aiproof/constants/typography.dart';
import 'package:aiproof/modules/home/components/header_logo.dart';
import 'package:aiproof/modules/home/components/search_bar.dart';
import 'package:aiproof/modules/home/components/view_document.dart';
import 'package:aiproof/modules/home/components/view_toggle.dart';
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
  final _scrollController = ScrollController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    context.read<DocumentBloc>().add(LoadDocumentEvent());

    _focusNode.addListener(
      () {
        if (_focusNode.hasFocus) {
          _scrollController.animateTo(
            _scrollController.offset + 95.0,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
          );
        } else {
          _scrollController.animateTo(
            _scrollController.offset - 95.0,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DocumentBloc, DocumentState>(
        builder: (context, state) {
          return SingleChildScrollView(
            controller: _scrollController,
            child: Column(
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
                          APSearchBar(focusNode: _focusNode),
                          const SizedBox(height: Spacing.xxl + Spacing.lg),
                          const ViewToggle(),
                        ],
                      ),
                    ),
                  ],
                ),
                const ViewDocument(),
              ],
            ),
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
      resizeToAvoidBottomInset: false,
    );
  }
}
