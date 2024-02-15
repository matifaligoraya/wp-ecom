import 'package:ecom_wp/Model/Product%20Models/product.dart';
import 'package:ecom_wp/Model/Product%20Models/product_cat_model.dart';
import 'package:ecom_wp/Model/Product%20Models/product_image.dart';
import 'package:get/get.dart';

import '../Constants/base_adress_api.dart';
import '../Model/image_getting_model.dart';
import '../Repositories/fetching_data.dart';

class HomeController extends GetxController {
  final homerepo = HomeRepository().obs;
  RxList<ImageGettingModel> logoData = <ImageGettingModel>[].obs;
  RxList<Product> productData = <Product>[].obs;
  RxList<ProductImageModel> productImageData = <ProductImageModel>[].obs;
  RxList<ProductCatModel> productCatData = <ProductCatModel>[].obs;
  final isLoading = false.obs;
  final isLoadingProductCat = false.obs;

  @override
  void onInit() {
    _loadData();
    _loadProductData();
    super.onInit();
  }

  // Load data for the controller
  Future<void> _loadData() async {
    try {
      isLoading.value = true;

      // Load logo data
      List<ImageGettingModel> result = await homerepo.value.logoDetails();
      logoData.value = result;
      isLoading.value = false;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Load product data and related image data
  Future<void> _loadProductData() async {
    try {
      isLoading.value = true;

      // Load product data
      List<Product> result = await homerepo.value.productData();
      productData.value = result;

      // Load product image data
      for (var productImage in productData) {
        var productsResponse = await BaseAdress.wooCommerceAPI
            .getAsync("media/${productImage.featuredMedia}");

        var productImageJson = ProductImageModel.fromJson(productsResponse);
        productImageData.add(productImageJson);
      }

      await _loadProductCatData();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Load product category data
  Future<void> _loadProductCatData() async {
    try {
      isLoadingProductCat.value = true;

      // Load product category data
      List<ProductCatModel> result = await homerepo.value.productCatData();
      productCatData.value = result;
      isLoadingProductCat.value = false;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoadingProductCat.value = false;
    }
  }
}
