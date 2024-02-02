import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/CalculatorButton.dart';

class ScientificCalculator extends StatefulWidget {
  static const String routeName = 'ScientificCalculator';
  @override
  State<ScientificCalculator> createState() => _ScientificCalculatorState();
}

class _ScientificCalculatorState extends State<ScientificCalculator> {
  String txtResult = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Scientific Calculator',
          style: TextStyle(color: Color(0xffffffff), fontSize: 25),
        ),
        backgroundColor: Color(0xffFFB6B5),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
            margin: EdgeInsets.all(2),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 4, color: Color(0xff871A69))),
            child: Text(
              txtResult,
              style: TextStyle(fontSize: 25),
            ),
          )),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(
                  text: 'sin',
                  onClickButton: sinCosCalc,
                  color: 0xffF4929B,
                ),
                CalculatorButton(
                  text: 'cos',
                  onClickButton: sinCosCalc,
                  color: 0xffF49596,
                ),
                CalculatorButton(
                  text: 'tan',
                  onClickButton: sinCosCalc,
                  color: 0xffF49990,
                ),
                CalculatorButton(
                  text: 'Log',
                  onClickButton: sinCosCalc,
                  color: 0xffF49B8E,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(
                    text: 'x²', onClickButton: sinCosCalc, color: 0xffF4929B),
                CalculatorButton(
                  text: 'n!',
                  onClickButton: sinCosCalc,
                  color: 0xffF49596,
                ),
                CalculatorButton(
                  text: 'π',
                  onClickButton: onClickButtonFun,
                  color: 0xffF49990,
                ),
                CalculatorButton(
                  text: 'e',
                  onClickButton: onClickButtonFun,
                  color: 0xffF49B8E,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(
                  text: 'CE',
                  onClickButton: onClickClear,
                  color: 0xffF4929B,
                ),
                CalculatorButton(
                  text: '√x',
                  onClickButton: sinCosCalc,
                  color: 0xffF49596,
                ),
                CalculatorButton(
                  text: '%',
                  onClickButton: onClickOperator,
                  color: 0xffF49990,
                ),
                CalculatorButton(
                  text: '÷',
                  onClickButton: onClickOperator,
                  color: 0xffF49B8E,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(
                  text: '7',
                  onClickButton: onClickButtonFun,
                  color: 0xffFFC0A8,
                ),
                CalculatorButton(
                  text: '8',
                  onClickButton: onClickButtonFun,
                  color: 0xffFFC0A8,
                ),
                CalculatorButton(
                  text: '9',
                  onClickButton: onClickButtonFun,
                  color: 0xffFFB6B5,
                ),
                CalculatorButton(
                  text: 'x',
                  onClickButton: onClickOperator,
                  color: 0xffF4929B,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(
                  text: '4',
                  onClickButton: onClickButtonFun,
                  color: 0xffFFB6B5,
                ),
                CalculatorButton(
                  text: '5',
                  onClickButton: onClickButtonFun,
                  color: 0xffFFB6B5,
                ),
                CalculatorButton(
                  text: '6',
                  onClickButton: onClickButtonFun,
                  color: 0xffFFC0A8,
                ),
                CalculatorButton(
                  text: '+',
                  onClickButton: onClickOperator,
                  color: 0xffF49B8E,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(
                  text: '1',
                  onClickButton: onClickButtonFun,
                  color: 0xffFFC0A8,
                ),
                CalculatorButton(
                  text: '2',
                  onClickButton: onClickButtonFun,
                  color: 0xffFFC0A8,
                ),
                CalculatorButton(
                  text: '3',
                  onClickButton: onClickButtonFun,
                  color: 0xffFFB6B5,
                ),
                CalculatorButton(
                  text: '-',
                  onClickButton: onClickOperator,
                  color: 0xffF4929B,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorButton(
                  text: '0',
                  onClickButton: onClickButtonFun,
                  color: 0xffFFB6B5,
                ),
                CalculatorButton(
                  text: '00',
                  onClickButton: onClickButtonFun,
                  color: 0xffFFB6B5,
                ),
                CalculatorButton(
                  text: '.',
                  onClickButton: onClickButtonFun,
                  color: 0xffFFC0A8,
                ),
                CalculatorButton(
                  text: '=',
                  onClickButton: onEqualButton,
                  color: 0xff871A69,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onClickButtonFun(String number) {
    if (number == 'e') {
      txtResult = e.toString();
    } else if (number == 'π') {
      txtResult = pi.toString();
    } else {
      txtResult += number;
    }
    setState(() {});
  }

  String leftHandSaid = '';
  String oper = '';
  void onClickOperator(String operator) {
    if (oper.isEmpty) {
      leftHandSaid = txtResult;
    } else {
      String rightHandSaid = txtResult;
      leftHandSaid = calculator(leftHandSaid, operator, rightHandSaid);
    }
    oper = operator;
    txtResult = '';
    setState(() {});
  }

  String calculator(
      String leftHandSaid, String operator, String rightHandSaid) {
    double number1 = double.parse(leftHandSaid);
    double number2 = double.parse(rightHandSaid);
    double result = 0;
    switch (operator) {
      case '+':
        result = number1 + number2;
        break;
      case '-':
        result = number1 - number2;
        break;
      case 'x':
        result = number1 * number2;
        break;
      case '÷':
        result = number1 / number2;
        break;
      case '%':
        result = number1 % number2;
        break;
    }

    return result.toString();
  }

  void onEqualButton(String equal) {
    String rhs = txtResult;
    txtResult = calculator(leftHandSaid, oper, rhs);
    rhs = '';
    oper = '';
    setState(() {});
  }

  void onClickClear(String CE) {
    txtResult = '';
    setState(() {});
  }

  void sinCosCalc(String operator) {
    double factorial(double n) {
      if (n == 0 || n == 1) {
        return 1;
      } else {
        return n * factorial(n - 1);
      }
    }

    double number1 = double.parse(txtResult);
    txtResult = '';
    switch (operator) {
      case 'sin':
        txtResult = (sin(number1 * pi / 180).toStringAsFixed(3));
        break;
      case 'cos':
        txtResult = (cos(number1 * pi / 180).toStringAsFixed(3));
        break;
      case 'tan':
        txtResult = (tan(number1 * pi / 180).toStringAsFixed(3));
        break;
      case 'Log':
        txtResult = ((log(number1) / ln10).toStringAsFixed(1));
        break;
      case 'x²':
        txtResult = (pow(number1, 2)).toStringAsFixed(1);
        break;
      case 'n!':
        txtResult = factorial(number1).toString();
        break;
      case '√x':
        txtResult = sqrt(number1).toString();
        break;
    }

    setState(() {});
  }
}
