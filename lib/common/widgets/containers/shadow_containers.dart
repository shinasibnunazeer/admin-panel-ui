import 'package:admin_panel/utils/const/colors.dart';
import 'package:flutter/material.dart';

class ShadowConatiner extends StatelessWidget {
  const ShadowConatiner({
    super.key,
    this.child,
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      //padding
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        //boder edge
        borderRadius: BorderRadius.circular(10.0),

        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AColors.primaryColor.withOpacity(0.1),
            blurRadius: 4.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: child,
    );
  }
}
