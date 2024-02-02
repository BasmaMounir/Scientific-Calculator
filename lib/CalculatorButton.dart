import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  String text;
  Function onClickButton;
  int color;
  CalculatorButton({required this.text, required this.onClickButton,required this.color});
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      margin: EdgeInsets.all(2),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Color(color)),
            onPressed: () {
              onClickButton(text);
            },
            child: Text(
              text,
              style: TextStyle(fontSize: 25, color: Color(0xffffffff)),
            )),
      ),
    );
  }
}
