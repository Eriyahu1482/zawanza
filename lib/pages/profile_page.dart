import 'package:flutter/material.dart';
import 'package:zawanza1/pages/change_password_page.dart';
import 'package:zawanza1/pages/konfidentional_page.dart';
import 'package:zawanza1/pages/login_page.dart';
import 'package:zawanza1/pages/media_page.dart';
import 'package:zawanza1/pages/menu_page.dart';
import 'package:zawanza1/pages/notification_page.dart';
import 'package:zawanza1/pages/redaction_page.dart';
import 'package:zawanza1/widgets/transparent_button_widget.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = '/profile-page';
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
      body: Column(
        children: [
          const SizedBox(height: 50),
          Center(
            child: Image.asset('assets/logo.png'),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 300,
            child: Text(
              'Мой профиль',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(255, 244, 255, 1),
                fontSize: 25,
                 shadows: [
                  Shadow(
                    blurRadius: 25, 
                    color: Color.fromRGBO(27,99,233, 1), 
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            children: [
          const SizedBox(width: 40),
              Image.asset('assets/daniil.png'),
          const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                  'wanderer162',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(255, 244, 255, 1),
                    fontSize: 18,
                  ),
                              ),
                  const SizedBox(height: 10,),
                  const Text(
                  '+7(999)999-99-99',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(255, 244, 255, 1),
                    fontSize: 14,
                  ),
                              ),
                              const Text(
                  'wanderer162@gmail.com',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(255, 244, 255, 1),
                    fontSize: 14,
                  ),
                              ),
                              const Text(
                  'Любимый жанр: Brazilian Phonk',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(255, 244, 255, 1),
                    fontSize: 14,
                  ),
                              ),
                ],
              ),
            ],
            ),
          const SizedBox(height: 30),
          TransparentButtonWidget(buttonName: 'Редактировать профиль', onTap: (){Navigator.pushReplacementNamed(context, RedactionPage.routeName);}, buttonColor: Color.fromRGBO(255, 244, 255, 1),),
          TransparentButtonWidget(buttonName: 'Сменить пароль', onTap: (){Navigator.pushReplacementNamed(context, ChangePasswordPage.routeName);}, buttonColor: Color.fromRGBO(255, 244, 255, 1),),
          TransparentButtonWidget(buttonName: 'Настройка уведомлений', onTap: (){Navigator.pushReplacementNamed(context, NotificationPage.routeName);}, buttonColor: Color.fromRGBO(255, 244, 255, 1),),
          TransparentButtonWidget(buttonName: 'Конфиденциальность', onTap: (){Navigator.pushReplacementNamed(context, KonfidentionalPage.routeName);}, buttonColor: Color.fromRGBO(255, 244, 255, 1),),
          TransparentButtonWidget(buttonName: 'Выйти из аккаунта', onTap: (){Navigator.pushReplacementNamed(context, LoginPage.routeName);}, buttonColor: Color.fromRGBO(67, 130, 246, 1),)
        ],
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
      ),
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
