import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylockerapp/controller_binder.dart';
import 'package:mylockerapp/views/screens/splash_screen.dart';
import 'package:mylockerapp/views/utils/app_colors.dart';

class MyLockerApp extends StatelessWidget {
  const MyLockerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "My Locker App",
      debugShowCheckedModeBanner: false,
      initialBinding: ControllerBinder(),
      home: const SplashScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor: AppColors.primary,
            padding: const EdgeInsets.symmetric(vertical: 16),
            foregroundColor: AppColors.white,
            fixedSize: const Size.fromWidth(double.maxFinite),
          ),
        ),
      ),
    );
  }
}
