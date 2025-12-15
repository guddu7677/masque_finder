import 'package:flutter/material.dart';
import 'package:masque_finder/core/constats/app_images.dart';
import 'package:masque_finder/core/constats/app_textstyle.dart';

class WeatherWidget extends StatelessWidget {
  final Gradient? bgGradient;
  final BorderRadius? borderRadius;
  final Color? color;
  const WeatherWidget({
    super.key,
    this.bgGradient,
    this.borderRadius,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 90,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: color,
          gradient: bgGradient,
          borderRadius: borderRadius,
          border: const Border(
            left: BorderSide(color: Color(0xFFE3E3E3)),
            right: BorderSide(color: Color(0xFFE3E3E3)),
            bottom: BorderSide(color: Color(0xFFE3E3E3)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            _WeatherItem(title: "Fajr", time: "4:15 AM"),
            _VerticalDivider(),
            _WeatherItem(title: "Dhuhr", time: "1:44 PM"),
            _VerticalDivider(),
            _WeatherItem(title: "Asr", time: "4:30 PM"),
            _VerticalDivider(),
            _WeatherItem(title: "Maghrib", time: "6:15 PM"),
            _VerticalDivider(),
            _WeatherItem(title: "Isha", time: "8:15 PM"),
          ],
        ),
      ),
    );
  }
}

class _WeatherItem extends StatelessWidget {
  final String title;
  final String time;

  const _WeatherItem({required this.title, required this.time});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: AppTextstyle.green14semi),
        const SizedBox(height: 4),
        Image.asset(appSvgimge.ssunimage, height: 18, width: 18),
        const SizedBox(height: 4),
        Text(time, style: AppTextstyle.green14semi),
      ],
    );
  }
}

/// ================= VERTICAL DIVIDER =================
class _VerticalDivider extends StatelessWidget {
  const _VerticalDivider();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: VerticalDivider(width: 12, thickness: 1, color: Colors.black26),
    );
  }
}
