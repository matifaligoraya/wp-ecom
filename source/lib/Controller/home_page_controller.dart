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
  Rx<Product> productDetail = Product().obs;
  Rx<ProductImageModel> productImageDetail = ProductImageModel().obs;
  RxList<ProductImageModel> productImageData = <ProductImageModel>[].obs;
  RxList<ProductCatModel> productCatData = <ProductCatModel>[].obs;
  RxList<ProductCatModel> productCatList = <ProductCatModel>[].obs;
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
  Future<void> loadProductData() async {
    try {
      isLoadingProductCat.value = true;

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
      // Load product category data
      List<ProductCatModel> result = await homerepo.value.productCatData();
      productCatData.value = result;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {}
  }

Future<void> loadDeatilsOfProductDes({required int productId}) async {
  try {
    // Load product category data
    Product result = await homerepo.value.productDetails(productId: productId);
    productDetail.value = result;
    productImageDetail.value = productImageData.firstWhereOrNull(
      (image) => image.id == productDetail.value.featuredMedia,
    ) ??
        ProductImageModel();

    // Clear productCatList before adding new items
    productCatList.clear();

    List<int>? productCat = productDetail.value.productCat;
    if (productCat != null) {
      for (int catId in productCat) {
        // Fetch and add the products for each category ID
        var data = productCatData
            .where(
              (data) => data.id == catId,
            )
            .toList();
        productCatList.addAll(data);
      }
    }
  } catch (e) {
    Get.snackbar('Error', e.toString());
  } finally {
    // Any cleanup or additional actions after loading details
  }
}

}
