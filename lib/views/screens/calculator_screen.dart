import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylockerapp/views/controllers/calculator_controller.dart';
import 'package:mylockerapp/views/utils/app_colors.dart';
import 'package:mylockerapp/views/widgets/calculator_button.dart';
import 'package:mylockerapp/views/widgets/custom_app_bar.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: GetBuilder<CalculatorController>(
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Please enter your passcode",
                      style: TextStyle(color: AppColors.white.withOpacity(.3)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              controller.userInput.value,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 35,
                                  color: AppColors.white),
                            ),
                            Text(
                              controller.result.value,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                  color: AppColors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                    GridView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: controller.buttons.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15),
                      itemBuilder: (context, index) {
                        final buttons = controller.buttons[index];
                        return buttons.isEmpty
                            ? const SizedBox()
                            : buildCalculatorButton(buttons);
                      },
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
