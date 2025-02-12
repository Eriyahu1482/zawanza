import 'package:flutter/material.dart';
import 'package:zawanza1/pages/media_page.dart';
import 'package:zawanza1/pages/menu_page.dart';
import 'package:zawanza1/pages/profile_page.dart';
import 'package:zawanza1/widgets/main_button_widget.dart';
import 'package:zawanza1/widgets/text_field_widget.dart';

class ChangePasswordPage extends StatefulWidget {
  static const routeName = '/change-page';
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _nicknameController1 = TextEditingController();
        int _selectedIndex = 3;

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return; // Не делаем ничего, если нажата текущая иконка

    setState(() {
      _selectedIndex = index;
    });

    // Навигация к соответствующим страницам
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, MenuPage.routeName);
        break;
      case 1:
        Navigator.pushReplacementNamed(context, MediaPage.routeName);
        break;
      case 2:
        Navigator.pushReplacementNamed(context, MediaPage.routeName);
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      body: SingleChildScrollView(
        child: Column(
        children: [
            const SizedBox(height: 50),
            Center(
              child: Image.asset('assets/logo.png'),
            ),
            const SizedBox(height: 200),
            SizedBox(
              width: 300,
              child: Text(
                'Изменить пароль',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(255, 244, 255, 1),
                  fontSize: 20,
                   shadows: [
                    Shadow(
                      blurRadius: 25, 
                      color: Color.fromRGBO(27,99,233, 1), 
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.only(right: 30, left: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15,),
                      TextFieldWidget(controller: _nicknameController, hintText: 'Новый пароль'),
                      const SizedBox(height: 15,),
                      TextFieldWidget(controller: _nicknameController1, hintText: 'Повторите пароль'),
                      const SizedBox(height: 15,),
                      MainButtonWidget(buttonWight: 220, buttonName: 'Сохранить изменения', buttonColor: Color.fromRGBO(0, 20, 56, 1), buttonTextColor: Colors.white, onTap: (){Navigator.pushReplacementNamed(context, ProfilePage.routeName);}, buttonHeight: 50,)
                    ],
                  ),
                ),
        
        ],
        ),
      ),
         bottomNavigationBar: BottomNavigationBar(
        elevation: 8,
        items: [
          _buildBottomNavigationBarItem(0, 'assets/home.png', 'assets/homealt.png', 'Главная'),
          _buildBottomNavigationBarItem(1, 'assets/mediateka.png', 'assets/mediatekaalt.png', 'Моя медиатека'),
          _buildBottomNavigationBarItem(2, 'assets/search.png', 'assets/searchalt.png', 'Поиск'),
          _buildBottomNavigationBarItem(3, 'assets/profile.png', 'assets/profilealt.png', 'Мой профиль'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromRGBO(225, 244, 255, 0.8),
        unselectedItemColor: Color.fromRGBO(225, 244, 255, 0.6),
        onTap: _onItemTapped,
        iconSize: 60,
        showSelectedLabels: true,
        showUnselectedLabels: true,
    )
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(int index, String defaultIcon, String selectedIcon, String label) {
    return BottomNavigationBarItem(
      backgroundColor: Colors.black,
      icon: _buildImageIcon(_selectedIndex == index ? selectedIcon : defaultIcon),
      label: label,
      tooltip: label,
    );
  }

  Widget _buildImageIcon(String path) {
    return Image.asset(
      path,
      width: 60,
      height: 60,
    );
  }
}