import 'package:admin_panel/features/dash_board/dash_board_screen.dart';
import 'package:admin_panel/features/dash_board/screens/auth_partners/controller/auth_user_controller.dart';
import 'package:admin_panel/features/dash_board/screens/auth_partners/data/data.dart';
import 'package:admin_panel/features/dash_board/screens/subscribed_users/repositories/data/data.dart';
import 'package:admin_panel/utils/const/colors.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthPartnersScreen extends StatelessWidget {
  const AuthPartnersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AAuthUserController.instance;

    return DashBoardScreen(
      headerText: "Authorised Partners",
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

            final data = controller.searchData();

            return SizedBox(
              width: double.infinity,
              child: PaginatedDataTable(
                source: AuthData(data: data),
                columns: const [
                  DataColumn(label: Text('Email')),
                  DataColumn(label: Text('Phone Number'), numeric: true),
                  DataColumn(
                    //sort

                    label: Text('Current Plan'),
                  ),
                  DataColumn(
                    label: Text('Expiry Date'),
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
