import 'dart:convert';
import 'package:hive/hive.dart';
part 'user.g.dart'; // Generated Hive part file for User model

User userFromJson(String str) => User.fromJson(
    json.decode(str)); // Function to convert a JSON string to a User object

@HiveType(typeId: 4) // Hive object adapter for User model with type ID 4
class User {
  @HiveField(0) // Hive field ID 0 for id property
  String id;
  @HiveField(1) // Hive field ID 1 for fullName property
  String fullName;
  @HiveField(2) // Hive field ID 2 for email property
  String email;
  @HiveField(3) // Hive field ID 3 for image property
  String? image;
  @HiveField(4) // Hive field ID 4 for birthDay property
  DateTime? birthDay;

  User(
      {required this.id,
      required this.fullName,
      required this.email,
      this.image,
      this.birthDay}); // Constructor for User model

  factory User.fromJson(Map<String, dynamic> data) => User(
        // Factory method to create a User object from JSON data
        id: data['id'].toString(),
        fullName: data['fullName'],
        email: data['email'],
        image: data['image'] == null
            ? null
            : data['image'][
                'url'], // If image is null, set it to null, otherwise get the url property from the image object
        birthDay: data['age'] == null
            ? null
            : DateTime.parse(data[
                'age']), // If age is null, set it to null, otherwise parse the age string to a DateTime object
      );
}
