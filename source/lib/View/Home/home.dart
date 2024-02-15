import 'package:ecom_wp/Model/fotter_model.dart';
import 'package:ecom_wp/Utils/utils.dart';
import 'package:ecom_wp/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Constants/app_colors.dart';
import '../../Controller/home_page_controller.dart';
import '../../Widgets/custom_drawer.dart';
import '../../Widgets/custom_widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final homePageController = Get.put(HomeController());
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
          physics: ClampingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              silverAppBar(
                  homePageController: homePageController,
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
                child: const CustomSlider(),
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
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: AppColors.primaryYellow, width: 2.0.w)),
                height: 400.h,
                width: double.infinity.w,
                child: Column(children: [
                  ///title and button section
                  Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: AppColors.darkBlack))),
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
                                      duration:
                                          const Duration(milliseconds: 1000),
                                      curve: Curves.easeInOutQuad,
                                    );
                                  },
                                  icon: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColors.darkBlack),
                                          shape: BoxShape.circle),
                                      child: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 12.0.h,
                                      ).paddingAll(5.0))),
                              IconButton(
                                  onPressed: () {
                                    pageViewController.animateToPage(
                                      pageViewController.page!.toInt() - 1,
                                      duration:
                                          const Duration(milliseconds: 1000),
                                      curve: Curves.easeInOutQuad,
                                    );
                                  },
                                  icon: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColors.darkBlack),
                                          shape: BoxShape.circle),
                                      child: Icon(
                                        Icons.arrow_back_ios_new_rounded,
                                        size: 12.0.h,
                                      ).paddingAll(5.0)))
                            ],
                          )
                        ]).paddingOnly(bottom: 5.0.h, top: 5.0.w),
                  )

                  //pageView
                  ,
                  Obx(
                    () => homePageController.isLoading.value
                        ? const Center(
                            child: CupertinoActivityIndicator(
                            color: AppColors.darkBlack,
                          ))
                        : Flexible(
                            child: PageView.builder(
                            controller: pageViewController,
                            itemCount: homePageController.productData.length,
                            itemBuilder: (context, index) {
                              var productCategoryIDs = homePageController
                                  .productData[index].productCat;

                              // Ensure productCategoryIDs is not null
                              if (productCategoryIDs != null &&
                                  productCategoryIDs.isNotEmpty) {
                                // Find the first matching category
                                var category = homePageController.productCatData
                                    .firstWhereOrNull(
                                  (element) =>
                                      productCategoryIDs.contains(element.id),
                                );

                                if (category != null) {
                                  var categoryName = category.name;

                                  // Use categoryName as needed in your UI
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Container(
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
                                                    '${homePageController.productImageData[index].mediaDetails?.sizes?.woocommerceThumbnail?.width ?? 70.h}'))),
                                      ),

                                      InkWell(
                                        onTap: () {
                                          Get.toNamed(Routes.CATDETAIL,
                                              arguments: {
                                                'catId': category.id,
                                                'homeController':
                                                    homePageController
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
                                        homePageController.productData[index]
                                                .title?.rendered ??
                                            '',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            color: AppColors.darkBlack,
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.visible,
                                      ),
                                      // HtmlWidget(
                                      //    data.content?.rendered?? '',
                                      // ),
                                      Row(
                                        children: [
                                          Text('\$82.98',
                                            style: TextStyle(
                                                fontSize: 18.sp,
                                                color: Colors.red[700],
                                                fontWeight: FontWeight.bold),
                                            overflow: TextOverflow.visible,
                                          ),
                                          SizedBox(width: 5.w,),
                                          Text('\$182.98',
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
                              return homePageController
                                      .isLoadingProductCat.value
                                  ? const Center(
                                      child: CupertinoActivityIndicator(
                                      color: AppColors.darkBlack,
                                    ))
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Container(
                                              child: cachenetworkImage(
                                                  homePageController
                                                          .productImageData[
                                                              index]
                                                          .mediaDetails
                                                          ?.sizes
                                                          ?.woocommerceThumbnail
                                                          ?.sourceUrl ??
                                                      '',
                                                  double.parse(
                                                      '${homePageController.productImageData[index].mediaDetails?.sizes?.woocommerceThumbnail?.height ?? 70.h}'),
                                                  double.parse(
                                                      '${homePageController.productImageData[index].mediaDetails?.sizes?.woocommerceThumbnail?.width ?? 70.h}'))),
                                        ),

                                        ///image
                                        Text(
                                          homePageController.productData[index]
                                                  .title?.rendered ??
                                              '',
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              color: AppColors.darkBlack,
                                              fontWeight: FontWeight.bold),
                                          overflow: TextOverflow.visible,
                                        ),
                                        // HtmlWidget(
                                        //    data.content?.rendered?? '',
                                        // )
                                      ],
                                    );
                            },
                          )),
                  )
                ]).paddingSymmetric(horizontal: 10.0.w),
              ).paddingSymmetric(horizontal: 15.0.w),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ));
  }

  Widget cardWidget() {
    return Obx(
      () => Column(
        children: homePageController.logoData.isNotEmpty
            ? homePageController.logoData
                .skip(8)
                .map((insideModelData) => Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.darkBlack)),
                      height: 140.h,
                      child: Stack(
                        children: [
                          Container(
                            child: homePageController.logoData.isNotEmpty
                                ? cachenetworkImage(
                                    insideModelData.sourceUrl ?? '',
                                    double.maxFinite.h,
                                    double.infinity.w)
                                : const SizedBox.shrink(),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: homePageController.logoData.isNotEmpty
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
                                    customButtton(
                                        'Shop Now', 40.h, 110.w, () async {})
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
