import 'package:admin_panel/features/dash_board/screens/subscribed_users/controllers/sub_user_controller.dart';
import 'package:admin_panel/utils/const/colors.dart';
import 'package:admin_panel/utils/device/device_utils.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //text editing controller
    final TextEditingController searchController = TextEditingController();

    final controller = ASubUserController.instance;
    bool isMobile = ADeviceUtils.isMobile(context);
    return SizedBox(
      width: isMobile ? 150 : 300,
      child: TextField(
        controller: searchController,
        onEditingComplete: () {},
        onChanged: (value) {
          value.isEmpty
              ? controller.serchResult.clear()
              : controller.searchData(value);
        },
        cursorColor: AColors.primaryColor,
        decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: const Icon(IconsaxBold.search_normal),
            suffixIcon: IconButton(
                onPressed: () {
                  searchController.clear();
                  controller.serchResult.clear();
                },
                icon: const Icon(IconsaxBold.close_circle))),
      ),
    );
  }
}
