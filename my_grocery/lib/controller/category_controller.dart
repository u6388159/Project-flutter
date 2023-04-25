import 'package:get/get.dart';
import 'package:my_grocery/model/category.dart';
import 'package:my_grocery/service/local_service/local_category_service.dart';
import 'package:my_grocery/service/remote_service/remote_category_service.dart';

class CategoryController extends GetxController {
  // Create an instance of the controller that can be accessed from anywhere using Get.find()
  static CategoryController instance = Get.find();

  // An observable list of categories
  RxList<Category> categoryList = List<Category>.empty(growable: true).obs;

  // Create an instance of LocalCategoryService
  final LocalCategoryService _localCategoryService = LocalCategoryService();

  // An observable boolean value that indicates if categories are currently being loaded
  RxBool isCategoryLoading = false.obs;

  // This method is called when the controller is initialized
  @override
  void onInit() async {
    await _localCategoryService.init();
    getCategories(); // Call getCategories method to populate categoryList
    super.onInit();
  }

  // Fetches categories from both the local and remote services and updates the categoryList
  void getCategories() async {
    try {
      isCategoryLoading(true); // Set isCategoryLoading to true

      // If categories exist locally, assign them to the categoryList
      if (_localCategoryService.getCategories().isNotEmpty) {
        categoryList.assignAll(_localCategoryService.getCategories());
      }

      // Fetch categories from the remote service and assign them to the categoryList
      var result = await RemoteCategoryService().get();
      if (result != null) {
        categoryList.assignAll(categoryListFromJson(result.body));
        _localCategoryService.assignAllCategories(
            categories: categoryListFromJson(result.body));
      }
    } finally {
      isCategoryLoading(false); // Set isCategoryLoading to false
    }
  }
}
