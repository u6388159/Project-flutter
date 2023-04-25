import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:get/get.dart';
import 'package:my_grocery/controller/dashboard_controller.dart';
import 'package:my_grocery/view/category/category_screen.dart';
import 'package:my_grocery/view/home/home_screen.dart';
import 'package:my_grocery/view/product/product_screen.dart';
import '../account/account_screen.dart';

// Define a stateless widget called DashboardScreen
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the GetBuilder to access the DashboardController
    return GetBuilder<DashboardController>(
      builder: (controller) => Scaffold(
        // Set the background color of the screen
        backgroundColor: Colors.grey.shade100,
        body: SafeArea(
          child: IndexedStack(
            // Use the tabIndex variable from the DashboardController to determine which screen to show
            index: controller.tabIndex,
            // Create an IndexedStack widget with the home, product, category, and account screens as children
            children: const [
              HomeScreen(),
              ProductScreen(),
              CategoryScreen(),
              AccountScreen()
            ],
          ),
        ),
        bottomNavigationBar: Container(
          // Create a container to hold the bottom navigation bar
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  top: BorderSide(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 0.7))),
          child: SnakeNavigationBar.color(
            // Use the SnakeNavigationBar package for the bottom navigation bar
            behaviour: SnakeBarBehaviour.floating,
            snakeShape: SnakeShape.circle,
            padding: const EdgeInsets.symmetric(vertical: 5),
            unselectedLabelStyle: const TextStyle(fontSize: 11),
            snakeViewColor: Theme.of(context).primaryColor,
            unselectedItemColor: Theme.of(context).colorScheme.secondary,
            showUnselectedLabels: true,
            // Set the current index of the bottom navigation bar to the tabIndex variable from the DashboardController
            currentIndex: controller.tabIndex,
            // Call the updateIndex function from the DashboardController when a new tab is selected
            onTap: (val) {
              controller.updateIndex(val);
            },
            // Define the items for the bottom navigation bar
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: 'Category'),
              BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle), label: 'Account')
            ],
          ),
        ),
      ),
    );
  }
}
