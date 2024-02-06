// ignore_for_file: must_be_immutable, camel_case_types, file_names

import 'package:ecom_wp/Constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class custom_text_field extends StatelessWidget {
  TextEditingController? controller;
  InputDecoration? decoration;
  FocusNode? focusNode;
  bool? obscureText;
  String? hintText;
  void Function(String)? onFieldSubmitted;
  void Function(String)? onChange;
  custom_text_field(
      {super.key,
      this.controller,
      this.decoration,
      this.focusNode,
      this.onFieldSubmitted,
      this.hintText,
      this.onChange,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      focusNode: focusNode,
      controller: controller,
      onChanged: onChange,
      textAlignVertical: TextAlignVertical.center,
      decoration: decoration ??
          InputDecoration(
            fillColor: Colors.white,
            filled: true,
            suffixIcon: Container(
              color: AppColors.darkBlack,
              child: Icon(Icons.search_rounded,color: Colors.white,size: 20.h,).paddingSymmetric(vertical: 10.h,horizontal: 15.w),
            ),
              hintText: hintText,
              hintStyle:
                  const TextStyle( color: Colors.grey),
              isDense: true,
              border: InputBorder.none
              // enabledBorder: OutlineInputBorder(
              //     borderRadius: const BorderRadius.all(Radius.circular(16.0)),
              //     borderSide: BorderSide(color: Colors.)),
              // focusedBorder: const OutlineInputBorder(
              //     borderRadius: BorderRadius.all(Radius.circular(16.0)),
              //     borderSide: BorderSide(color: kdarkBlue900))
              ),
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}