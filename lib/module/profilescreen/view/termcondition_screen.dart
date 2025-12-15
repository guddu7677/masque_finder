import 'package:flutter/material.dart';
import 'package:masque_finder/core/constats/app_images.dart';
import 'package:masque_finder/core/constats/app_textstyle.dart';
import 'package:masque_finder/core/widgets/appbarwhite_widget.dart';

class TermconditionScreen extends StatefulWidget {
  const TermconditionScreen({super.key});

  @override
  State<TermconditionScreen> createState() => _teState();
}

class _teState extends State<TermconditionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppbarwhiteWidget(text: "About Us"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
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
