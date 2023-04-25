import 'package:hive/hive.dart';
import '../../model/product.dart';

class LocalProductService {
  late Box<Product>
      _popularProductBox; // Declare a Box instance for storing popular products

  Future<void> init() async {
    _popularProductBox = await Hive.openBox<Product>(
        'PopularProducts'); // Open the Box for popular products
  }

  Future<void> assignAllPopularProducts(
      {required List<Product> popularProducts}) async {
    await _popularProductBox.clear(); // Clear the existing products
    await _popularProductBox
        .addAll(popularProducts); // Add all popular products to the Box
  }

  List<Product> getPopularProducts() => _popularProductBox.values
      .toList(); // Retrieve all popular products from the Box and return as a list
}
