import 'package:get/get.dart';
import 'package:mylockerapp/views/controllers/calculator_controller.dart';
import 'package:mylockerapp/views/controllers/splash_route_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashRouteController());
   Get.lazyPut(() => CalculatorController());

  }
}
