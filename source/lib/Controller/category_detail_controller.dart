import 'package:ecom_wp/Model/Product%20Models/product.dart';
import 'package:get/get.dart';
import '../Constants/base_adress_api.dart';
import '../Model/Product Models/product_image.dart';
import '../Repositories/fetching_data.dart';

class CatDataController extends GetxController {
  final homerepo = HomeRepository().obs;
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

      // Load product category data
      List<Product> result =
          await homerepo.value.productDataByCat(catId: catId);
      productData.value = result;
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
