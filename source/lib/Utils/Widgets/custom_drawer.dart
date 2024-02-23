// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Constants/app_colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      shape: const OutlineInputBorder(borderRadius: BorderRadius.zero),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ////main
          Container(
            width: double.infinity.w,
            height: 60.h,
            decoration: const BoxDecoration(
              color: AppColors.primaryYellow,
              // border: Border(bottom: BorderSide(color: Colors.grey))
            ),
            child: Row(
              children: [
                ///
                Text(
                  'Main Menu',
                  style: TextStyle(
                      color: AppColors.darkBlack,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp),
                )
              ],
            ).paddingOnly(left: 15.0, top: 25.0),
          ),
          CustomExpansionTile(
            isButtonAllow: true,
            expensionTitle: 'ExpensionTile',
            expensionTilechildrenWidgets: [
              ListTile(
                title: Text(
                  'Consumer',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'Electronics',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                  ),
                ),
              )
            ],
          ),
          CustomExpansionTile(
            title: 'Container',
          ),
        ],
      ),
    );
  }
}

class CustomExpansionTile extends StatefulWidget {
  bool? isButtonAllow;
  String? title;
  String? expensionTitle;
  List<Widget>? expensionTilechildrenWidgets;
  CustomExpansionTile(
      {super.key,
      this.isButtonAllow = false,
      this.expensionTilechildrenWidgets,
      this.expensionTitle,
      this.title});

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  double additionalContentHeight = 0.0;

  @override
  Widget build(BuildContext context) {
    return widget.isButtonAllow == true
        ? ExpansionTile(
            backgroundColor: Colors.white,
            collapsedBackgroundColor: Colors.white,
            shape: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.darkBlack)),
            collapsedShape: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.darkBlack)),
            trailing: const Icon(Icons.add),
            title: Text(
              widget.expensionTitle ?? '',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
              ),
            ),
            children: widget.expensionTilechildrenWidgets ?? [],
          )
        : Container(
            width: double.infinity.w,
            height: 50.h,
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: AppColors.darkBlack)),
            ),
            child: Text(
              widget.title ?? '',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
              ),
            ).paddingOnly(top: 20.0, left: 15.0),
          );
  }
}
