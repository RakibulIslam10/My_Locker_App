import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mylockerapp/views/controllers/calculator_controller.dart';
import 'package:mylockerapp/views/utils/app_colors.dart';

Widget buildCalculatorButton(String buttons) {
  final controller = Get.put(CalculatorController());
  return GestureDetector(
    onTap: () {
      controller.handleButtons(buttons);
    },
    child: Container(
      decoration: BoxDecoration(
          color: controller.getButtonBgColor(buttons),
          borderRadius: BorderRadiusDirectional.circular(20),
          border: const Border(
            top: BorderSide(color: AppColors.white, width: 1.5),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.2),
              blurRadius: 10,
              spreadRadius: 5,
            )
          ]),
      child: Center(
        child: Text(
          buttons,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
              color: controller.getButtonTextColor(buttons)),
        ),
      ),
    ),
  );
}
