import 'package:aiproof/constants/colors.dart';
import 'package:aiproof/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

enum View { list, carousel, gallery }

class ViewButton extends StatefulWidget {
  const ViewButton({super.key});

  @override
  State<ViewButton> createState() => _ViewButtonState();
}

class _ViewButtonState extends State<ViewButton> {
  View documentView = View.carousel;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      alignment: Alignment.topCenter,
      scale: 0.8,
      child: SegmentedButton<View>(
        segments: const <ButtonSegment<View>>[
          ButtonSegment<View>(
            value: View.list,
            icon: Icon(Remix.list_unordered),
          ),
          ButtonSegment<View>(
            value: View.carousel,
            icon: Icon(Remix.carousel_view),
          ),
          ButtonSegment<View>(
            value: View.gallery,
            icon: Icon(Remix.gallery_view_2),
          ),
        ],
        selected: <View>{documentView},
        onSelectionChanged: (Set<View> value) {
          setState(() {
            documentView = value.first;
          });
        },
        showSelectedIcon: false,
        style: ButtonStyle(
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
        ),
      ),
    );
  }
}
