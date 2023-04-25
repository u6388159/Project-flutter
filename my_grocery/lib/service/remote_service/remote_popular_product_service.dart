import 'package:http/http.dart' as http;
import 'package:my_grocery/const.dart';

// This class is responsible for fetching popular products from the remote API
class RemotePopularProductService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/popular-products';

  // This method sends a GET request to the remote API to fetch popular products
  // with their associated products and images.
  Future<dynamic> get() async {
    var response = await client
        .get(Uri.parse('$remoteUrl?populate=product,product.images'));
    return response;
  }
}
