import 'package:flutter/material.dart';
import 'package:masque_finder/core/constats/app_colors.dart';
import 'package:masque_finder/core/constats/app_images.dart';
import 'package:masque_finder/core/constats/app_textstyle.dart';
import 'package:masque_finder/module/authentication/view/login_screen.dart';

class SlideToContinue extends StatefulWidget {
  @override
  _SlideToContinueState createState() => _SlideToContinueState();
}

class _SlideToContinueState extends State<SlideToContinue> {
  double _dragPosition = 0.0;
  final double _maxDrag = 240;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      _dragPosition = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 54, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Swipe to Continue!", style: AppTextstyle.semi18white),
                  Image.asset(appSvgimge.sliderSvg),
                ],
              ),
            ),
          ),

          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
            left: _dragPosition,
            child: GestureDetector(
              onHorizontalDragUpdate: (details) {
                setState(() {
                  _dragPosition += details.delta.dx;

                  if (_dragPosition < 0) _dragPosition = 0;
                  if (_dragPosition > _maxDrag) _dragPosition = _maxDrag;
                });
              },

              onHorizontalDragEnd: (details) {
                if (_dragPosition >= _maxDrag * 0.8) {
                  _dragPosition = 0;

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => LoginScreen()),
                  );
                } else {
                  setState(() => _dragPosition = 0);
                }
              },

              child: Container(
                height: 44,
                width: 44,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  appSvgimge.splashSvg,
                  height: 38,
                  width: 38,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
