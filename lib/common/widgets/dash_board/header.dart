import 'package:admin_panel/common/widgets/buttons/auth/log_out_button.dart';
import 'package:admin_panel/common/widgets/text_filed/search/search.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        //serch bar
        Search(),
        Spacer(),
        ALogoutButton()
      ],
    );
  }
}
