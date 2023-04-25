import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_grocery/model/product.dart';
import 'package:my_grocery/service/remote_service/remote_product.dart';

class ProductController extends GetxController {
  // Declare a static instance of the ProductController class that can be accessed from anywhere in the app
  static ProductController instance = Get.find();

  // Declare a text editing controller for the search bar text field
  TextEditingController searchTextEditController = TextEditingController();

  // Create a reactive variable to hold the current search value
  RxString searchVal = ''.obs;

  // Create a reactive list to hold the current list of products
  RxList<Product> productList = List<Product>.empty(growable: true).obs;

  // Create a reactive boolean variable to indicate if the app is currently loading products
  RxBool isProductLoading = false.obs;

  @override
  void onInit() {
    // Call the getProducts method when the controller is initialized
    getProducts();
    super.onInit();
  }

  // Fetch all products from the API
  void getProducts() async {
    try {
      // Set isProductLoading to true to indicate that the app is loading products
      isProductLoading(true);

      // Call the RemoteProductService class to fetch all products from the API
      var result = await RemoteProductService().get();

      // If the result is not null, assign the list of products to the productList reactive variable
      if (result != null) {
        productList.assignAll(productListFromJson(result.body));
      }
    } finally {
      // Set isProductLoading to false to indicate that the app is no longer loading products
      isProductLoading(false);

      // Print the length of the productList reactive variable for debugging purposes
      print(productList.length);
    }
  }

  // Fetch products by name from the API
  void getProductByName({required String keyword}) async {
    try {
      // Set isProductLoading to true to indicate that the app is loading products
      isProductLoading(true);

      // Call the RemoteProductService class to fetch products by name from the API
      var result = await RemoteProductService().getByName(keyword: keyword);

      // If the result is not null, assign the list of products to the productList reactive variable
      if (result != null) {
        productList.assignAll(productListFromJson(result.body));
      }
    } finally {
      // Set isProductLoading to false to indicate that the app is no longer loading products
      isProductLoading(false);

      // Print the length of the productList reactive variable for debugging purposes
      print(productList.length);
    }
  }

  // Fetch products by category ID from the API
  void getProductByCategory({required int id}) async {
    try {
      // Set isProductLoading to true to indicate that the app is loading products
      isProductLoading(true);

      // Call the RemoteProductService class to fetch products by category ID from the API
      var result = await RemoteProductService().getByCategory(id: id);

      // If the result is not null, assign the list of products to the productList reactive variable
      if (result != null) {
        productList.assignAll(productListFromJson(result.body));
      }
    } finally {
      // Set isProductLoading to false to indicate that the app is no longer loading products
      isProductLoading(false);

      // Print the length of the productList reactive variable for debugging purposes
      print(productList.length);
    }
  }
}
