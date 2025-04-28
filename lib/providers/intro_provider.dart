import 'package:get/get.dart';
import 'package:gloryai/routing/app_navigator.dart';
import 'package:gloryai/routing/app_route_names.dart';

class IntroProvider extends GetxController {
  // Observable for loading state
  final isLoading = false.obs;

  // Method to handle proceed action
  Future<void> proceedToNextScreen() async {
    isLoading.value = true; // Start loading
    await Future.delayed(const Duration(seconds: 3)); // Wait 3 seconds
    isLoading.value = false; // Stop loading
    AppNavigation.navigateTo(AppRoutesNames.introRatingScreen); // Navigate
  }

  // Method for login navigation
  void navigateToLogin() {
    AppNavigation.navigateTo(AppRoutesNames.introLoginScreen);
  }
}