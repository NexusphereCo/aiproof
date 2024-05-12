import 'package:aiproof/business_logic/document/document_bloc.dart';
import 'package:aiproof/constants/colors.dart';
import 'package:aiproof/constants/sizes.dart';
import 'package:aiproof/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class APSearchBar extends StatefulWidget {
  final FocusNode focusNode;
  const APSearchBar({super.key, required this.focusNode});

  @override
  _APSearchBarState createState() => _APSearchBarState();
}

class _APSearchBarState extends State<APSearchBar> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        APTypography.h1("Greetings!", color: APColor.light),
        const SizedBox(height: Spacing.sm),
        TextField(
          controller: _searchController,
          focusNode: widget.focusNode,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: 'Search',
            prefixIcon: Icon(Icons.search, color: APColor.primary),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(APBorderRadius.md)),
              borderSide: BorderSide.none,
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(APBorderRadius.md)),
              borderSide: BorderSide.none,
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(APBorderRadius.md)),
              borderSide: BorderSide.none,
            ),
            hintStyle: TextStyle(color: APColor.primary),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
          ),
          onChanged: (query) {
            context.read<DocumentBloc>().add(FilterDocumentsEvent(query));
          },
        ),
      ],
    );
  }
}
