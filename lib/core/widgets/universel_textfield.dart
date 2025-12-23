import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:masque_finder/core/constats/app_colors.dart';
import 'package:masque_finder/core/constats/app_textstyle.dart';

class UniverselTextfield extends StatelessWidget {
  final String text;
  final String hinttext;
  final TextInputType keyboardType;

  const UniverselTextfield({
    super.key,
    required this.text,
    required this.hinttext,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    List<TextInputFormatter> inputFormatters = [];
    if (keyboardType == TextInputType.number) {
      inputFormatters.addAll([
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(3),
      ]);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: AppTextstyle.semiblack14,
        ),
        const SizedBox(height: 8,),
        Container(
          height: 46,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.greencolor),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.only(left: 12,bottom: 15),
          child: TextField(
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
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
      ],
    );
  }
}
