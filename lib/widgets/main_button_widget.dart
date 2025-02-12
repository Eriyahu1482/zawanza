import 'package:flutter/material.dart';

class MainButtonWidget extends StatelessWidget {
  final String buttonName;
  final Color buttonColor;
  final Color buttonTextColor;
  final Color buttonShadowColor;
  final double buttonWight;
  final double buttonHeight;
  final void Function()? onTap;

  const MainButtonWidget({
    super.key,
    required this.buttonWight,
    required this.buttonName,
    required this.buttonColor,
    required this.buttonTextColor,
    this.buttonShadowColor = Colors.white,
    required this.onTap, required this.buttonHeight,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: buttonWight,
        height: buttonHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: buttonColor,
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            buttonName,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: buttonTextColor,
              fontSize: 14,
              shadows: [
                    Shadow(
                      blurRadius: 25, 
                      color: Color.fromRGBO(27,99,233, 1), 
                    ),
                  ],
            ),
          )
        ]),
      ),
    );
  }
}