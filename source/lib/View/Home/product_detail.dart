import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

import '../../Constants/app_colors.dart';
import '../../Controller/home_page_controller.dart';
import '../../Utils/utils.dart';
import '../../Widgets/custom_widgets.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final homeController = Get.put(HomeController());
  var controller = TextEditingController();
  var productId = Get.arguments['product_id'];

  var quantity = 1;

  void updateQuantity(int newQuantity) {
    setState(() {
      quantity = newQuantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawer(),
        key: _scaffoldKey,
        body: NestedScrollView(
            physics: const ClampingScrollPhysics(),
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                silverAppBar(
                    homePageController: homeController,
                    innerBoxIsScrolled: innerBoxIsScrolled,
                    scaffoldKey: _scaffoldKey)
              ];
            },
            body: FutureBuilder(
              future:
                  homeController.loadDeatilsOfProductDes(productId: productId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child:
                        CupertinoActivityIndicator(color: AppColors.darkBlack),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('There is no items in this category'),
                  );
                } else {
                  return ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      ///text
                      Text(
                        homeController.productDetail.value.title?.rendered ??
                            '',
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: AppColors.darkBlack,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.visible,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Center(
                        child: Container(
                          child: cachenetworkImage(
                              homeController
                                      .productImageDetail
                                      .value
                                      .mediaDetails
                                      ?.sizes
                                      ?.woocommerceThumbnail
                                      ?.sourceUrl ??
                                  '',
                              double.parse(
                                  '${homeController.productImageDetail.value.mediaDetails?.sizes?.woocommerceThumbnail?.height ?? 70.h}'),
                              double.parse(
                                  '${homeController.productImageDetail.value.mediaDetails?.sizes?.woocommerceThumbnail?.width ?? 70.h}')),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '\$82.98',
                            style: TextStyle(
                                fontSize: 22.sp,
                                color: Colors.red[700],
                                fontWeight: FontWeight.bold),
                            overflow: TextOverflow.visible,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            '\$182.98',
                            style: TextStyle(
                                fontSize: 16.sp,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: Colors.grey,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                            overflow: TextOverflow.visible,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            '(-29%)',
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                            overflow: TextOverflow.visible,
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        children: [
                          Text(
                            'Status',
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.visible,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            'In Stock',
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.green[900],
                                fontWeight: FontWeight.bold),
                            overflow: TextOverflow.visible,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: HtmlWidget(
                          homeController
                                  .productDetail.value.excerpt?.rendered ??
                              '',
                          textStyle: const TextStyle(color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ///text
                          Text(
                            'Quantity',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.visible,
                          ),

                          ///button Section
                          Obx(
                            () => Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      homeController.decrementQuantity();
                                    },
                                    icon: const Icon(Icons.remove,
                                        color: Colors.grey),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: TextEditingController(
                                          text: homeController.quantity.value
                                              .toString()),
                                      textAlign: TextAlign.center,
                                      cursorColor: Colors.black,
                                      style:
                                          const TextStyle(color: Colors.black),
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        if (value.isNotEmpty) {
                                          homeController
                                              .updateQuantity(int.parse(value));
                                        }
                                      },
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      homeController.incrementQuantity();
                                    },
                                    icon: const Icon(Icons.add,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 10.h,
                          ),

                          ///button
                          customButtton(
                              'Add to cart', 40.h, double.infinity.w, () {}),
                          SizedBox(
                            height: 10.h,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                const Text(
                                  'Category',
                                  style: TextStyle(color: AppColors.darkBlack),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Row(
                                  children: homeController.productCatList
                                      .map(
                                        (element) => Text(
                                          element.name.toString(),
                                          style: const TextStyle(
                                            color: Colors.blueAccent,
                                            fontSize: 15,
                                          ),
                                          overflow: TextOverflow.visible,
                                          maxLines: 2,
                                        ),
                                      )
                                      .toList(),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 60.h,
                          ),
                        ],
                      ),
                    ],
                  ).paddingOnly(top: 10.h, left: 20.w, right: 20.w);
                }
              },
            )));
  }

  // Widget quantityButton() {
  //   return
  // }
}
