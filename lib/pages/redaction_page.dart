import 'package:flutter/material.dart';
import 'package:zawanza1/pages/media_page.dart';
import 'package:zawanza1/pages/menu_page.dart';
import 'package:zawanza1/pages/profile_page.dart';
import 'package:zawanza1/widgets/main_button_widget.dart';
import 'package:zawanza1/widgets/text_field_widget.dart';

class RedactionPage extends StatefulWidget {
  static const routeName = '/redact-page';
  const RedactionPage({super.key});

  @override
  State<RedactionPage> createState() => _RedactionPageState();
}

class _RedactionPageState extends State<RedactionPage> {
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _nicknameController1 = TextEditingController();
  final TextEditingController _nicknameController2 = TextEditingController();
  final TextEditingController _nicknameController3 = TextEditingController();
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
            const SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: Text(
                'Редактировать профиль',
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
            const SizedBox(height: 30),
                Image.asset('assets/3photo.png'),
            const SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.only(right: 30, left: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          width: 220,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color.fromRGBO(0, 20, 56, 1),
                          ),
                          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                            Text(
                              'Изменить фото профиля',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  shadows: [
                    Shadow(
                      blurRadius: 25, 
                      color: Color.fromRGBO(27,99,233, 1), 
                    ),
                  ],
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Image.asset('assets/pen.png')
                          ]
                          ),
                        ),
                      ),
                      const SizedBox(height: 15,),
                      TextFieldWidget(controller: _nicknameController, hintText: 'Никнейм'),
                      const SizedBox(height: 15,),
                      TextFieldWidget(controller: _nicknameController1, hintText: 'Телефон'),
                      const SizedBox(height: 15,),
                      TextFieldWidget(controller: _nicknameController2, hintText: 'E-mail'),
                      const SizedBox(height: 15,),
                      TextFieldWidget(controller: _nicknameController3, hintText: 'Любимый жанр'),
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