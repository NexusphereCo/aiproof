import 'package:ai_proof/constants/sizes.dart';
import 'package:ai_proof/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class IconStyle extends StatelessWidget {
  const IconStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        h1(text: "Icons Style"),
        SizedBox(height: Spacing.sm),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Remix.home_4_line),
            Icon(Remix.qr_scan_2_line),
            Icon(Remix.camera_line),
            Icon(Remix.list_unordered),
            Icon(Remix.carousel_view),
            Icon(Remix.gallery_view_2),
            Icon(Remix.sort_desc),
            Icon(Remix.file_search_line),
          ],
        ),
        SizedBox(height: Spacing.md),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Remix.arrow_left_line),
            Icon(Remix.loop_right_line),
            Icon(Remix.download_line),
            Icon(Remix.close_line),
            Icon(Remix.arrow_down_s_line),
            Icon(Remix.verified_badge_line),
            Icon(Remix.share_line),
            Icon(Remix.more_line),
          ],
        ),
      ],
    );
  }
}
