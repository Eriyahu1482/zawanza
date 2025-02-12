import 'package:flutter/material.dart';
import 'package:zawanza1/models/user.dart';
import 'package:zawanza1/pages/login_page.dart';
import 'package:zawanza1/widgets/main_button_widget.dart';
import 'package:zawanza1/widgets/small_button_widget.dart';
import 'package:zawanza1/widgets/text_field_widget.dart';


import '../services/db_helper.dart';

class RegistrationPage extends StatefulWidget {
  static const routeName = '/registration-page';
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final DbHelper _dbHelper = DbHelper();

  _singUp() async {
    // ignore: unused_local_variable
    String phone = _phoneController.text;
    String nick = _nicknameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    if (nick.isEmpty || email.isEmpty || password.isEmpty) {
print('registrarion failed');
} else {
User user = User(nick: nick, password: password);
await _dbHelper.insertUser(user);
Navigator.of(context).pushNamedAndRemoveUntil(
LoginPage.routeName,
(Route<dynamic> route) => false,
);
}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 40,
              ),
              Center(child: Image.asset('assets/logo.png'),),
              const Padding(
                padding: EdgeInsets.only(left: 120, top: 100),
                  child: Text(
                'Регистрация',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(225, 244, 255, 1),
                    fontSize: 20),
              )),
              const SizedBox(height: 30),
              Column(
                children: <Widget>[
                  const SizedBox(height: 2),
                  TextFieldWidget(
                    controller: _nicknameController,
                    hintText: 'Введите имя',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                    controller: _phoneController,
                    hintText: 'Телефон',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                    controller: _emailController,
                    hintText: 'Введите email',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                    controller: _passwordController,
                    hintText: 'Введите пароль',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MainButtonWidget(
                    buttonWight: 230,
                    buttonName: 'Зарегистрироваться',
                  buttonColor: const Color.fromRGBO(0, 20, 56, 1),
                  buttonTextColor: const Color.fromRGBO(225, 244, 255, 1),
                    onTap: _singUp,
                  buttonHeight: 50
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: Row (children: [
                      const Text('Уже есть аккаунт?', 
                      style: 
                      TextStyle( 
                        color: Color.fromRGBO(225, 244, 255, 0.8),
                        fontSize: 12,)),
                     SmallButtonWidget(
                      buttonName: 'Войти',
                      buttonColor: Colors.transparent,
                      onTap: () {
                        Navigator.of(context).pushNamed(LoginPage.routeName);
                      },
                    ),
                 ],)
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}