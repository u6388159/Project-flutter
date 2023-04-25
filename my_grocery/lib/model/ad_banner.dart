// Importing the dart:convert library for JSON decoding and the Hive package for database management
import 'dart:convert';
import 'package:hive/hive.dart';

// Importing the generated file that contains the Hive type adapter for the AdBanner class
part 'ad_banner.g.dart';

// A function to convert a JSON string into a List of AdBanner objects
List<AdBanner> adBannerListFromJson(String val) => List<AdBanner>.from(
    // Decoding the JSON string and mapping each banner in the 'data' list to an AdBanner object
    json.decode(val)['data'].map((banner) => AdBanner.fromJson(banner)));

// A Hive type adapter class for the AdBanner class
@HiveType(typeId: 1)
class AdBanner {
  // Defining fields as HiveFields with a unique identifier
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String image;

  // Constructor with required fields
  AdBanner({required this.id, required this.image});

  // Factory constructor to create AdBanner object from JSON data
  factory AdBanner.fromJson(Map<String, dynamic> data) => AdBanner(
      // Extracting the 'id' and 'image' values from the 'data' map
      id: data['id'],
      image: data['attributes']['image']['data']['attributes']['url']);
}
