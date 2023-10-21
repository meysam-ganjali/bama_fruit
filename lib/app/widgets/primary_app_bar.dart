
import 'package:bama_fruit/app/settings/theme_colors.dart';
import 'package:flutter/material.dart';

class PerimaryAppBar extends StatelessWidget {
  const PerimaryAppBar({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: ThemeColors.onPrimary,
      backgroundColor: ThemeColors.onPrimary,
      foregroundColor: ThemeColors.primary,
      centerTitle: true,
      title: Container(
        width: width / 4.5,
        height: 55,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: Image.asset("assets/images/logo5.png").image,
                fit: BoxFit.fill)),
      ),
    );
  }
}
