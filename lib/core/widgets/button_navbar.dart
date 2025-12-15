import 'package:flutter/material.dart';
import 'package:masque_finder/core/constats/app_colors.dart';
import 'package:masque_finder/core/constats/app_textstyle.dart';

class BottomBarButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final Color? color;
  BottomBarButton({required this.text, this.onTap,this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
        color: color,
        gradient: AppColors.appBackGroundColor),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              height: 44,
              width: double.infinity,
              decoration: BoxDecoration(

                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(child: Text(text, style: AppTextstyle.semi18white)),
            ),
          ),
        ),
      ),
    );
  }
}
