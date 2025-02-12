import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zawanza1/pages/menu_page.dart';
import 'package:zawanza1/pages/registration_page.dart';
import 'package:zawanza1/services/db_helper.dart';
import 'package:zawanza1/widgets/small_button_widget.dart';
import 'package:zawanza1/widgets/text_field_widget.dart';

import '../widgets/main_button_widget.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login-page';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final DbHelper _dbHelper = DbHelper();

  _userLogin() async {
    String password = _passwordController.text;
    String email = _emailController.text;

    bool isAuthenticated = await _dbHelper.isUserAuthenticated(email, password);
    if (isAuthenticated) {
      Navigator.of(context).pushNamed(MenuPage.routeName);
    } else {
      if (kDebugMode) {
        print('Login failed');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 40,
              ),
              Center(child: Image.asset('assets/logo.png'),),
              const Padding(
                padding: EdgeInsets.only(left: 150, top: 180),
                  child: Text(
                'Войти',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(225, 244, 255, 1),
                    fontSize: 20),
              )),
              const SizedBox(height: 20),
              TextFieldWidget(
                  controller: _emailController,
                  hintText: 'Введите Email',),
              const SizedBox(height: 20),
              TextFieldWidget(
                controller: _passwordController,
                hintText: 'Введите пароль',
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 130),
                child: MainButtonWidget(
                  buttonWight: 90,
                  buttonName: 'Войти',
                  buttonColor: const Color.fromRGBO(0, 20, 56, 1),
                  buttonTextColor: const Color.fromRGBO(225, 244, 255, 1),
                  onTap: _userLogin,
                 buttonHeight: 50
                ),
              ),
              const SizedBox(height: 10,),
               Padding(
                    padding: const EdgeInsets.only(left: 65),
                    child: Row(children: [ 
                      const Text('У вас нет аккаунта?', 
                      style: 
                      TextStyle( 
                        color: Color.fromRGBO(225, 244, 255, 0.8),
                        fontSize: 12,)),
                      SmallButtonWidget(
                      buttonName: 'Зарегистрироваться',
                      buttonColor: Colors.transparent,
                      onTap: () {
                        Navigator.of(context).pushNamed(RegistrationPage.routeName);
                      },
                    ),
                  ],)),
            ],
          ),
        ),
      ),
    );
  }
}