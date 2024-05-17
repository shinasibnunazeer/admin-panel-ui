import 'package:admin_panel/common/widgets/buttons/auth/log_out_button.dart';
import 'package:admin_panel/common/widgets/dash_board/header.dart';
import 'package:admin_panel/common/widgets/text_filed/search/search.dart';
import 'package:admin_panel/features/dash_board/dash_board_screen.dart';
import 'package:admin_panel/features/dash_board/screens/all_coustomers/coustomers.dart';
import 'package:admin_panel/features/dash_board/screens/auth_partners/authorised_partners.dart';
import 'package:admin_panel/features/dash_board/screens/subscribed_users/sub_users_screen.dart';
import 'package:admin_panel/utils/const/colors.dart';
import 'package:admin_panel/utils/const/sizes.dart';
import 'package:flutter/material.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

class ANavigationMenu extends StatelessWidget {
  const ANavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navigationController =
        Get.put(NavigationController());
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: AColors.primaryColor,
      //   actions: [
      //     Search(),
      //     const Spacer(),
      //     const ALogoutButton(),
      //   ],
      // ),
      body: SafeArea(
        child: Row(
          children: <Widget>[
            Obx(
              () => NavigationRail(
                //SPACE

                selectedIndex: navigationController.currentIndex.value,
                onDestinationSelected: navigationController.updateIndex,
                extended: false,
                indicatorColor: AColors.iconColorWhite.withOpacity(0.1),
                backgroundColor: AColors.primaryColor,
                unselectedIconTheme: const IconThemeData(color: Colors.grey),
                selectedIconTheme:
                    const IconThemeData(color: AColors.iconColorWhite),
                destinations: [
                  {const Text('home'): IconsaxBold.home},
                  {const Text('Subscribed Users'): IconsaxBold.user},
                  {const Text('AuthPartners'): IconsaxBold.share},
                  {const Text('All Coutomers'): IconsaxBold.profile_2user},
                  {const Text('Reoprts'): IconsaxBold.document_download},
                ]
                    .map(
                      (labes) => NavigationRailDestination(
                        padding:
                            const EdgeInsets.only(bottom: ASizes.navRailSpace),
                        icon: Icon(labes.values.first),
                        label: labes.keys.first,
                      ),
                    )
                    .toList(),
              ),
            ),
            Expanded(
              child: Obx(() => navigationController
                  .pages[navigationController.currentIndex.value]),
            )
          ],
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  static NavigationController get instance => Get.find();

  final currentIndex = 0.obs;

  //update
  void updateIndex(index) => currentIndex.value = index;

  //4 containers
  final List<Widget> pages = [
    const SubscribedUsersScreen(),
    const AuthPartnersScreen(),
    const DashBoardScreen(
      headerText: "DashBoard",
    ),
    SubscribedUsersScreen(),
    const AllCoutomers(),
    Container(
      color: Colors.white,
      child: const Center(
          child: Text("Reports",
              style: TextStyle(fontSize: 20, color: Colors.black))),
    ),
  ];
}
