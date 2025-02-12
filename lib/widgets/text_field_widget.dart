import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isObsText;
  final TextInputType inputType;

  const TextFieldWidget(
      {super.key,
      required this.controller,
      required this.hintText,
      this.isObsText = false,
      this.inputType = TextInputType.text});
  _validateEmail(String email) {
    final emailReg = RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?_`{|}~-]+@[a-z]");
    return emailReg.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        style: const TextStyle(
          fontSize: 15,
          color: Color.fromRGBO(0, 20, 56, 1),
        ),
        cursorColor: const Color.fromRGBO(7, 39, 99, 0.8),
        controller: controller,
        obscureText: isObsText,
        keyboardType: inputType,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Введите $hintText';
          }
          if (hintText == 'Актуальный email' && !_validateEmail(value)) {
            return 'Введите коректный email';
          }
          return null;
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide:
                BorderSide(color: Color.fromRGBO(0, 20, 56, 1), width: 2),
          ),
          hintStyle: const TextStyle(color: Colors.transparent),
          hintText: hintText,
          labelText: hintText,
          labelStyle: const TextStyle(
              fontSize: 15,
              color:  Color.fromRGBO(7, 39, 99, 0.8),
              fontWeight: FontWeight.w500),
          filled: true,
        ),
      ),
    );
  }
}