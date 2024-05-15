import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mylockerapp/views/screens/calculator_screen.dart';
import 'package:mylockerapp/views/utils/app_colors.dart';
import 'package:mylockerapp/views/utils/app_config.dart';
import 'package:mylockerapp/views/utils/assets_path.dart';
import 'package:mylockerapp/views/widgets/privacy_policy_content.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SvgPicture.asset(
                      AssetsPath.banner,
                      height: 300,
                    ),
                    const Text(
                      "Welcome to ${AppConfig.appName}",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondary),
                    ),
                    const Text(
                      "Hide all your privacy behind secrete calculator!",
                      style: TextStyle(fontSize: 16, color: AppColors.darkBlue),
                    ),
                    const SizedBox(height: 10),
                    buildNoticeBox(size),
                    const SizedBox(height: 12),
                    const PrivacyPolicyContent(),
                  ],
                ),
                const SizedBox(height: 16),
                Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Get.offAll(() => const CalculatorScreen());
                        },
                        child: const Text(
                          "Agree & Continue",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        )),
                    const SizedBox(height: 12),
                   GestureDetector(
                     onTap: () {
                       Get.defaultDialog(
                           titlePadding: const EdgeInsets.symmetric(
                               horizontal: 16, vertical: 10),
                           title: "Are you sure ?",
                           content: const Column(
                             children: [
                               Text(
                                   "If you disagree you will not able to use "),
                               SizedBox(height: 10),
                               PrivacyPolicyContent(),
                             ],
                           ),
                           contentPadding: const EdgeInsets.symmetric(
                               horizontal: 16, vertical: 8),
                           actions: [
                             TextButton(
                                 onPressed: () {
                                   SystemNavigator.pop();
                                 },
                                 child: const Text(
                                   "Exit",
                                   style: TextStyle(
                                       color: AppColors.secondary,
                                       fontWeight: FontWeight.bold),
                                 )),
                             TextButton(
                                 onPressed: () {
                                   Get.offAll(
                                           () => const CalculatorScreen());
                                 },
                                 child: const Text(
                                   "Continue",
                                   style: TextStyle(
                                       color: AppColors.primary,
                                       fontWeight: FontWeight.bold),
                                 )),
                           ]);
                     },
                     child: const Text(
                        "Disagree",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.secondary),
                      ),
                   ),

                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNoticeBox(Size size) {
    return Container(
      height: size.height * .25,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 32),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const SingleChildScrollView(
          child: Column(
        children: [
          Text(
            "Privacy and permission Notice",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.secondary),
          ),
          SizedBox(height: 8),
          Text(
            '''
      Use of Your Personal information
In general, personal information you submit to us is used either to respond
 to requests that you make, aid us in serving you better, or market our Services.
We use your personal information in the following ways:
Operate, maintain, and improve our site(s), products, and services;
Respond to comments and questions and provide customer service;
Link or combine user information with other personal information we get from 
third parties, to help understand your needs and provide you with better service;
Develop, improve, and deliver marketing and advertising for the Services;
      ''',
            style: TextStyle(color: AppColors.darkBlue),
          )
        ],
      )),
    );
  }
}
