import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // Add navigation after delay
    Future.delayed(const Duration(seconds: 3), () {
      // Navigate to home or login screen
      Get.offAllNamed('/login-page'); // Change this to your desired route
    });
  }

  @override
  void onClose() {
    // Clean up any resources if needed
    super.onClose();
  }
}
