import 'package:admin_panel/utils/const/colors.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';

class ALogoutButton extends StatelessWidget {
  const ALogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Logout',
      child: CircleAvatar(
        backgroundColor: AColors.primaryColor,
        child: IconButton(
          icon: const Icon(
            IconsaxBold.logout,
            color: AColors.iconColorWhite,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
