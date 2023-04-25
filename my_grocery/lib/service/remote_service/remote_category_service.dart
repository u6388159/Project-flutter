import 'package:http/http.dart' as http;
import 'package:my_grocery/const.dart';

class RemoteCategoryService {
  // Create an instance of the HTTP client
  var client = http.Client();
  // Set the remote URL endpoint for the category API
  var remoteUrl = '$baseUrl/api/categories';

  // Define a function to retrieve all categories
  Future<dynamic> get() async {
    // Send a GET request to the remote API, including a query parameter to populate the image field of each category
    var response = await client.get(Uri.parse('$remoteUrl?populate=image'));
    // Return the response
    return response;
  }
}
