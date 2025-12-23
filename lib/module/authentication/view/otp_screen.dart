import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:masque_finder/core/constats/app_colors.dart';
import 'package:masque_finder/core/constats/app_images.dart';
import 'package:masque_finder/core/constats/app_textstyle.dart';
import 'package:masque_finder/core/widgets/appbar_widget.dart';
import 'package:masque_finder/core/widgets/button_navbar.dart';
import 'package:masque_finder/module/authentication/provider/auth_provider.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController pinputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(text: 'OTP'),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: AppColors.appBackGroundColor),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(AppImages.otpImage),
                  SizedBox(height: 12),
                  Text("Enter Otp", style: AppTextstyle.black700f18),
                  SizedBox(height: 8),
                  Text(
                    "An OTP has been sent on your +91 87******09 mobile number.",
                    style: AppTextstyle.regblack16,
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.edit,
                            color: AppColors.greencolor,
                            size: 16,
                          ),
                          Container(
                            width: 16,
                            height: 1,
                            color: AppColors.greencolor,
                          ),
                        ],
                      ),

                      const SizedBox(width: 8),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Edit Mobile Number",
                            strutStyle: const StrutStyle(
                              height: 1,
                              forceStrutHeight: true,
                            ),
                            style: AppTextstyle.boldblack14.copyWith(height: 1),
                          ),
                          Container(height: 1, width: 115, color: Colors.black),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 16),
                  Pinput(
                    controller: pinputController,
                    length: 6,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    defaultPinTheme: PinTheme(
                      height: 50,
                      width: 50,
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.greencolor),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),

                  SizedBox(height: 16),
                  Row(
                    children: [
                      Text("59s remaining", style: AppTextstyle.black14),
                      Text(". Resend", style: AppTextstyle.semiblack14),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomBarButton(
        text: "Verify OTP",
        onTap: () {
          context.read<AuthNavigationProvider>().goToProfile(context);
        },
      ),
    );
  }
}
