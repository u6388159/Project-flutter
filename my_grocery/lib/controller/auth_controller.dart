import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:my_grocery/service/local_service/local_auth_service.dart';
import 'package:my_grocery/service/remote_service/remote_auth_service.dart';

import '../model/user.dart';

class AuthController extends GetxController {
  // Singleton instance of the AuthController using Getx
  static AuthController instance = Get.find();

  // Reactive variable for the user object
  Rxn<User> user = Rxn<User>();

  // Local authentication service for storing user data and token
  final LocalAuthService _localAuthService = LocalAuthService();

  @override
  void onInit() async {
    // Initializing the local authentication service
    await _localAuthService.init();
    super.onInit();
  }

  void signUp(
      {required String fullName,
      required String email,
      required String password}) async {
    try {
      // Show a loading screen when the user tries to sign up
      EasyLoading.show(
        status: 'Loading...',
        dismissOnTap: false,
      );
      // Call the sign up method from the RemoteAuthService and pass the email and password as parameters
      var result = await RemoteAuthService().signUp(
        email: email,
        password: password,
      );
      // If the sign up request returns a status code of 200 (OK)
      if (result.statusCode == 200) {
        // Retrieve the token from the response body
        String token = json.decode(result.body)['jwt'];
        // Call the createProfile method from the RemoteAuthService and pass the full name and token as parameters
        var userResult = await RemoteAuthService()
            .createProfile(fullName: fullName, token: token);
        // If the createProfile request returns a status code of 200 (OK)
        if (userResult.statusCode == 200) {
          // Convert the response body into a User object using the userFromJson method from the user model
          user.value = userFromJson(userResult.body);
          // Store the token locally using the addToken method from the local authentication service
          await _localAuthService.addToken(token: token);
          // Store the user object locally using the addUser method from the local authentication service
          await _localAuthService.addUser(user: user.value!);
          // Show a success message when the user is signed up successfully
          EasyLoading.showSuccess("Welcome to MyGrocery!");
          // Close the sign up screen and go back to the previous screen
          Navigator.of(Get.overlayContext!).pop();
        } else {
          // Show an error message if something goes wrong with the createProfile request
          EasyLoading.showError('Something wrong. Try again!');
        }
      } else {
        // Show an error message if something goes wrong with the sign up request
        EasyLoading.showError('Something wrong. Try again!');
      }
    } catch (e) {
      // Show an error message if there is an error in the sign up process
      EasyLoading.showError('Something wrong. Try again!');
    } finally {
      // Dismiss the loading screen when the sign up process is completed
      EasyLoading.dismiss();
    }
  }

  void signIn({required String email, required String password}) async {
    try {
      EasyLoading.show(
        status: 'Loading...',
        dismissOnTap: false,
      );
      var result = await RemoteAuthService().signIn(
        email: email,
        password: password,
      );
      if (result.statusCode == 200) {
        String token = json.decode(result.body)['jwt'];
        var userResult = await RemoteAuthService().getProfile(token: token);
        if (userResult.statusCode == 200) {
          user.value = userFromJson(userResult.body);
          await _localAuthService.addToken(token: token);
          await _localAuthService.addUser(user: user.value!);
          EasyLoading.showSuccess("Welcome to MyGrocery!");
          Navigator.of(Get.overlayContext!).pop();
        } else {
          EasyLoading.showError('Something wrong. Try again!');
        }
      } else {
        EasyLoading.showError('Username/password wrong');
      }
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError('Something wrong. Try again!');
    } finally {
      EasyLoading.dismiss();
    }
  }

  void signOut() async {
    user.value = null;
    await _localAuthService.clear();
  }
}
