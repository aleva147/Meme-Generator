import 'package:flutter/material.dart';
import 'theme/colors/colors.dart';



class Separator extends StatelessWidget {
  const Separator({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: 2,
      child: ColoredBox(color: AppColors.separator),
    );
  }
}
