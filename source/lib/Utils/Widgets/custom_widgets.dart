// ignore_for_file: library_private_types_in_public_api

import 'package:ecom_wp/Utils/utils.dart';
import 'package:ecom_wp/Utils/Widgets/custom_textField.dart';
import 'package:ecom_wp/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Constants/app_colors.dart';
import '../../Services/Controller/home_page_controller.dart';
import '../../View/Checkout/checkout_screen.dart';
import '../../View/Profile/profile_screen.dart';
import '../../View/Whishlist/whish_list_screen.dart';
import 'DotsIndicator/dots_decorator.dart';
import 'DotsIndicator/dots_indicator.dart';

////// search bar
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

////// custom badge
Widget createBadge(Widget icon, String badgeContent) {
  return Stack(
    children: [
      icon,
      Positioned(
        right: 5.h,
        top: 15.h,
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

Widget insideSlider(
  String? imageUrl,
  String? offerText,
  String? desc,
  String? price,
) {
  return Stack(
    children: [
      Container(
          child: cachenetworkImage(
              imageUrl ?? '', double.maxFinite.h, double.infinity.w)),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///text
          Text(
            offerText ?? '',
            style: TextStyle(color: Colors.blueAccent, fontSize: 15.sp),
          ),
          SizedBox(
            height: 10.h,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
              text: desc ?? ''.toUpperCase(),
              style: TextStyle(color: AppColors.darkBlack, fontSize: 18.sp),
            ),
            TextSpan(
              text: price ?? '',
              style: TextStyle(color: Colors.green, fontSize: 19.sp),
            ),
          ])),

          SizedBox(
            height: 10.h,
          ),

          customButtton('Shop Now', 40.h, 110.w, () {})
        ],
      ).paddingOnly(left: 10.0.w, top: 10.0.h)
    ],
  );
}

////// slider widget
Widget sliderWidget(
    {int? currentIndex,
    Color? activeDotColor,
    Color? nonActiveDotColor,
    required Widget slidrContentWidget,
    void Function(int)? onTapOfDot}) {
  return Stack(
    children: [
      slidrContentWidget,
      Align(
        alignment: Alignment.bottomCenter,
        child: DotsIndicator(
          dotsCount: 2,
          onTap: onTapOfDot,
          position: currentIndex ?? 0,
          decorator: DotsDecorator(
            color: nonActiveDotColor ?? Colors.grey,
            activeColor: activeDotColor,
            size: const Size.square(5.0),
            activeSize: const Size.square(15.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
      ),
    ],
  );
}

////customSlider
class CustomSlider extends StatefulWidget {
  const CustomSlider({
    super.key,
  });

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  PageController pageController = PageController();
  final homePageController = Get.put(HomeController());

  int _currentPage = 0;
  final _totalDots = 2;

  int _validPosition(int position) {
    if (position >= _totalDots) return 0;
    if (position < 0) return _totalDots - 1;
    return position;
  }

  void updatePosition(int position) {
    final validPosition = _validPosition(position);
    setState(() {
      _currentPage = validPosition;
      pageController.animateToPage(
        validPosition,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeInOutQuad,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Expanded(
            child: PageView(
                controller: pageController,
                onPageChanged: updatePosition,
                children: homePageController.logoData
                    .skip(8)
                    .map(
                      (data) => sliderWidget(
                          onTapOfDot: updatePosition,
                          slidrContentWidget: insideSlider(
                              data.sourceUrl,
                              'Limited Editions',
                              'Experience Feel \nGreatest With The Virtual \nReality Just',
                              ' \$599'),
                          activeDotColor: AppColors.primaryYellow,
                          nonActiveDotColor: Colors.grey,
                          currentIndex: _currentPage),
                    )
                    .toList()),
          ),
        ],
      ),
    );
  }
}

////// custom Button
Widget customButtton(
    String text, double height, double width, VoidCallback onPressed) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: AppColors.primaryYellow,
          borderRadius: BorderRadius.circular(5)),
      child: Center(
          child: Text(
        text,
        style: TextStyle(
            color: AppColors.darkBlack,
            fontSize: 15.sp,
            fontWeight: FontWeight.bold),
      )),
    ),
  );
}

/////custom slider app bar
Widget silverAppBar(
    {bool? innerBoxIsScrolled,
    required HomeController homePageController,
    GlobalKey<ScaffoldState>? scaffoldKey}) {
  ////icons list
  var iconList = [
    createBadge(
      IconButton(
          onPressed: () {
            Get.toNamed(Routes.WHISHLIST);
          },
          icon: Icon(
            Icons.favorite_border_rounded,
            color: AppColors.darkBlack,
            size: 30.h,
          )),
      '0',
    ),
    SizedBox(width: 2.w),
    createBadge(
        IconButton(
            onPressed: () {
              Get.toNamed(Routes.CHECKOUT);
            },
            icon: Icon(
              Icons.wallet_rounded,
              color: AppColors.darkBlack,
              size: 30.h,
            )),
        '0'),
    SizedBox(width: 2.w),
    createBadge(
      IconButton(
          onPressed: () {
            Get.toNamed(Routes.PROFILE);
          },
          icon: Icon(
            Icons.person_outline_rounded,
            color: AppColors.darkBlack,
            size: 30.h,
          )),
      '0',
    ),
  ];

  return SliverAppBar(
    leadingWidth: 0.0.w,
    leading: const SizedBox.shrink(),
    expandedHeight: 140.0.h,
    floating: false,
    pinned: true,
    centerTitle: true,
    title: innerBoxIsScrolled ?? false
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.menu,
                  color: AppColors.darkBlack,
                  size: 30.h,
                ),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () => scaffoldKey?.currentState!.openDrawer(),
              ),
              Expanded(
                child: searchBar(
                  decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      filled: true,
                      suffixIcon: Container(
                        color: AppColors.darkBlack,
                        child: Icon(
                          Icons.search_rounded,
                          color: Colors.white,
                          size: 20.h,
                        ).paddingSymmetric(vertical: 10.h, horizontal: 15.w),
                      ),
                      hintText: 'I\'m shopping for.....',
                      hintStyle: const TextStyle(color: Colors.grey),
                      isDense: true,
                      border: InputBorder.none),
                ),
              ),
            ],
          )
        : const SizedBox.shrink(),
    flexibleSpace: FlexibleSpaceBar(
        background: PreferredSize(
      preferredSize: Size(double.infinity.w, 90.h),
      child: Stack(
        children: [
          //bottom
          Container(
            color: AppColors.primaryYellow,
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                //appLogo and userSection
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => homePageController.isLoading.value
                          ? const SizedBox.shrink()
                          :(homePageController.logoData.first.sourceUrl != '' && homePageController.logoData.first.sourceUrl != null) ? networkImage(
                              homePageController.logoData.first.sourceUrl ?? '',
                              40.h,
                              120.w): FlutterLogo(size: 40.h,),
                    ),
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
                      onPressed: () => scaffoldKey?.currentState!.openDrawer(),
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
            height: 55.h,
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
            ).paddingOnly(top: 15.0.h),
          )
        ],
      ),
    )),
  );
}
