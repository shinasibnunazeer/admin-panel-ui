import 'package:admin_panel/features/dash_board/screens/auth_partners/controller/auth_user_controller.dart';
import 'package:admin_panel/features/dash_board/screens/subscribed_users/controllers/sub_user_controller.dart';
import 'package:admin_panel/navigation_menu.dart';
import 'package:admin_panel/utils/const/colors.dart';
import 'package:admin_panel/utils/device/device_utils.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Search extends StatelessWidget {
  const Search({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //text editing controller

    final navContoller = NavigationController.instance;
    final controller1 = ASubUserController.instance;

    final controller2 = Get.put(AAuthUserController());
    bool isMobile = ADeviceUtils.isMobile(context);
    TextEditingController searchController = TextEditingController(
      text: navContoller.currentIndex.value == 0
          ? controller1.serachText.value
          : controller2.serachText.value,
    );
    return SizedBox(
      width: isMobile ? 150 : 300,
      child: TextField(
        controller: searchController,
        onEditingComplete: () {},
        onChanged: (value) {
          navContoller.currentIndex.value == 0
              ? controller1.searchText(value)
              : controller2.searchText(value);
        },
        cursorColor: AColors.primaryColor,
        decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: const Icon(IconsaxBold.search_normal),
            suffixIcon: IconButton(
                onPressed: () {
                  searchController.clear();

                  navContoller.currentIndex.value == 0
                      ? controller1.searchText('')
                      : controller2.searchText('');

                  // controller.searchController.value.clear();
                },
                icon: const Icon(IconsaxBold.close_circle))),
      ),
    );
  }
}
