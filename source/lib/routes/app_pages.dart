import 'package:ecom_wp/View/Checkout/checkout_screen.dart';
import 'package:ecom_wp/View/Home/category_details.dart';
import 'package:ecom_wp/View/Profile/profile_screen.dart';
import 'package:ecom_wp/View/Shop/shop_product_detail.dart';
import 'package:ecom_wp/View/Shop/shop_screen.dart';
import 'package:ecom_wp/View/Whishlist/whish_list_screen.dart';
import 'package:get/get.dart';

import '../View/Home/home.dart';
import '../View/Home/product_detail.dart';

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
    GetPage(
      name: _Paths.PRODUCTDETAIL,
      page: () => const ProductDetail(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: _Paths.SHOPPAGE,
      page: () => ShopPage(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: _Paths.SHOPPAGEDETAIL,
      page: () => ShopProductDetail(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
  ];
}
