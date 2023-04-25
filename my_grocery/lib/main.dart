import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart'; // Importing the Flutter EasyLoading package for showing loading indicators
import 'package:get/get.dart'; // Importing the Get package for routing and state management
import 'package:hive_flutter/hive_flutter.dart'; // Importing the Hive Flutter package for local data storage
import 'package:my_grocery/model/ad_banner.dart';
import 'package:my_grocery/model/category.dart';
import 'package:my_grocery/model/product.dart';
import 'package:my_grocery/model/user.dart';
import 'package:my_grocery/route/app_page.dart'; // Importing custom page routes
import 'package:my_grocery/route/app_route.dart'; // Importing custom app routes
import 'package:my_grocery/theme/app_theme.dart'; // Importing custom app themes

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensures that the Flutter bindings have been initialized
  await Hive.initFlutter(); // Initializes Hive for local data storage

  //register adapters
  Hive.registerAdapter(
      AdBannerAdapter()); // Registering adapters for data models
  Hive.registerAdapter(CategoryAdapter());
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(UserAdapter());

  configLoading(); // Configuring the Flutter EasyLoading package
  runApp(const MyApp()); // Running the app
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPage.list, // Registering custom page routes
      initialRoute: AppRoute.dashboard, // Setting the initial route of the app
      debugShowCheckedModeBanner:
          false, // Hides the debug banner in release mode
      theme: AppTheme.lightTheme, // Setting the app theme
      themeMode: ThemeMode.light, // Setting the theme mode
      builder:
          EasyLoading.init(), // Initializing the Flutter EasyLoading package
    );
  }
}

void configLoading() {
  EasyLoading.instance // Configuring the Flutter EasyLoading instance
    ..displayDuration = const Duration(
        milliseconds:
            2000) // Setting the duration for which the loading indicator will be displayed
    ..indicatorType =
        EasyLoadingIndicatorType.fadingCircle // Setting the indicator type
    ..loadingStyle = EasyLoadingStyle.dark // Setting the loading style
    ..indicatorSize = 45.0 // Setting the indicator size
    ..radius = 10.0 // Setting the indicator radius
    ..progressColor =
        Colors.white // Setting the color of the progress indicator
    ..backgroundColor = Colors.green // Setting the background color
    ..indicatorColor =
        Colors.white // Setting the color of the loading indicator
    ..textColor = Colors.white // Setting the text color
    ..userInteractions =
        false // Disabling user interactions while the loading indicator is displayed
    ..maskType = EasyLoadingMaskType.black // Setting the mask type
    ..dismissOnTap = true; // Dismissing the loading indicator on tap
}
