import 'package:aiproof/constants/colors.dart';
import 'package:aiproof/utils/routes.dart';
import 'package:aiproof/widgets/components/buttons.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class APAppBarBottom extends StatefulWidget {
  final int activeIndex;

  const APAppBarBottom({super.key, required this.activeIndex});

  @override
  State<APAppBarBottom> createState() => _APAppBarBottomState();
}

class _APAppBarBottomState extends State<APAppBarBottom> {
  Widget buildContents() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        APNavButton(
          onPressed: () {
            if (ModalRoute.of(context)?.settings.name != Routes.home) {
              Navigator.of(context).push(createRoute(route: Routes.home));
            }
          },
          icon: Remix.home_4_line,
          text: "Home",
          isActive: widget.activeIndex == 1,
        ),
        APNavButton(
          onPressed: () {
            if (ModalRoute.of(context)?.settings.name != Routes.input) {
              Navigator.of(context).push(createRoute(route: Routes.input));
            }
          },
          icon: Remix.qr_scan_2_line,
          text: "Scan Input",
          isActive: widget.activeIndex == 2,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      color: APColor.light,
      child: buildContents(),
    );
  }
}
