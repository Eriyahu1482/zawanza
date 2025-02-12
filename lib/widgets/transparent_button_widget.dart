import 'package:flutter/material.dart';

class TransparentButtonWidget extends StatelessWidget {
  final String buttonName;
  final Color buttonColor;
  final void Function()? onTap;

  const TransparentButtonWidget({
    super.key,
    required this.buttonName,
    required this.onTap,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        width: 300,
        height: 60,
        child: Text(buttonName, 
        style: TextStyle(
          fontSize: 18,
          color: buttonColor,
        )
        ),
      ),
    );
  }
}