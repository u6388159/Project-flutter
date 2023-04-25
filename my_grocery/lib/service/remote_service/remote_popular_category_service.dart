import 'package:http/http.dart' as http;
import 'package:my_grocery/const.dart';

class RemotePopularCategoryService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/popular-categories';

  // A method that fetches popular categories from the remote API
  // and returns a Future that resolves to a http.Response object.
  Future<dynamic> get() async {
    var response = await client.get(
        // The API endpoint URL, with query parameters to specify what to populate and limit the result set.
        Uri.parse(
            '$remoteUrl?populate=category,category.image&pagination[start]=0&pagination[limit]=5'));
    return response;
  }
}
