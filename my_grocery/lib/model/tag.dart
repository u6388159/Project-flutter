// This class represents a product tag.
class Tag {
  final int id; // The tag's ID.
  final String title; // The tag's title.
  final double price; // The tag's price.

  // Constructor for the Tag class.
  Tag({required this.id, required this.title, required this.price});

  // Factory method to create a Tag object from JSON data.
  factory Tag.fromJson(Map<String, dynamic> data) => Tag(
      id: data['id'], // Parse the tag's ID from the JSON data.
      title: data['attributes']
          ['title'], // Parse the tag's title from the JSON data.
      price: data['attributes']['price']
          .toDouble() // Parse the tag's price from the JSON data and convert it to a double.
      );
}
