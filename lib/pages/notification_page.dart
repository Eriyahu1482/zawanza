import 'package:flutter/material.dart';
import 'package:zawanza1/pages/media_page.dart';
import 'package:zawanza1/pages/menu_page.dart';
import 'package:zawanza1/pages/profile_page.dart';
import 'package:zawanza1/widgets/main_button_widget.dart';

class NotificationPage extends StatefulWidget {
  static const routeName = '/notify-page';
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CheckboxField(),
    );
  }
}

class CheckboxField extends StatefulWidget {
  @override
  _CheckboxFieldState createState() => _CheckboxFieldState();
}

class _CheckboxFieldState extends State<CheckboxField> {
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
  bool _isChecked = false;
  bool _isChecked1 = false;
  bool _isChecked2 = false;

  void _toggleCheckbox(bool? value) {
    setState(() {
      _isChecked = value ?? false;
    });
  }

  void _toggleCheckbox1(bool? value) {
    setState(() {
      _isChecked1 = value ?? false;
    });
  }

  void _toggleCheckbox2(bool? value) {
    setState(() {
      _isChecked2 = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Center(
            child: Image.asset('assets/logo.png'),
          ),
          const SizedBox(height: 200),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              'Настройка уведомлений',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(255, 244, 255, 1),
                fontSize: 25,
                shadows: [
                  Shadow(
                    blurRadius: 25,
                    color: Color.fromRGBO(27, 99, 233, 1),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Column(
              children: [
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    _toggleCheckbox(!_isChecked);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Уведомлять об обновлениях',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromRGBO(255, 244, 255, 1),
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(width: 50),
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white, 
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5), 
                        ),
                        child: Checkbox(
                          value: _isChecked,
                          onChanged: _toggleCheckbox,
                          activeColor: Colors.transparent, 
                          checkColor: Colors.white, 
                          shape: RoundedRectangleBorder( 
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    _toggleCheckbox1(!_isChecked1);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Присылать новостную рассылку',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromRGBO(255, 244, 255, 1),
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white, 
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5), 
                        ),
                        child: Checkbox(
                          value: _isChecked1,
                          onChanged: _toggleCheckbox1,
                          activeColor: Colors.transparent, 
                          checkColor: Colors.white, 
                          shape: RoundedRectangleBorder( 
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    _toggleCheckbox2(!_isChecked2);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Уведомлять о новых треках',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          const Text(
                            'ваших любимых исполнителей',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                      const SizedBox(width: 30),
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white, 
                            width: 2, 
                          ),
                          borderRadius: BorderRadius.circular(5), 
                        ),
                        child: Checkbox(
                          value: _isChecked2,
                          onChanged: _toggleCheckbox2,
                          activeColor: Colors.transparent, 
                          checkColor: Colors.white, 
                          shape: RoundedRectangleBorder( 
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: MainButtonWidget(
              buttonWight: 220,
              buttonName: 'Сохранить изменения',
              buttonColor: Color.fromRGBO(0, 20, 56, 1),
              buttonTextColor: Colors.white,
              onTap: () {
                Navigator.pushReplacementNamed(context, ProfilePage.routeName);
              },
              buttonHeight: 50
            ),
          ),
        ],),
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
