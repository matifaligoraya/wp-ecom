import 'package:ecom_wp/Services/Controller/shop_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

import '../../Utils/Constants/app_colors.dart';
import '../../Utils/utils.dart';
import '../../Utils/Widgets/custom_widgets.dart';

class ShopProductDetail extends StatefulWidget {
  const ShopProductDetail({super.key});

  @override
  State<ShopProductDetail> createState() => _ShopProductDetailState();
}

class _ShopProductDetailState extends State<ShopProductDetail> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var controller = TextEditingController();
  var productId = Get.arguments['productData'];
  var shopController = Get.put(ShopController());
  var storeController= Get.arguments['storeController'];

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
                    storeController: storeController,
                    innerBoxIsScrolled: innerBoxIsScrolled,
                    scaffoldKey: _scaffoldKey)
              ];
            },
            body: FutureBuilder(
              future: shopController.loadCatAndTag(data: productId),
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
                        productId.title?.rendered ?? '',
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
                              shopController
                                      .productImageDetail
                                      .value
                                      .mediaDetails
                                      ?.sizes
                                      ?.woocommerceThumbnail
                                      ?.sourceUrl ??
                                  '',
                              double.parse(
                                  '${shopController.productImageDetail.value.mediaDetails?.sizes?.woocommerceThumbnail?.height ?? 70.h}'),
                              double.parse(
                                  '${shopController.productImageDetail.value.mediaDetails?.sizes?.woocommerceThumbnail?.width ?? 70.h}')),
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
                          productId.excerpt?.rendered ?? '',
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
                                      shopController.decrementQuantity();
                                    },
                                    icon: const Icon(Icons.remove,
                                        color: Colors.grey),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: TextEditingController(
                                          text: shopController.quantity.value
                                              .toString()),
                                      textAlign: TextAlign.center,
                                      cursorColor: Colors.black,
                                      style:
                                          const TextStyle(color: Colors.black),
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        if (value.isNotEmpty) {
                                          shopController
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
                                      shopController.incrementQuantity();
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
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                style: TextStyle(
                                    color: AppColors.darkBlack,
                                    fontSize: 14.sp),
                                text: "Category",
                              ),
                              WidgetSpan(
                                child: SizedBox(
                                  width: 5.w,
                                ),
                              ),
                              TextSpan(
                                children: shopController.productCategoryData
                                    .map(
                                      (element) => TextSpan(
                                        style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontSize: 16.sp,
                                        ),
                                        text: element.name.toString().padLeft(5),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ]),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                style: TextStyle(
                                    color: AppColors.darkBlack,
                                    fontSize: 14.sp),
                                text: "Tags",
                              ),
                              WidgetSpan(
                                child: SizedBox(
                                  width: 5.w,
                                ),
                              ),
                              TextSpan(
                                children: shopController.productTagData
                                    .map(
                                      (element) => TextSpan(
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16.sp,
                                        ),
                                        text: element.name.toString().padLeft(10),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ]),
                          ),

                          SizedBox(
                            height: 25.h,
                          ),
                          Align(
                        alignment: Alignment.centerLeft,
                        child: HtmlWidget(
                          productId.content?.rendered ?? '',
                          textStyle: const TextStyle(color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                            height: 25.h,
                          ),
                          
                        ],
                      ),
                    ],
                  ).paddingOnly(top: 10.h, left: 20.w, right: 20.w);
                }
              },
            )));
  }
}
