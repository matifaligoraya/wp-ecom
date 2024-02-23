import 'dart:convert';

import 'package:ecom_wp/Model/Product%20Models/product.dart';
import 'package:ecom_wp/Model/Product%20Models/product_cat_model.dart';
import 'package:ecom_wp/Model/Product%20Models/product_image.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../Utils/Constants/base_adress_api.dart';
import '../../Model/image_getting_model.dart';

class HomeController extends GetxController {
  RxList<ImageGettingModel> logoData = <ImageGettingModel>[].obs;
  RxList<Product> productData = <Product>[].obs;
  Rx<Product> productDetail = Product().obs;
  Rx<ProductImageModel> productImageDetail = ProductImageModel().obs;
  RxList<ProductImageModel> productImageData = <ProductImageModel>[].obs;
  RxList<ProductCatModel> productCatData = <ProductCatModel>[].obs;
  RxList<ProductCatModel> productCategoryData = <ProductCatModel>[].obs;
  RxList<ProductCatModel> productTagData = <ProductCatModel>[].obs;
  final isLoading = false.obs;
  final isLoadingProductCat = false.obs;

  @override
  void onInit() {
    _loadData();
    super.onInit();
  }

  // Add an RxInt for quantity
  var quantity = 1.obs;

  // Add a method to increment the quantity
  void incrementQuantity() {
    quantity.value++;
  }

  void updateQuantity(int newQuantity) {
    quantity.value = newQuantity;
  }

  // Add a method to decrement the quantity (with a check to prevent going below 1)
  void decrementQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }

  // Load data for the controller
  Future<void> _loadData() async {
    try {
      isLoading.value = true;
      var productsResponse = await BaseAdress.wooCommerceAPI.getAsync("media");

      // Map the response data to your model
      List<ImageGettingModel> logoImageData = (productsResponse as List)
          .map((productJson) => ImageGettingModel.fromJson(productJson))
          .toList();
      // Load logo data
      logoData.value = logoImageData;
      isLoading.value = false;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Load product data and related image data
  Future<void> loadProductData() async {
    try {
      isLoadingProductCat.value = true;

      // Get data using the "menus" endpoint
      var productsResponse =
          await BaseAdress.wooCommerceAPI.getAsync("product");

      // Map the response data to your model
      List<Product> produstResponsejson = (productsResponse as List)
          .map((productJson) => Product.fromJson(productJson))
          .toList();
      productData.value = produstResponsejson;

      productImageData.clear();

      // Load product image data
      for (var productImage in productData) {
        var productsResponse = await BaseAdress.wooCommerceAPI
            .getAsync("media/${productImage.featuredMedia}");

        var productImageJson = ProductImageModel.fromJson(productsResponse);
        productImageData.add(productImageJson);
      }

      await _loadProductCatData();
      await _loadProductTagData();
      isLoadingProductCat.value = false;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoadingProductCat.value = false;
    }
  }

  // Load product category data
  Future<void> _loadProductCatData() async {
    try {
      // Get data using the "product_cat" endpoint
      var productsResponse =
          await BaseAdress.wooCommerceAPI.getAsync("product_cat");

      // Map the response data to your model
      List<ProductCatModel> produstResponsejson = (productsResponse as List)
          .map((productJson) => ProductCatModel.fromJson(productJson))
          .toList();

      productCatData.value = produstResponsejson;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {}
  }

  Future<void> _loadProductTagData() async {
    try {
      // Get data using the "productTag" endpoint
      var productsResponse =
          await BaseAdress.wooCommerceAPI.getAsync("product_tag");

      // Map the response data to your model
      List<ProductCatModel> produstResponsejson = (productsResponse as List)
          .map((productJson) => ProductCatModel.fromJson(productJson))
          .toList();
      productTagData.value = produstResponsejson;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {}
  }

  // Future<void> loadDeatilsOfProductDes({required int productId}) async {
  //   try {
  //     // Load product category data

  //     // Clear productCatList before adding new items
  //     productCatList.clear();
  //       for (var proDuctCatData in productData) {

  //       }
  //     // productTagList.clear();

  //     // List<int>? productTag = productDetail.value.productTag;
  //     // if (productTag != null) {
  //     //   for (int catId in productTag) {
  //     //     // Fetch and add the products for each category ID
  //     //     var data = productTagData
  //     //         .where(
  //     //           (data) => data.id == catId,
  //     //         )
  //     //         .toList();
  //     //     productTagList.addAll(data);
  //     //   }
  //     // }
  //   } catch (e) {
  //     Get.snackbar('Error', e.toString());
  //   } finally {
  //     // Any cleanup or additional actions after loading details
  //   }
  // }

  Future<void> loadCatAndTag({required Product data}) async {
    try {
      productImageDetail.value = productImageData.firstWhereOrNull(
            (image) => image.id == data.featuredMedia,
          ) ??
          ProductImageModel();
      if (data.lLinks?.wpTerm?.first.taxonomy == 'product_cat') {
        productCategoryData.clear();
        var response =
            await http.get(Uri.parse("${data.lLinks?.wpTerm?.first.href}"));
        List<dynamic> responseJson = jsonDecode(response.body);
        List<ProductCatModel> productList =
            responseJson.map((json) => ProductCatModel.fromJson(json)).toList();
        productCategoryData.addAll(productList);
      }
      if (data.lLinks?.wpTerm?.last.taxonomy == 'product_tag') {
        productTagData.clear();
        var response =
            await http.get(Uri.parse("${data.lLinks?.wpTerm?.last.href}"));
        List<dynamic> responseJson = jsonDecode(response.body);
        List<ProductCatModel> productList =
            responseJson.map((json) => ProductCatModel.fromJson(json)).toList();
        productTagData.addAll(productList);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      // Any cleanup or additional actions after loading details
    }
  }
}
