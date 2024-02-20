import 'package:ecom_wp/Constants/base_adress_api.dart';
import 'package:ecom_wp/Model/Product%20Models/product_cat_model.dart';
import 'package:ecom_wp/Model/image_getting_model.dart';
import 'package:ecom_wp/Model/Product%20Models/product.dart';

class HomeRepository {
  Future<List<ImageGettingModel>> logoDetails() async {
  try {
    // Get data using the "menus" endpoint
    var productsResponse = await BaseAdress.wooCommerceAPI.getAsync("media");

    // Map the response data to your model
    List<ImageGettingModel> logoImageData = (productsResponse as List)
        .map((productJson) => ImageGettingModel.fromJson(productJson))
        .toList();

    return logoImageData;
  } catch (e) {
    throw Exception(e.toString());
  }
}

Future<List<Product>> productData() async {
  try {

    // Get data using the "menus" endpoint
    var productsResponse = await BaseAdress.wooCommerceAPI.getAsync("product");

    // Map the response data to your model
    List<Product> produstResponsejson = (productsResponse as List)
        .map((productJson) => Product.fromJson(productJson))
        .toList();

    return produstResponsejson;
  } catch (e) {
    throw Exception(e.toString());
  }
}

Future<List<ProductCatModel>> productCatData() async {
  try {

    // Get data using the "menus" endpoint
    var productsResponse = await BaseAdress.wooCommerceAPI.getAsync("product_cat");

    // Map the response data to your model
    List<ProductCatModel> produstResponsejson = (productsResponse as List)
        .map((productJson) => ProductCatModel.fromJson(productJson))
        .toList();

    return produstResponsejson;
  } catch (e) {
    throw Exception(e.toString());
  }
}

Future<List<Product>> productDataByCat({required int catId}) async {
  try {

    // Get data using the "menus" endpoint
    var productsResponse = await BaseAdress.wooCommerceAPI.getAsync("product?product_cat=$catId");

    // Map the response data to your model
    List<Product> produstResponsejson = (productsResponse as List)
        .map((productJson) => Product.fromJson(productJson))
        .toList();

    return produstResponsejson;
  } catch (e) {
    throw Exception(e.toString());
  }
}

Future<Product> productDetails({required int productId}) async {
  try {

    // Get data using the "menus" endpoint
    var productsResponse = await BaseAdress.wooCommerceAPI.getAsync("product/$productId");

     Product product = Product.fromJson(productsResponse);

    return product;
  } catch (e) {
    throw Exception(e.toString());
  }
}
}
