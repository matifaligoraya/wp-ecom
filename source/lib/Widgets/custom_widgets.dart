import 'package:ecom_wp/Widgets/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Constants/app_colors.dart';

Widget searchBar(
    {TextEditingController? controller,
    String? hintText,
    void Function(String)? onChange,
    InputDecoration? decoration}) {
  return custom_text_field(
    controller: controller,
    hintText: hintText,
    decoration: decoration,
    onChange: onChange,
  );
}

Widget createBadge(Icon icon, String badgeContent) {
    return Stack(
      children: [
        icon,
        Positioned(
          right: 0.h,
          top: 10.h,
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.darkBlack,
            ),
            child: Text(
              badgeContent,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }