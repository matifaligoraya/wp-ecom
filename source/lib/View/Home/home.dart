import 'package:ecom_wp/Utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Constants/app_colors.dart';
import '../../Widgets/custom_widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  var iconList = [
    createBadge(
      Icon(
        Icons.favorite_border_rounded,
        color: AppColors.darkBlack,
        size: 30.h,
      ),
      '0',
    ),
    SizedBox(width: 5.w),
    createBadge(
      Icon(
        Icons.wallet_rounded,
        color: AppColors.darkBlack,
        size: 30.h,
      ),
      '0',
    ),
    SizedBox(width: 5.w),
    createBadge(
      Icon(
        Icons.person_outline_rounded,
        color: AppColors.darkBlack,
        size: 30.h,
      ),
      '0',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      key: _scaffoldKey,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.darkPrimaryYellow,
          bottom: PreferredSize(
            preferredSize: Size(double.infinity.w, 90.h),
            child: Stack(
              children: [
                //bottom
                Container(
                  color: AppColors.primaryYellow,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      //appLogo and userSection
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          networkImage(
                              'https://store.sublimescripts.com/wp-content/uploads/2024/02/logo_light.png',
                              40.h,
                              120.w),
                          Row(children: iconList)
                        ],
                      ).paddingSymmetric(horizontal: 10.0.w),
                      SizedBox(
                        height: 5.h,
                      ),

                      //search box
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.menu,
                              color: AppColors.darkBlack,
                              size: 30.h,
                            ),
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onPressed: () =>
                                _scaffoldKey.currentState!.openDrawer(),
                          ),
                          Expanded(
                            child: searchBar(hintText: 'I\'m shopping for.....')
                                .paddingSymmetric(
                              horizontal: 15.0.w,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      )
                    ],
                  ),
                ).paddingOnly(top: 30.0.h),
                Container(
                  width: double.infinity.w,
                  height: 30.h,
                  color: AppColors.darkPrimaryYellow,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DropdownButton<String>(
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 20.h,
                          color: AppColors.darkBlack,
                        ),
                        items: [
                          'Us Dollar ',
                          'Euro',
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          // Handle dropdown value change
                        },
                        hint: const Text(
                          'Us Dollar',
                          style: TextStyle(color: AppColors.darkBlack),
                        ),
                      ),
                      DropdownButton<String>(
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 20.h,
                          color: AppColors.darkBlack,
                        ),
                        items: [
                          'French',
                          'German',
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          // Handle dropdown value change
                        },
                        hint: const Text(
                          'English',
                          style: TextStyle(color: AppColors.darkBlack),
                        ),
                      ),
                    ],
                  ).paddingOnly(bottom: 10.0),
                )
              ],
            ),
          )),
    );
  }
}
