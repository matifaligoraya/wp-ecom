// ignore_for_file: must_be_immutable
import 'package:ecom_wp/Services/Controller/store_controller.dart';
import 'package:ecom_wp/Utils/Constants/app_colors.dart';
import 'package:ecom_wp/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../Services/Controller/shop_controller.dart';
import '../../Utils/utils.dart';
import '../../Utils/Widgets/custom_widgets.dart';

class ShopPage extends StatefulWidget {
  ShopPage({
    super.key,
  });

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var shopController = Get.put(ShopController());
  var storeController = Get.arguments['storeController'];
  var iconListForgridView = [
    IconButton(
        onPressed: () {
          Get.toNamed(Routes.WHISHLIST);
        },
        icon: Icon(
          Icons.wallet_outlined,
          color: AppColors.darkBlack,
          size: 20.h,
        )),
    SizedBox(width: 2.w),
    IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.remove_red_eye_outlined,
          color: AppColors.darkBlack,
          size: 20.h,
        )),
    SizedBox(width: 2.w),
    IconButton(
        onPressed: () {
          Get.toNamed(Routes.PROFILE);
        },
        icon: Icon(
          Icons.favorite_border_rounded,
          color: AppColors.darkBlack,
          size: 20.h,
        )),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      key: _scaffoldKey,
      body: NestedScrollView(
        physics: const ClampingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            silverAppBar(
                storeController: storeController ?? StoreController(),
                innerBoxIsScrolled: innerBoxIsScrolled,
                scaffoldKey: _scaffoldKey)
          ];
        },
        body: FutureBuilder(
            future: shopController.loadProductCatData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CupertinoActivityIndicator(color: AppColors.darkBlack),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('There is no items in this category'),
                );
              } else {
                var count = shopController.productData.length;
                return Column(
                  children: [
                    ///filter section
                    filterSection(count: count),

                    ///product card
                    Obx(() => Flexible(
                          child: shopController.isGridView.value
                              ? GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                        2, // number of items in each row
                                    mainAxisSpacing:
                                        8.0, // spacing between rows
                                    crossAxisSpacing:
                                        8.0, // spacing between columns
                                  ),
                                  padding: const EdgeInsets.all(
                                      8.0), // padding around the grid
                                  itemCount: count, // total number of items
                                  itemBuilder: (context, index) {
                                    return Stack(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Obx(
                                              () => InkWell(
                                                onTap: () {
                                                  shopController
                                                      .toggleGridviewSection(
                                                          index);
                                                },
                                                child: Stack(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  children: [
                                                    Center(
                                                      child: cachenetworkImage(
                                                        shopController
                                                                .productImageData[
                                                                    index]
                                                                .mediaDetails
                                                                ?.sizes
                                                                ?.woocommerceGalleryThumbnail
                                                                ?.sourceUrl ??
                                                            '',
                                                        double.parse(
                                                          '${shopController.productImageData[index].mediaDetails?.sizes?.woocommerceGalleryThumbnail?.height ?? 70.h}',
                                                        ),
                                                        double.parse(
                                                          '${shopController.productImageData[index].mediaDetails?.sizes?.woocommerceGalleryThumbnail?.width ?? 70.h}',
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      bottom: 0,
                                                      left: 0,
                                                      right: 0,
                                                      child: AnimatedOpacity(
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    500),
                                                        opacity: shopController
                                                                    .isGridviewScetionEnableList[
                                                                index]
                                                            ? 1.0
                                                            : 0.0,
                                                        child:
                                                            AnimatedContainer(
                                                          duration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      500),
                                                          curve:
                                                              Curves.easeInBack,
                                                          color: Colors.white,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: shopController
                                                                        .isGridviewScetionEnableList[
                                                                    index]
                                                                ? iconListForgridView
                                                                    .map((icon) =>
                                                                        icon)
                                                                    .toList()
                                                                : [],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),

                                            ///image
                                            InkWell(
                                              onTap: () {
                                                Get.toNamed(
                                                    Routes.SHOPPAGEDETAIL,
                                                    arguments: {
                                                      'productData':
                                                          shopController
                                                                  .productData[
                                                              index],
                                                      'shopController':
                                                          shopController,
                                                      'storeController':
                                                          storeController,
                                                    });
                                              },
                                              child: Text(
                                                shopController
                                                        .productData[index]
                                                        .title
                                                        ?.rendered ??
                                                    '',
                                                maxLines: 2,
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: const Color.fromRGBO(
                                                        68, 138, 255, 1),
                                                    fontWeight:
                                                        FontWeight.bold),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            // HtmlWidget(
                                            //    data.content?.rendered?? '',
                                            // )
                                            Row(
                                              children: [
                                                Text(
                                                  '\$82.98',
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: Colors.red[700],
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  overflow:
                                                      TextOverflow.visible,
                                                ),
                                                SizedBox(
                                                  width: 5.w,
                                                ),
                                                Text(
                                                  '\$182.98',
                                                  style: TextStyle(
                                                      fontSize: 8.sp,
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      decorationColor:
                                                          Colors.grey,
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  overflow:
                                                      TextOverflow.visible,
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    );
                                  },
                                )
                              : ListView.builder(
                                  itemCount: count,
                                  itemBuilder: (context, index) {
                                    return Stack(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Get.toNamed(
                                                    Routes.SHOPPAGEDETAIL,
                                                    arguments: {
                                                      'productData':
                                                          shopController
                                                                  .productData[
                                                              index],
                                                      'shopController':
                                                          shopController,
                                                      'storeController':
                                                          storeController,
                                                    });
                                              },
                                              child: Center(
                                                  child: cachenetworkImage(
                                                      shopController
                                                              .productImageData[
                                                                  index]
                                                              .mediaDetails
                                                              ?.sizes
                                                              ?.woocommerceThumbnail
                                                              ?.sourceUrl ??
                                                          '',
                                                      double.parse(
                                                          '${shopController.productImageData[index].mediaDetails?.sizes?.woocommerceThumbnail?.height ?? 70.h}'),
                                                      double.parse(
                                                          '${shopController.productImageData[index].mediaDetails?.sizes?.woocommerceThumbnail?.width ?? 70.h}'))),
                                            ),

                                            ///image
                                            InkWell(
                                              onTap: () {
                                                Get.toNamed(
                                                    Routes.SHOPPAGEDETAIL,
                                                    arguments: {
                                                      'productData':
                                                          shopController
                                                                  .productData[
                                                              index],
                                                      'shopController':
                                                          shopController,
                                                      'storeController':
                                                          storeController,
                                                    });
                                              },
                                              child: Text(
                                                shopController
                                                        .productData[index]
                                                        .title
                                                        ?.rendered ??
                                                    '',
                                                maxLines: 2,
                                                style: TextStyle(
                                                    fontSize: 15.sp,
                                                    color: const Color.fromRGBO(
                                                        68, 138, 255, 1),
                                                    fontWeight:
                                                        FontWeight.bold),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: HtmlWidget(
                                                shopController
                                                        .productData[index]
                                                        .excerpt
                                                        ?.rendered ??
                                                    '',
                                                textStyle: const TextStyle(
                                                    color: Colors.grey),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '\$82.98',
                                                  style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: Colors.red[700],
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  overflow:
                                                      TextOverflow.visible,
                                                ),
                                                SizedBox(
                                                  width: 5.w,
                                                ),
                                                Text(
                                                  '\$182.98',
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      decorationColor:
                                                          Colors.grey,
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  overflow:
                                                      TextOverflow.visible,
                                                ),
                                              ],
                                            ),

                                            SizedBox(
                                              height: 8.h,
                                            ),

                                            customButtton('Select Option', 40.h,
                                                double.infinity, () {})
                                          ],
                                        ).paddingSymmetric(horizontal: 20.0)
                                      ],
                                    ).paddingOnly(top: 10.0);
                                  },
                                ),
                        ))
                  ],
                ).paddingSymmetric(horizontal: 10.w, vertical: 10.h);
              }
            }),
      ),
    );
  }

  Widget filterSection({int? count}) {
    return Container(
      decoration: BoxDecoration(color: Colors.blueGrey.withOpacity(0.2)),
      width: double.infinity.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///count section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: '${count ?? ''}',
                    style: TextStyle(
                        color: AppColors.darkBlack,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp)),
                WidgetSpan(
                    child: SizedBox(
                  width: 5.w,
                )),
                TextSpan(
                    text: 'Product Found',
                    style: TextStyle(color: Colors.grey, fontSize: 15.sp))
              ])),
              Obx(
                () => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ///view
                    Text(
                      'View',
                      style: TextStyle(
                          color: AppColors.darkBlack,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp),
                    ),
                    IconButton(
                        onPressed: () {
                          shopController.isGridView.value = true;
                        },
                        icon: Icon(
                          Icons.grid_on_rounded,
                          color: shopController.isGridView.value
                              ? AppColors.darkBlack
                              : Colors.grey,
                        )),
                    InkWell(
                        onTap: () {
                          shopController.isGridView.value = false;
                        },
                        child: Icon(
                          Icons.format_list_bulleted_rounded,
                          color: shopController.isGridView.value
                              ? Colors.grey
                              : AppColors.darkBlack,
                        ))
                  ],
                ),
              )
            ],
          ).paddingOnly(left: 12.w, right: 8.h, top: 5.0.h, bottom: 5.0.h),
          Row(
            children: [
              /// drop down button
              Flexible(
                child: DropdownMenu<String>(
                  hintText: 'Default Sorting',
                  expandedInsets: EdgeInsets.only(left: 12.0.w, right: 16.0.w),
                  inputDecorationTheme: InputDecorationTheme(
                      hintStyle: const TextStyle(color: AppColors.darkBlack),
                      contentPadding:
                          EdgeInsets.only(top: 0.0, bottom: 0.0, left: 10.w),
                      fillColor: Colors.white,
                      filled: true,
                      constraints: BoxConstraints.tight(Size.fromHeight(35.h)),
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(3.0)),
                          borderSide: BorderSide(color: AppColors.darkBlack)),
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(3.0)),
                          borderSide: BorderSide(color: AppColors.darkBlack))),
                  dropdownMenuEntries:
                      <String>['A', 'B', 'C', 'D'].map((String value) {
                    return DropdownMenuEntry<String>(
                      value: value,
                      label: value,
                    );
                  }).toList(),
                ),
              ),
              Row(
                children: [
                  ///button
                  InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.filter_alt_outlined,
                        size: 20.h,
                      )),

                  ///text
                  Text(
                    'Filter',
                    style: TextStyle(
                        color: AppColors.darkBlack,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp),
                  ),
                ],
              ).paddingOnly(right: 12.0.w)
            ],
          ).paddingOnly(
            bottom: 12.h,
          ),
        ],
      ),
    );
  }
}
