import 'package:aiproof/constants/colors.dart';
import 'package:aiproof/constants/sizes.dart';
import 'package:aiproof/constants/typography.dart';
import 'package:aiproof/modules/home/enums/doc_view.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class ViewToggle extends StatefulWidget {
  final DocView documentView;
  final void Function(DocView) onViewChanged;

  const ViewToggle({super.key, required this.documentView, required this.onViewChanged});

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

    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            APTypography.base("items"),
            GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Remix.sort_alphabet_asc),
                    iconSize: 20,
                  ),
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
              alignment: Alignment.topCenter,
              scale: 0.8,
              child: SegmentedButton<DocView>(
                segments: const <ButtonSegment<DocView>>[
                  ButtonSegment<DocView>(
                    value: DocView.list,
                    icon: Icon(Remix.list_unordered),
                  ),
                  ButtonSegment<DocView>(
                    value: DocView.carousel,
                    icon: Icon(Remix.carousel_view),
                  ),
                  ButtonSegment<DocView>(
                    value: DocView.grid,
                    icon: Icon(Remix.gallery_view_2),
                  ),
                ],
                selected: <DocView>{widget.documentView},
                onSelectionChanged: (Set<DocView> value) {
                  widget.onViewChanged(value.first);
                },
                showSelectedIcon: false,
                style: buttonStyle,
              ),
            ),
          ],
        )
      ],
    );
  }
}
