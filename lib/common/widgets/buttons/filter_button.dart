import 'package:flutter/material.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:admin_panel/features/dash_board/screens/subscribed_users/controllers/sub_user_controller.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = ASubUserController.instance;
    return Tooltip(
      message: 'Filter by date',
      child: IconButton(
          onPressed: () {
            showDateRangePicker(
              context: context,
              firstDate: DateTime(2020),
              lastDate: DateTime(2030),
            ).then((pickedRange) {
              if (pickedRange != null) {
                controller.filterData(pickedRange.start, pickedRange.end);
              }
            });
          },
          icon: const Icon(
            IconsaxBold.filter,
            size: 30,
          )),
    );
  }
}
