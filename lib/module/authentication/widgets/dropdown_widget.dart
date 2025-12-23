import 'package:flutter/material.dart';
import 'package:masque_finder/core/constats/app_colors.dart';
import 'package:masque_finder/core/constats/app_textstyle.dart';

class DropdownWidget extends StatefulWidget {
  final String text;
  final String hinttext;
  final List<String> items;

  const DropdownWidget({
    super.key,
    required this.text,
    required this.hinttext,
    required this.items,
  });

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.text, style: AppTextstyle.semiblack14),
        const SizedBox(height: 8),
        Container(
          height: 46,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.greencolor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              hint: Text(
                widget.hinttext,
                style: const TextStyle(color: Colors.grey, fontSize: 12.5),
              ),
              value: selectedValue,
              icon: const Icon(Icons.arrow_drop_down),
              items: widget.items
                  .map(
                    (value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
