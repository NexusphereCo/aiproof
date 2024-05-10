import 'package:aiproof/business_logic/document/document_bloc.dart';
import 'package:aiproof/constants/assets.dart';
import 'package:aiproof/constants/sizes.dart';
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
                  const Padding(
                    padding: EdgeInsets.all(Global.paddingBody),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        HeaderLogo(),
                        SizedBox(height: Spacing.xl),
                        APSearchBar(),
                        SizedBox(height: Spacing.xxxl),
                        ViewToggle(),
                      ],
                    ),
                  ),
                ],
              ),
              const ViewDocument(),
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
