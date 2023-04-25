import 'package:hive/hive.dart';
import '../../model/user.dart';

class LocalAuthService {
  // Declare private variables to hold token and user boxes
  late Box<String> _tokenBox;
  late Box<User> _userBox;

  // Initialize token and user boxes
  Future<void> init() async {
    _tokenBox = await Hive.openBox<String>('token');
    _userBox = await Hive.openBox<User>('user');
  }

  // Add a token to the token box
  Future<void> addToken({required String token}) async {
    await _tokenBox.put('token', token);
  }

  // Add a user to the user box
  Future<void> addUser({required User user}) async {
    await _userBox.put('user', user);
  }

  // Clear both token and user boxes
  Future<void> clear() async {
    await _tokenBox.clear();
    await _userBox.clear();
  }

  // Get the token from the token box
  String? getToken() => _tokenBox.get('token');

  // Get the user from the user box
  User? getUser() => _userBox.get('user');
}
