import 'package:admin_panel/utils/const/colors.dart';
import 'package:admin_panel/utils/device/device_utils.dart';
import 'package:flutter/material.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:admin_panel/features/dash_board/screens/subscribed_users/controllers/sub_user_controller.dart';
import 'package:get/get.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = ASubUserController.instance;
    //is mobile
    bool isMobie = ADeviceUtils.isMobile(context);
    return Obx(() {
      return Row(
        children: [
          Tooltip(
            message: 'Filter by date',
            child: IconButton(
                onPressed: () {
                  !controller.dateTimeIsSelected()
                      ? showDateRangePicker(
                          initialDateRange: DateTimeRange(
                              start: DateTime(2023, 1), end: DateTime(2100, 1)),
                          initialEntryMode: DatePickerEntryMode.input,
                          context: context,
                          firstDate: DateTime(2023, 1),
                          lastDate: DateTime(2100, 1),
                        ).then((pickedRange) {
                          if (pickedRange != null) {
                            controller.updateDateValues(
                                pickedRange.start, pickedRange.end);
                          }
                        })
                      : controller.removeFilter();
                },
                icon: Icon(
                  IconsaxBold.filter,
                  color: controller.dateTimeIsSelected()
                      ? Colors.red
                      : AColors.iconPrimaryColor,
                  size: 30,
                )),
          ),
          const SizedBox(width: 10),
          controller.dateTimeIsSelected()
              ? !isMobie
                  ? Text(
                      '${controller.startDate?.value.day}/${controller.startDate?.value.month}/${controller.startDate?.value.year} - ${controller.endDate?.value.day}/${controller.endDate?.value.month}/${controller.endDate?.value.year}')
                  : const SizedBox()
              : const SizedBox(),
        ],
      );
    });
  }
}
