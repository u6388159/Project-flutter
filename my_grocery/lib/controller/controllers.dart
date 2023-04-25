import 'package:my_grocery/controller/auth_controller.dart';
import 'package:my_grocery/controller/category_controller.dart';
import 'package:my_grocery/controller/home_controller.dart';
import 'package:my_grocery/controller/product_controller.dart';

import 'dashboard_controller.dart';

// Initialize the controller instances for each of the controllers.
// The ".instance" getter method provided by the GetX library returns a singleton instance of the controller class,
// which ensures that there is only one instance of each controller throughout the entire application.
HomeController homeController = HomeController.instance;
ProductController productController = ProductController.instance;
DashboardController dashboardController = DashboardController.instance;
CategoryController categoryController = CategoryController.instance;
AuthController authController = AuthController.instance;
