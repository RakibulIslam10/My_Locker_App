import 'package:flutter/material.dart';
import 'package:mylockerapp/views/utils/app_colors.dart';
import 'package:mylockerapp/views/utils/app_config.dart';

class PrivacyPolicyContent extends StatelessWidget {
  const PrivacyPolicyContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
          text: "By continew to use ${AppConfig.appName} you agree to our ",style: TextStyle(color: AppColors.secondary),
          children: [
            TextSpan(
                text: " Privacy Policy",
                style: TextStyle(
                    color: AppColors.primary, fontWeight: FontWeight.bold)),
            TextSpan(
                text: " And ", style: TextStyle(color: AppColors.secondary)),
            TextSpan(
                text: " Terms of Service",
                style: TextStyle(
                    color: AppColors.primary, fontWeight: FontWeight.bold)),
          ]),
    );
  }
}
