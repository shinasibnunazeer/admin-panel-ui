import 'package:admin_panel/common/widgets/dash_board/header.dart';
import 'package:admin_panel/features/dash_board/widgets/download_export_refresh.dart';
import 'package:admin_panel/utils/const/sizes.dart';
import 'package:admin_panel/utils/device/device_utils.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key, required this.headerText, this.child});
  final String headerText;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    bool ismobile = ADeviceUtils.isMobile(context);
    return ListView(
      children: [
        Padding(
          padding: ismobile
              ? const EdgeInsets.all(ASizes.defaultPaddingMobile)
              : const EdgeInsets.symmetric(
                  horizontal: ASizes.defaultPadding,
                  vertical: ASizes.defaultPaddingMobile),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(headerText,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 16),
              const Header(),
              const SizedBox(height: 16),
              const DownLoadExport(),
              const SizedBox(height: 16),
              child == null ? Container() : child!,
            ],
          ),
        ),
      ],
    );
  }
}
