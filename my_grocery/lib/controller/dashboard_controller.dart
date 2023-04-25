import 'package:get/get.dart';

// Define a singleton instance of DashboardController
class DashboardController extends GetxController {
  static DashboardController instance = Get.find();

  // Define a variable to hold the index of the currently selected tab
  var tabIndex = 0;

  // Method to update the tab index and trigger a UI update
  void updateIndex(int index) {
    tabIndex = index;
    update();
  }
}
