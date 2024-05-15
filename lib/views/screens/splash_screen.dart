import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mylockerapp/views/controllers/splash_route_controller.dart';
import 'package:mylockerapp/views/utils/app_colors.dart';
import 'package:mylockerapp/views/utils/app_config.dart';
import 'package:mylockerapp/views/utils/assets_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    SplashRouteController().moveToHomePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 90),
              const Text(
                AppConfig.appName,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: AppColors.secondary),
              ),
              Lottie.asset(AssetsPath.loadingAnimation),
            ],
          ),
        ),
      ),
    );
  }
}
