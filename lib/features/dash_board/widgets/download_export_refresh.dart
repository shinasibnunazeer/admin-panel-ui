import 'package:admin_panel/common/widgets/buttons/filter_button.dart';
import 'package:admin_panel/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:admin_panel/features/dash_board/screens/subscribed_users/controllers/sub_user_controller.dart';

class DownLoadExport extends StatelessWidget {
  const DownLoadExport({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = ASubUserController.instance;

    return Row(
      children: [
        Tooltip(
          message: 'Export',
          child: IconButton(
              onPressed: () {
                controller.exportToExcel();
              },
              icon: const Icon(
                IconsaxBold.document_download,
                size: 30,
              )),
        ),
        const SizedBox(width: 16),
        const FilterButton(),
        const Spacer(),
        Tooltip(
          message: 'Refresh',
          child: IconButton(
              onPressed: () {
                // controller.serchResult.clear();
                controller.getSubscribedUserData();
              },
              icon: const Icon(IconsaxBold.refresh)),
        ),
      ],
    );
  }
}
