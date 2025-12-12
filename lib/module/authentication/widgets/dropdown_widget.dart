import 'package:flutter/material.dart';
import 'package:masque_finder/core/constats/app_colors.dart';
import 'package:masque_finder/core/constats/app_textstyle.dart';

class DropdownWidget extends StatelessWidget {
  final String text;
  final String hinttext;

  const DropdownWidget({required this.text,required this.hinttext});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text,style: AppTextstyle.semiblack14,),
       SizedBox(height: 8,),
       Container(height: 46,
       decoration: BoxDecoration(
        border: Border.all(color: AppColors.greencolor),
        borderRadius: BorderRadius.circular(8)
       ),
         child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(hinttext,style: TextStyle(color: Colors.grey,fontSize: 12.5),),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Icon(Icons.arrow_drop_down),
          )
         ],)
       )
      ],
    );
  }
}
