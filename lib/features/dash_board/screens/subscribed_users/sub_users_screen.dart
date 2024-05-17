import 'package:admin_panel/features/dash_board/dash_board_screen.dart';
import 'package:admin_panel/features/dash_board/screens/subscribed_users/controllers/sub_user_controller.dart';
import 'package:admin_panel/utils/const/colors.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
//import shadwon

import 'package:get/get.dart';
import 'package:admin_panel/features/dash_board/screens/subscribed_users/repositories/data/data.dart';

class SubscribedUsersScreen extends StatelessWidget {
  const SubscribedUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ASubUserController());

    return DashBoardScreen(
      headerText: "Subscibed Users",
      child: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
              child: CircularProgressIndicator(
            color: AColors.primaryColor,
          ));
        } else {
          // controller.searchController.value.text.isEmpty ? Data() : Data();
          return Obx(() {
            // String value = controller.serachText.value;

            final data = controller.filterData();

            return SizedBox(
              width: double.infinity,
              child: PaginatedDataTable(
                source: Data(data: data),
                columns: [
                  const DataColumn(label: Text('Email')),
                  const DataColumn(label: Text('Phone Number'), numeric: true),
                  const DataColumn(
                    //sort

                    label: Text('Current Plan'),
                  ),
                  DataColumn(
                    label: Row(
                      children: [
                        const Text('Expiry Date'),
                        const SizedBox(width: 5),
                        controller.asending.value
                            ? const Icon(IconsaxBold.arrow_up_1,
                                color: Colors.white)
                            : const Icon(IconsaxBold.arrow_down,
                                color: Colors.white)
                      ],
                    ),
                    onSort: (columnIndex, ascending) {
                      controller.sortData();
                    },
                  )
                ],
                dataRowMinHeight: kMinInteractiveDimension,
                rowsPerPage: 10,
              ),
            );
          });
        }
      }),
    );
  }
}
