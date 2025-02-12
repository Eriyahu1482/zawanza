import 'package:flutter/material.dart';

class SmallButtonWidget extends StatelessWidget {
  final String buttonName;
  final Color buttonColor;
  final void Function()? onTap;

  const SmallButtonWidget({
    Key? key,
    required this.buttonName,
    required this.buttonColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: buttonColor,
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            buttonName,
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: Color.fromRGBO(225, 244, 255, 1),
                        fontSize: 12,
            ),
          )
        ]),
      ),
    );
  }
}