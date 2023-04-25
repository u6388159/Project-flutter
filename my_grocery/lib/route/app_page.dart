// This file defines the pages of the app as a list of GetPages.
// Each GetPage defines the name of the page (used for navigation),
// the corresponding widget to be displayed, and the binding to be used.
// The pages are accessed through the AppRoute class.

import 'package:get/get.dart';
import 'package:my_grocery/route/app_route.dart';
import 'package:my_grocery/view/dashboard/dashboard_binding.dart';
import 'package:my_grocery/view/dashboard/dashboard_screen.dart';

class AppPage {
  static var list = [
    GetPage(
        name: AppRoute.dashboard, // Name of the page used for navigation
        page: () =>
            const DashboardScreen(), // Corresponding widget to be displayed
        binding: DashboardBinding()), // Binding to be used
  ];
}
