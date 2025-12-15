import 'package:flutter/material.dart';
import 'package:masque_finder/core/constats/app_colors.dart';
import 'package:masque_finder/core/constats/app_textstyle.dart';

class CustomAppBar extends StatelessWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding:  EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        // gradient: AppColors.appBackGroundColor,
      ),
      child: Row(
        children: [
          Container(
            height: 38,
            width: 38,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.greencolor),
              color: Colors.white,
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back, size: 20),
            ),
          ),
           SizedBox(width: 12),
          Text(title, style: AppTextstyle.black700f16),
        ],
      ),
    );
  }
}
