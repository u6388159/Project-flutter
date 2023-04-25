import 'package:get/get.dart'; // import the GetX package

import 'package:my_grocery/controller/auth_controller.dart'; // import the AuthController class
import 'package:my_grocery/controller/category_controller.dart'; // import the CategoryController class
import 'package:my_grocery/controller/dashboard_controller.dart'; // import the DashboardController class
import 'package:my_grocery/controller/home_controller.dart'; // import the HomeController class
import 'package:my_grocery/controller/product_controller.dart'; // import the ProductController class

class DashboardBinding extends Bindings {
  // create a class that extends the Bindings class
  @override
  void dependencies() {
    // override the dependencies() method
    Get.put(
        DashboardController()); // register the DashboardController class with GetX
    Get.put(HomeController()); // register the HomeController class with GetX
    Get.put(
        ProductController()); // register the ProductController class with GetX
    Get.put(
        CategoryController()); // register the CategoryController class with GetX
    Get.put(AuthController()); // register the AuthController class with GetX
  }
}
