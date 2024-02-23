import 'package:ecom_wp/Model/Product%20Models/product.dart';
import 'package:get/get.dart';
import '../../Utils/Constants/base_adress_api.dart';
import '../../Model/Product Models/product_image.dart';

class CatDataController extends GetxController {
  RxList<Product> productData = <Product>[].obs;
  RxList<ProductImageModel> productImageData = <ProductImageModel>[].obs;
  final isLoading = false.obs;
  final isGridView = true.obs;
  RxList<bool> isGridviewScetionEnableList = <bool>[].obs;

  void toggleGridviewSection(int index) {
    isGridviewScetionEnableList[index] = !isGridviewScetionEnableList[index];
  }

  // Load product data by category
  Future<void> loadProductCatData({required int catId}) async {
    try {
      isLoading.value = true;

      // Get data using the "menus" endpoint
      var productsResponse = await BaseAdress.wooCommerceAPI
          .getAsync("product?product_cat=$catId");

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
}
