import 'package:ecom_wp/Utils/Constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WhishListScreen extends StatefulWidget {
  const WhishListScreen({super.key});

  @override
  State<WhishListScreen> createState() => _WhishListScreenState();
}

class _WhishListScreenState extends State<WhishListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ////text 
          Center(child: Text('WhishList',style: TextStyle(fontSize: 30.sp,fontWeight: FontWeight.bold,color: AppColors.darkBlack),))
        ],
      ),
    );
  }
}