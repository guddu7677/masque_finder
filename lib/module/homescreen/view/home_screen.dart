import 'package:flutter/material.dart';
import 'package:masque_finder/core/constats/app_images.dart';
import 'package:masque_finder/core/constats/app_textstyle.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Row(children: [
          Container(height: 38,width: 38,
          decoration: BoxDecoration(shape: BoxShape.circle,
          image: DecorationImage(image: AssetImage(AppImages.homProfileImg),fit: BoxFit.cover)
          ),
          ),
          SizedBox(width: 8,),
          Column(children: [
            Text("Welcome Back!",style: AppTextstyle.white700f16,),
            SizedBox(height: 4,),
            Row(children: [
              Icon(Icons.location_on_outlined,color: Colors.amber,size: 15,),
              SizedBox(width: 4,),
              Text("Current Location here",style: AppTextstyle.white14,)
            ],)
          ],)
        ],),
        Text.rich(TextSpan(children: [
          TextSpan(text: "01",style: TextStyle(color: Colors.amber,fontSize: 18.5,fontWeight: FontWeight.w700)),
          TextSpan(text: "Jumada Al-Awwal 1447",style: TextStyle(color: Colors.white,fontSize: 18.5,fontWeight: FontWeight.w700))
        ]))
      ],),
    );
  }
}
