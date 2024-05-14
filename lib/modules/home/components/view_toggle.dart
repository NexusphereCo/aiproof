import 'package:aiproof/bloc/document/document_bloc.dart';
import 'package:aiproof/bloc/document_view/document_view_bloc.dart';
import 'package:aiproof/constants/colors.dart';
import 'package:aiproof/constants/sizes.dart';
import 'package:aiproof/constants/typography.dart';
import 'package:aiproof/modules/home/enums/doc_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remixicon/remixicon.dart';

class ViewToggle extends StatefulWidget {
  const ViewToggle({super.key});

  @override
  State<ViewToggle> createState() => _ViewToggleState();
}

class _ViewToggleState extends State<ViewToggle> {
  @override
  Widget build(BuildContext context) {
    var buttonStyle = ButtonStyle(
      iconColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return APColor.dark; // Use the color you want when selected
          }
          return APColor.dark.withOpacity(0.5); // Use the default value when not selected
        },
      ),
      side: MaterialStatePropertyAll(BorderSide(color: APColor.primary.withOpacity(0.1))),
      foregroundColor: MaterialStateProperty.all(APColor.dark),
      enableFeedback: true,
      iconSize: MaterialStateProperty.all(26.0),
      padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 20)),
      overlayColor: MaterialStateProperty.all(APColor.primary[100]),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(APBorderRadius.sm))),
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return APColor.primary.withOpacity(0.3); // Use the color you want when selected
          }
          return APColor.light.withOpacity(0); // Use the default value when not selected
        },
      ),
    );
    return BlocBuilder<DocumentBloc, DocumentState>(
      builder: (context, state) {
        int docLength;

        switch (state.runtimeType) {
          case const (LoadedDocumentState):
            docLength = (state as LoadedDocumentState).documents.length;
            break;
          case const (FilteredDocument):
            docLength = (state as FilteredDocument).documents.length;
            break;
          default:
            docLength = 0;
            break;
        }
        String itemText = docLength <= 1 ? "item" : "items";

        return SizedBox(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  APTypography.base("$docLength $itemText"),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(Remix.sort_alphabet_asc, size: 20),
                        const SizedBox(width: Spacing.xs),
                        APTypography.base("Sort"),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform.scale(
                    alignment: Alignment.center,
                    scale: 0.8,
                    child: BlocBuilder<DocViewBloc, DocViewState>(
                      builder: (context, state) {
                        return SegmentedButton<DocView>(
                          segments: const <ButtonSegment<DocView>>[
                            ButtonSegment<DocView>(value: DocView.list, icon: Icon(Remix.list_unordered)),
                            ButtonSegment<DocView>(value: DocView.carousel, icon: Icon(Remix.carousel_view)),
                            ButtonSegment<DocView>(value: DocView.grid, icon: Icon(Remix.gallery_view_2)),
                          ],
                          selected: <DocView>{state.docView},
                          onSelectionChanged: (Set<DocView> value) {
                            context.read<DocViewBloc>().add(DocViewEvent(value.first));
                          },
                          showSelectedIcon: false,
                          style: buttonStyle,
                        );
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
