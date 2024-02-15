import 'package:ecom_wp/View/Checkout/checkout_screen.dart';
import 'package:ecom_wp/View/Home/category_details.dart';
import 'package:ecom_wp/View/Profile/profile_screen.dart';
import 'package:ecom_wp/View/Whishlist/whish_list_screen.dart';
import 'package:get/get.dart';

import '../View/Home/home.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const Home(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: _Paths.CHECKOUT,
      page: () => const CheckOutScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: _Paths.WHISHLIST,
      page: () => const WhishListScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: _Paths.CATDETAIL,
      page: () => CategoryDetail(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
  ];
}
