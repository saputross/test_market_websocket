// ignore_for_file: file_names


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_market_websocket/app/config/themes/app_colors.dart';
import 'package:test_market_websocket/app/config/themes/app_fonts.dart';


class ItemMenuNavbar extends StatelessWidget {
  const ItemMenuNavbar({
    super.key,
    required this.icon,
    required this.selected,
    required this.onPressed,
    required this.text,
  });
  final String icon, text;
  final bool selected;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset(
                selected ? "$icon-active.svg" : "$icon-non-active.svg",
                height: 20,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              text,
              style: TextStyle(
                fontFamily: AppFonts.POPPINS_MED,
                color: selected ? AppColors.primaryVariant : AppColors.white,
                fontWeight: selected ? FontWeight.w500 : FontWeight.w400,
                fontSize: 9,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
