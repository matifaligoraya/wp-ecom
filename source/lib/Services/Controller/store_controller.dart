import 'package:get/get.dart';

import '../../Model/image_getting_model.dart';
import '../../Utils/Constants/base_adress_api.dart';

class StoreController extends GetxController {
  final isLoading = false.obs;
  RxList<ImageGettingModel> logoData = <ImageGettingModel>[].obs;

  @override
  void onInit() {
    _loadData();
    super.onInit();
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
}
