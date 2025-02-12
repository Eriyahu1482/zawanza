import 'package:flutter/material.dart';

class AddButtonWidget extends StatelessWidget {
  final String buttonName;
  final Color buttonColor;
  final Color buttonTextColor;
  final Color buttonShadowColor;
  final IconData icon; // Используем IconData вместо Icon
  final VoidCallback? onTap;

  const AddButtonWidget({
    super.key,
    required this.buttonName,
    required this.buttonColor,
    required this.buttonTextColor,
    this.buttonShadowColor = Colors.transparent,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120, // Увеличили размер для размещения текста
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: buttonColor,
          boxShadow: [
            if (buttonShadowColor != Colors.transparent)
              BoxShadow(
                color: buttonShadowColor,
                blurRadius: 4,
                spreadRadius: 2,
              ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 8), // Добавляем отступ между иконкой и текстом
            Text(
              buttonName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: buttonTextColor,
                fontSize: 14,
                shadows: [
                  Shadow(
                    blurRadius: 4,
                    color: buttonShadowColor,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
            ),
            Icon(
              icon, // Используем переданный IconData
              color: buttonTextColor,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}