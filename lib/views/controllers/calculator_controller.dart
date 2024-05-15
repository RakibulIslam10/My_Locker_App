import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:mylockerapp/views/utils/app_colors.dart';

class CalculatorController extends GetxController {
  List<String> buttons = [
    '',
    '',
    'AC',
    'C',
    '7',
    '8',
    '9',
    '*',
    '4',
    '5',
    '6',
    '/',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+'
  ];

  Color getButtonTextColor(String index) {
    if (index == 'AC' ||
        index == 'C' ||
        index == '/' ||
        index == '*' ||
        index == '-' ||
        index == '+') {
      return AppColors.primary;
    } else {
      return AppColors.white;
    }
  }

  Color getButtonBgColor(String index) {
    if (index == '=') {
      return AppColors.primary;
    } else {
      return AppColors.secondary;
    }
  }

  RxString userInput = RxString("");
  RxString result = RxString("0");

  handleButtons(String index) {
    if (index == 'AC') {
      userInput.value = '';
      result.value = '0';
      update();
      return;
    }
    if (index == 'C') {
      if (userInput.isNotEmpty) {
        userInput.value =
            userInput.value.substring(0, userInput.value.length - 1);
        update();
        return;
      } else {
        return null;
      }
    }
    if (index == '=') {
      var calculated = calculation();
      if (calculated.endsWith('.0')) {
        result.value = calculated.replaceAll('.0', '');
        update();
        return;
      }
    }
    userInput.value = userInput.value + index;
    update();
    return;
  }

  String calculation() {
    try {
      var parsed = Parser().parse(userInput.value);
      var result = parsed.evaluate(EvaluationType.REAL, ContextModel());
      return result.toString();
    } catch (e) {
      return "Error";
    }
  }
}
