import 'package:admin_panel/common/widgets/dash_board/header.dart';
import 'package:admin_panel/features/dash_board/widgets/download_export_refresh.dart';
import 'package:admin_panel/utils/const/sizes.dart';
import 'package:admin_panel/utils/device/device_utils.dart';
import 'package:flutter/material.dart';

class AAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AAppBar({super.key, required this.headerText});
  final String headerText;

  @override
  Widget build(BuildContext context) {
    bool ismobile = ADeviceUtils.isMobile(context);
    return Padding(
      padding: ismobile
          ? const EdgeInsets.all(ASizes.defaultPaddingMobile)
          : const EdgeInsets.all(ASizes.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Header(),
          const SizedBox(height: 16),
          Text(headerText, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 16),
          const DownLoadExport(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(100);
}
