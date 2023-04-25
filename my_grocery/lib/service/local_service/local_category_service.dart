import 'package:hive/hive.dart';
import '../../model/category.dart';

class LocalCategoryService {
  // Declares two instance variables of type Box<Category>
  late Box<Category> _popularCategoryBox;
  late Box<Category> _categoryBox;

  // Initializes the boxes
  Future<void> init() async {
    _popularCategoryBox = await Hive.openBox<Category>('PopularCategories');
    _categoryBox = await Hive.openBox<Category>('categories');
  }

  // Assigns all popular categories to the popular categories box
  Future<void> assignAllPopularCategories(
      {required List<Category> popularCategories}) async {
    await _popularCategoryBox.clear();
    await _popularCategoryBox.addAll(popularCategories);
  }

  // Assigns all categories to the categories box
  Future<void> assignAllCategories({required List<Category> categories}) async {
    await _categoryBox.clear();
    await _categoryBox.addAll(categories);
  }

  // Returns a list of all the popular categories in the popular categories box
  List<Category> getPopularCategories() => _popularCategoryBox.values.toList();

  // Returns a list of all the categories in the categories box
  List<Category> getCategories() => _categoryBox.values.toList();
}
