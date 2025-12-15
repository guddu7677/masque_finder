import 'package:flutter/material.dart';
import 'package:masque_finder/core/constats/app_colors.dart';
import 'package:masque_finder/core/constats/app_textstyle.dart';

class UniverselTextfield extends StatelessWidget {
  final String text;
  final String hinttext;

  const UniverselTextfield({
    super.key,
    required this.text,
    required this.hinttext,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: AppTextstyle.semiblack14,
        ),
        const SizedBox(height: 8),

        Container(
          height: 46,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.greencolor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 12,bottom: 16),
            child: TextField(
              textAlign: TextAlign.start,  
              decoration: InputDecoration(
                hintText: hinttext,
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12.5,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
