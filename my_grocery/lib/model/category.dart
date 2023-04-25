import 'dart:convert'; // Importing the 'dart:convert' package to be able to decode JSON data.
import 'package:hive/hive.dart'; // Importing the Hive package.

part 'category.g.dart'; // Part statement to generate the adapter for this class.

List<Category> popularCategoryListFromJson(
        String
            val) => // A function that takes a string argument and returns a list of Category objects. It uses a factory constructor to create Category objects from the decoded JSON data.
    List<Category>.from(json
        .decode(val)['data']
        .map((category) => Category.popularCategoryFromJson(category)));

List<Category> categoryListFromJson(
        String
            val) => // A function that takes a string argument and returns a list of Category objects. It uses a factory constructor to create Category objects from the decoded JSON data.
    List<Category>.from(json
        .decode(val)['data']
        .map((category) => Category.categoryFromJson(category)));

@HiveType(
    typeId:
        2) // This annotation indicates that this class should be stored in a Hive box with a typeId of 2.
class Category {
  @HiveField(
      0) // This annotation indicates that the id field should be stored in the Hive box.
  final int id;
  @HiveField(
      1) // This annotation indicates that the name field should be stored in the Hive box.
  final String name;
  @HiveField(
      2) // This annotation indicates that the image field should be stored in the Hive box.
  final String image;

  Category(
      {required this.id,
      required this.name,
      required this.image}); // A constructor that initializes a Category object with an id, a name, and an image.

  factory Category.popularCategoryFromJson(
          Map<String, dynamic>
              data) => // A factory constructor that takes a Map<String, dynamic> argument and returns a Category object. It is used to create Category objects from the decoded JSON data.
      Category(
          id: data['id'],
          name: data['attributes']['category']['data']['attributes']['name'],
          image: data['attributes']['category']['data']['attributes']['image']
              ['data']['attributes']['url']);

  factory Category.categoryFromJson(
          Map<String, dynamic>
              data) => // A factory constructor that takes a Map<String, dynamic> argument and returns a Category object. It is used to create Category objects from the decoded JSON data.
      Category(
          id: data['id'],
          name: data['attributes']['name'],
          image: data['attributes']['image']['data']['attributes']['url']);
}
