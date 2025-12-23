import 'package:flutter/material.dart';
import 'package:masque_finder/core/constats/app_colors.dart';
import 'package:masque_finder/core/constats/app_textstyle.dart';

class AppbarwhiteWidget extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final Color? bgcolor;
  final VoidCallback? onTap;

  const AppbarwhiteWidget({
    super.key,
    required this.text,
    this.bgcolor,
    this.onTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgcolor,
        gradient: AppColors.appBackGroundColor),
      child: AppBar(
        
        scrolledUnderElevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Text(text, style: AppTextstyle.black700f16),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding:  EdgeInsets.all(8),
          child: Container(
            height: 38,
            width: 38,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.greencolor),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Center(child: Icon(Icons.arrow_back, color: Colors.black)),
            ),
          ),
        ),
      ),
    );
  }
}
