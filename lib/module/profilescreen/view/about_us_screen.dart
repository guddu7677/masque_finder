import 'package:flutter/material.dart';
import 'package:masque_finder/core/constats/app_images.dart';
import 'package:masque_finder/core/constats/app_textstyle.dart';
import 'package:masque_finder/core/widgets/appbarwhite_widget.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarwhiteWidget(text: "About Us"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 190,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(AppImages.homeBg),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "About Us",
              style: TextStyle(
                fontSize: 14.5,
                color: Color(0XFF16302C),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Container(
                  height: 2,
                  width: 40,
                  decoration: BoxDecoration(color: Color(0XFFC3F1C6)),
                ),
                SizedBox(width: 2,),
                 Container(
              height: 2,
              width: 18,
              decoration: BoxDecoration(color: Color(0XFF3EC67B)),
            ),
              ],
            ),
            SizedBox(height: 8,),
            Text("Welcome to Website Name!",style: AppTextstyle.semiblack14,),
            SizedBox(height: 8,),
            Text(
              "These terms and conditions outline the rules and regulations for the use of Company Name's Website, located at Website.com.",
              
              style: AppTextstyle.black14,),
          ],
        ),
      ),
    );
  }
}
