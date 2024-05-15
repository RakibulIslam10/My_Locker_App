import 'package:get/get.dart';
import 'package:mylockerapp/views/screens/calculator_screen.dart';
import 'package:mylockerapp/views/screens/welcome_screen.dart';

class SplashRouteController extends GetxController {
  Future<void> moveToHomePage() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    Get.to(() => const WelcomeScreen());
  }
}
