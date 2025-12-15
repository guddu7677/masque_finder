import 'package:flutter/material.dart';
import 'package:masque_finder/core/constats/app_colors.dart';
import 'package:masque_finder/core/constats/app_textstyle.dart';

class tabContainer extends StatelessWidget {
  final double width;
  final String text;
  final Color colorc;
  const tabContainer({required this.width, required this.text,required this.colorc});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 26,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color:colorc
      ),
      child: Center(child: Text(text, style: AppTextstyle.black500s12)),
    );
  }
}
