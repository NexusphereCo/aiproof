import 'package:aiproof/business_logic/appbar/appbar_bloc.dart';
import 'package:aiproof/constants/colors.dart';
import 'package:aiproof/constants/sizes.dart';
import 'package:aiproof/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:remixicon/remixicon.dart';

class APAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onDonePressed;
  final VoidCallback onDeletePressed;
  final VoidCallback onBackPressed;
  final FocusNode titleFocusNode;
  final FocusNode contentFocusNode;

  const APAppBar({
    super.key,
    required this.onDonePressed,
    required this.onDeletePressed,
    required this.onBackPressed,
    required this.titleFocusNode,
    required this.contentFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBarBloc, AppBarState>(
      builder: (context, state) {
        return AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              onBackPressed?.call();
              Navigator.of(context).pop();
            },
            icon: const Icon(Remix.arrow_left_s_line),
          ),
          actions: [
            if (state is EditingState)
              InkWell(
                onTap: () {
                  onDonePressed?.call();
                  titleFocusNode.unfocus();
                  contentFocusNode.unfocus();
                  context.read<AppBarBloc>().add(FocusChangedEvent(false));
                },
                child: APTypography.h3(
                  'Done',
                  color: APColor.dark,
                  fontWeight: APFontWeight.regular,
                ),
              ),
            const SizedBox(width: Spacing.md),
            if (state is DoneState)
              IconButton(
                onPressed: onDeletePressed,
                icon: const Icon(Remix.delete_bin_line),
              ),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
