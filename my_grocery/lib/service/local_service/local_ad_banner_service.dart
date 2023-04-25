import 'package:hive/hive.dart'; // Importing the Hive package
import 'package:my_grocery/model/ad_banner.dart'; // Importing the AdBanner model

class LocalAdBannerService {
  late Box<AdBanner> _adBannerBox; // Declaring a Box to store AdBanner objects

  Future<void> init() async {
    // Initializing the service
    _adBannerBox =
        await Hive.openBox<AdBanner>('AdBanners'); // Opening the AdBanners box
  }

  Future<void> assignAllAdBanners({required List<AdBanner> adBanners}) async {
    await _adBannerBox.clear(); // Clearing all AdBanner objects from the box
    await _adBannerBox
        .addAll(adBanners); // Adding all AdBanner objects to the box
  }

  List<AdBanner> getAdBanners() => _adBannerBox.values
      .toList(); // Getting all AdBanner objects from the box and returning them as a List
}
