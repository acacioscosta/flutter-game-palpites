import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final Color colorText;
  final String text;
  final double size;
  final void Function() press;

  CustomButton({
    @required this.colorText,
    @required this.text,
    @required this.size,
    @required this.press
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.transparent,
      textColor: colorText,
      child: Text(
        text,
        style: TextStyle(fontSize: size),
      ),
      onPressed: press
    );
  }
}