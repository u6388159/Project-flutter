import 'package:http/http.dart' as http;
import 'package:my_grocery/const.dart';

class RemoteBannerService {
  // Create an instance of the http client to make API requests
  var client = http.Client();

  // Set the API endpoint for the banners
  var remoteUrl = '$baseUrl/api/banners';

  // Define a function to fetch all banners from the API
  Future<dynamic> get() async {
    var response = await client.get(
        // Set the URL to fetch all banners, with the 'populate' query parameter to include the image data
        Uri.parse('$remoteUrl?populate=image'));
    return response;
  }
}
