import 'dart:convert';

import 'package:ecom_wp/Model/Product%20Models/product.dart';
import 'package:get/get.dart';
import '../../Model/Product Models/product_cat_model.dart';
import '../../Utils/Constants/base_adress_api.dart';
import '../../Model/Product Models/product_image.dart';
import 'package:http/http.dart' as http;

class ShopController extends GetxController {
  RxList<Product> productData = <Product>[].obs;
  RxList<ProductImageModel> productImageData = <ProductImageModel>[].obs;
  RxList<ProductCatModel> productCategoryData = <ProductCatModel>[].obs;
  RxList<ProductCatModel> productTagData = <ProductCatModel>[].obs;
  Rx<ProductImageModel> productImageDetail = ProductImageModel().obs;

  final isLoading = false.obs;
  final isGridView = true.obs;
  RxList<bool> isGridviewScetionEnableList = <bool>[].obs;

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

  void toggleGridviewSection(int index) {
    isGridviewScetionEnableList[index] = !isGridviewScetionEnableList[index];
  }

  // Load product data by category
  Future<void> loadProductCatData() async {
    try {
      isLoading.value = true;

      // Get data using the "menus" endpoint
      var productsResponse =
          await BaseAdress.wooCommerceAPI.getAsync("product?per_page=100");

      // Map the response data to your model
      List<Product> produstResponsejson = (productsResponse as List)
          .map((productJson) => Product.fromJson(productJson))
          .toList();

      productData.value = produstResponsejson;
      isGridviewScetionEnableList
          .assignAll(List<bool>.generate(productData.length, (index) => false));
      for (var productImage in productData) {
        var productsResponse = await BaseAdress.wooCommerceAPI
            .getAsync("media/${productImage.featuredMedia}");

        var productImageJson = ProductImageModel.fromJson(productsResponse);
        productImageData.add(productImageJson);
      }

      isLoading.value = false;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

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
