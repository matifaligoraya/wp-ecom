import 'package:ecom_wp/Model/Product%20Models/product.dart';
import 'package:ecom_wp/Model/fotter_model.dart';
import 'package:ecom_wp/Services/Controller/store_controller.dart';
import 'package:ecom_wp/Utils/utils.dart';
import 'package:ecom_wp/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Utils/Constants/app_colors.dart';
import '../../Services/Controller/home_page_controller.dart';
import '../../Utils/Widgets/custom_drawer.dart';
import '../../Utils/Widgets/custom_widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final homePageController = Get.put(HomeController());
  final storeController = Get.put(StoreController());
  final pageViewController = PageController();

  var footerList = [
    FotterModel(
      desc: 'For all orders over \$99',
      mainText: 'Free Delivery',
      icon: Icon(
        CupertinoIcons.paperplane,
        color: AppColors.primaryYellow,
        size: 30.h,
      ),
    ),
    FotterModel(
      desc: 'If goods have problems',
      mainText: '90 days return',
      icon: Icon(
        size: 30.h,
        CupertinoIcons.share,
        color: AppColors.primaryYellow,
      ),
    ),
    FotterModel(
      desc: '100% secure payment',
      mainText: 'Secure Payment',
      icon: Icon(
        size: 30.h,
        Icons.wallet_travel_rounded,
        color: AppColors.primaryYellow,
      ),
    ),
    FotterModel(
      desc: 'Dedicated support',
      mainText: '24/7 support',
      icon: Icon(
        size: 30.h,
        Icons.message_outlined,
        color: AppColors.primaryYellow,
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const CustomDrawer(),
        key: _scaffoldKey,
        body: NestedScrollView(
          physics: const ClampingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              silverAppBar(
                  storeController: storeController,
                  innerBoxIsScrolled: innerBoxIsScrolled,
                  scaffoldKey: _scaffoldKey)
            ];
          },
          body: ListView(
            padding: EdgeInsets.zero,
            children: [
              ////custom slider
              SizedBox(
                // padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                height: 160.h,
                width: double.infinity.w,
                child: CustomSlider(
                  storeController: storeController,
                ),
              ),

              SizedBox(
                height: 20.h,
              ),

              ///fotter section
              footerSection().paddingSymmetric(horizontal: 15.0.w),

              SizedBox(
                height: 20.h,
              ),

              ///card widget
              cardWidget().paddingSymmetric(horizontal: 15.0.w),

              SizedBox(
                height: 20.h,
              ),

              ///deals of the day
              dealsOfTheDayWidget().paddingSymmetric(horizontal: 15.0.w),

              SizedBox(
                height: 20.h,
              ),

              Obx(
                () => Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.grey, width: 1.0.w)),
                        height: 500.h,
                        width: double.infinity.w,
                        child: Column(children: [
                          ///title and button section
                          Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: AppColors.darkBlack))),
                            child: Text(
                              'Top 20 Best Seller',
                              style: TextStyle(
                                  color: AppColors.darkBlack,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold),
                            ).paddingOnly(bottom: 5.0.h, top: 5.0.w),
                          )

                          ///listView
                          ,
                          homePageController.isLoadingProductCat.value
                              ? const Expanded(
                                  child: Center(
                                  child: CupertinoActivityIndicator(
                                    color: AppColors.darkBlack,
                                  ),
                                ))
                              : Flexible(
                                  child: ListView.builder(
                                  padding: const EdgeInsets.only(top: 0.0),
                                  itemCount:
                                      homePageController.productData.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        ///row
                                        Row(
                                          children: [
                                            ///image
                                            cachenetworkImage(
                                                homePageController
                                                        .productImageData[index]
                                                        .mediaDetails
                                                        ?.sizes
                                                        ?.woocommerceGalleryThumbnail
                                                        ?.sourceUrl ??
                                                    '',
                                                double.parse(
                                                    '${homePageController.productImageData[index].mediaDetails?.sizes?.woocommerceGalleryThumbnail?.height ?? 70.h}'),
                                                double.parse(
                                                    '${homePageController.productImageData[index].mediaDetails?.sizes?.woocommerceGalleryThumbnail?.width ?? 70.h}')),

                                            ///title
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ///text
                                                  InkWell(
                                                    hoverColor:
                                                        AppColors.primaryYellow,
                                                    onTap: () {
                                                      Get.toNamed(
                                                          Routes.PRODUCTDETAIL,
                                                          arguments: {
                                                            'homeController':
                                                                homePageController,
                                                            'productData':
                                                                homePageController
                                                                        .productData[
                                                                    index],
                                                            'storeController':
                                                                storeController,
                                                          });
                                                    },
                                                    child: Text(
                                                      homePageController
                                                              .productData[
                                                                  index]
                                                              .title
                                                              ?.rendered ??
                                                          '',
                                                      maxLines: 2,
                                                      style: TextStyle(
                                                          fontSize: 12.sp,
                                                          color:
                                                              Colors.blueAccent,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      overflow:
                                                          TextOverflow.visible,
                                                    ),
                                                  ),
                                                  // HtmlWidget(
                                                  //    data.content?.rendered?? '',
                                                  // ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        '\$82.98',
                                                        style: TextStyle(
                                                            fontSize: 12.sp,
                                                            color:
                                                                Colors.red[700],
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        overflow: TextOverflow
                                                            .visible,
                                                      ),
                                                      SizedBox(
                                                        width: 5.w,
                                                      ),
                                                      Text(
                                                        '\$182.98',
                                                        style: TextStyle(
                                                            fontSize: 10.sp,
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough,
                                                            decorationColor:
                                                                Colors.grey,
                                                            color: Colors.grey,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        overflow: TextOverflow
                                                            .visible,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    );
                                  },
                                ))
                        ]).paddingSymmetric(horizontal: 10.0.w))
                    .paddingSymmetric(horizontal: 15.0.w),
              ),

              SizedBox(
                height: 20.h,
              ),
              Text(
                'Top Categories Of The Month',
                style: TextStyle(
                    color: AppColors.darkBlack,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold),
              ).paddingOnly(bottom: 3.0.h, top: 5.0.w, left: 10.w),

              Obx(
                () => SizedBox(
                  height: 300.h,
                  width: double.infinity.w,
                  child: homePageController.isLoadingProductCat.value
                      ? const Center(
                          child: CupertinoActivityIndicator(
                            color: AppColors.darkBlack,
                          ),
                        )
                      : GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, // number of items in each row
                            mainAxisSpacing: 8.0, // spacing between rows
                            crossAxisSpacing: 8.0, // spacing between columns
                          ),
                          padding: EdgeInsets.only(
                              top: 5.h), // padding around the grid
                          itemCount: homePageController
                              .productCatData.length, // total number of items
                          itemBuilder: (context, index) {
                            var productCategoryIDs =
                                homePageController.productCatData;
                            var productData =
                                homePageController.productCatData[index];
                            // Ensure productCategoryIDs is not null
                            List<Product> data = [];
                            // Find the first matching category
                            for (var i in productCategoryIDs) {
                              var secondData = homePageController.productData
                                  .firstWhereOrNull(
                                (element) => element.productCat!.contains(i.id),
                              );
                              data.add(secondData ?? Product());
                            }

                            var thirdData = data[index];
                            var imageData = homePageController.productImageData
                                .firstWhereOrNull(
                              (element) =>
                                  element.id == thirdData.featuredMedia,
                            );
                            var imageString = imageData?.mediaDetails?.sizes
                                    ?.woocommerceGalleryThumbnail?.sourceUrl ??
                                '';
                            return Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey, width: 1.0.w)),
                                child: Column(
                                  children: [
                                    //image
                                    Center(
                                      child: cachenetworkImage(
                                          imageString,
                                          double.parse(
                                              '${imageData?.mediaDetails?.sizes?.woocommerceGalleryThumbnail?.height ?? 70.h}'),
                                          double.parse(
                                              '${imageData?.mediaDetails?.sizes?.woocommerceGalleryThumbnail?.width ?? 70.h}')),
                                    ),
                                    Flexible(
                                      child: Center(
                                        child: Text(
                                          productData.name ?? '',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    )
                                  ],
                                ));
                          }),
                ),
              ).paddingSymmetric(horizontal: 15.0.w)
            ],
          ),
        ));
  }

  Widget dealsOfTheDayWidget() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryYellow, width: 2.0.w)),
      height: 400.h,
      width: double.infinity.w,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ///title and button section
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: AppColors.darkBlack))),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///title
                  Text(
                    'Deals Of The Day',
                    style: TextStyle(
                        color: AppColors.darkBlack,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold),
                  ),

                  ///buttons
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            pageViewController.animateToPage(
                              pageViewController.page!.toInt() + 1,
                              duration: const Duration(milliseconds: 1000),
                              curve: Curves.easeInOutQuad,
                            );
                          },
                          icon: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.darkBlack),
                                  shape: BoxShape.circle),
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 12.0.h,
                              ).paddingAll(5.0))),
                      IconButton(
                          onPressed: () {
                            pageViewController.animateToPage(
                              pageViewController.page!.toInt() - 1,
                              duration: const Duration(milliseconds: 1000),
                              curve: Curves.easeInOutQuad,
                            );
                          },
                          icon: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.darkBlack),
                                  shape: BoxShape.circle),
                              child: Icon(
                                Icons.arrow_back_ios_new_rounded,
                                size: 12.0.h,
                              ).paddingAll(5.0)))
                    ],
                  )
                ]).paddingOnly(bottom: 5.0.h, top: 5.0.w),
          ),
        ),

        ///pageView

        FutureBuilder(
            future: homePageController.loadProductData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Expanded(
                  child: Center(
                    child:
                        CupertinoActivityIndicator(color: AppColors.darkBlack),
                  ),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('There is no items in this category'),
                );
              } else {
                return Obx(
                  () => Flexible(
                      child: PageView.builder(
                    controller: pageViewController,
                    itemCount: homePageController.productData.length,
                    itemBuilder: (context, index) {
                      var productCategoryIDs =
                          homePageController.productData[index].productCat;
                      // Ensure productCategoryIDs is not null
                      if (productCategoryIDs != null &&
                          productCategoryIDs.isNotEmpty) {
                        // Find the first matching category
                        var category =
                            homePageController.productCatData.firstWhereOrNull(
                          (element) => productCategoryIDs.contains(element.id),
                        );

                        if (category != null) {
                          var categoryName = category.name;

                          // Use categoryName as needed in your UI
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: cachenetworkImage(
                                    homePageController
                                            .productImageData[index]
                                            .mediaDetails
                                            ?.sizes
                                            ?.woocommerceThumbnail
                                            ?.sourceUrl ??
                                        '',
                                    double.parse(
                                        '${homePageController.productImageData[index].mediaDetails?.sizes?.woocommerceThumbnail?.height ?? 70.h}'),
                                    double.parse(
                                        '${homePageController.productImageData[index].mediaDetails?.sizes?.woocommerceThumbnail?.width ?? 70.h}')),
                              ),

                              InkWell(
                                hoverColor: Colors.blueAccent,
                                onTap: () {
                                  Get.toNamed(Routes.CATDETAIL, arguments: {
                                    'catId': category.id,
                                    'homeController': homePageController,
                                    'storeController':storeController
                                  });
                                },
                                child: Text(
                                  categoryName ?? '',
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color: AppColors.darkBlack,
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.visible,
                                ),
                              ),

                              ///image
                              Text(
                                homePageController
                                        .productData[index].title?.rendered ??
                                    '',
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    color: AppColors.darkBlack,
                                    fontWeight: FontWeight.bold),
                                overflow: TextOverflow.visible,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '\$82.98',
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        color: Colors.red[700],
                                        fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.visible,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    '\$182.98',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        decoration: TextDecoration.lineThrough,
                                        decorationColor: Colors.grey,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.visible,
                                  ),
                                ],
                              ),
                            ],
                          );
                        }
                      }
                      return const Column();
                    },
                  )),
                );
              }
            })
      ]).paddingSymmetric(horizontal: 10.0.w),
    );
  }

  Widget cardWidget() {
    return Obx(
      () => Column(
        children: storeController.logoData.isNotEmpty
            ? storeController.logoData
                .skip(8)
                .map((insideModelData) => Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.darkBlack)),
                      height: 140.h,
                      child: Stack(
                        children: [
                          Container(
                            child: storeController.logoData.isNotEmpty
                                ? cachenetworkImage(
                                    insideModelData.sourceUrl ?? '',
                                    double.maxFinite.h,
                                    double.infinity.w)
                                : const SizedBox.shrink(),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: storeController.logoData.isNotEmpty
                                ? [
                                    ///text
                                    Row(
                                      children: [
                                        Text(
                                          'Fluence',
                                          style: TextStyle(
                                              color: AppColors.darkBlack,
                                              fontSize: 20.sp),
                                        ),
                                        SizedBox(
                                          width: 10.0.w,
                                        ),
                                        Text(
                                          'Minimal Speaker',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 20.sp),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Just',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15.sp),
                                        ),
                                        SizedBox(
                                          width: 10.0.w,
                                        ),
                                        Text(
                                          '\$159.99',
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),

                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    customButtton('Shop Now', 40.h, 110.w,
                                        () async {
                                      Get.toNamed(Routes.SHOPPAGE,arguments: {
                                        'storeController': storeController
                                      });
                                    })
                                  ]
                                : [],
                          ).paddingOnly(left: 15.0.w, top: 10.0.h),
                        ],
                      ),
                    ).paddingSymmetric(vertical: 10.h))
                .toList()
            : [],
      ),
    );
  }

  Widget footerSection() {
    return Column(
      children: footerList
          .map((data) => Row(
                children: [
                  data.icon ?? const SizedBox.shrink(),
                  SizedBox(
                    width: 15.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //mainText
                      Text('${data.mainText}',
                          style: TextStyle(
                              fontSize: 18.sp, color: AppColors.darkBlack)),

                      Text('${data.desc}',
                          style:
                              TextStyle(fontSize: 15.sp, color: Colors.grey)),
                    ],
                  )
                ],
              ).paddingOnly(top: 10.h))
          .toList(),
    ).paddingOnly(top: 10.h);
  }
}
