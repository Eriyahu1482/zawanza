import 'package:flutter/material.dart';
import 'package:zawanza1/pages/media_page.dart';
import 'package:zawanza1/pages/menu_page.dart';
import 'package:zawanza1/pages/profile_page.dart';
import 'package:zawanza1/widgets/main_button_widget.dart';

class KonfidentionalPage extends StatefulWidget {
  static const routeName = '/konf-page';
  const KonfidentionalPage({super.key});

  @override
  State<KonfidentionalPage> createState() => _KonfidentionalPageState();
}

class _KonfidentionalPageState extends State<KonfidentionalPage> {
  int _selectedIndex = 3;
  String _selectedValue1 = 'Все';
  String _selectedValue2 = 'Только я';

  bool _isMenuOpen1 = false;
  bool _isMenuOpen2 = false;

  final List<String> _menuItems = ['Все', 'Только я'];

  // Контролируемые позиции кнопок и меню
  final GlobalKey _menuKey1 = GlobalKey();
  final GlobalKey _menuKey2 = GlobalKey();

  void _toggleMenu1() {
    setState(() {
      _isMenuOpen1 = !_isMenuOpen1;
    });
  }

  void _toggleMenu2() {
    setState(() {
      _isMenuOpen2 = !_isMenuOpen2;
    });
  }

  void _onItemSelected1(String value) {
    setState(() {
      _selectedValue1 = value;
      _isMenuOpen1 = false;
    });
  }

  void _onItemSelected2(String value) {
    setState(() {
      _selectedValue2 = value;
      _isMenuOpen2 = false;
    });
  }

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
                  key: _menuKey1, // Ключ для первого меню
                  onTap: _toggleMenu1, // Открытие первого выпадающего меню
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Кто может видеть мой профиль',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromRGBO(255, 244, 255, 1),
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 10,),
                      ElevatedButton(
                        onPressed: _toggleMenu1,
                        child: Row(
                          children: [
                            Text(_selectedValue1),
                            Icon(
                              _isMenuOpen1 ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.transparent,
                          side: BorderSide(color: Colors.transparent, width: 2),
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        ),
                      ),
                    ],
                  ),
                ),
                if (_isMenuOpen1)
                  _buildMenu(_menuKey1, _menuItems, _onItemSelected1),
                const SizedBox(height: 20),
                GestureDetector(
                  key: _menuKey2, // Ключ для второго меню
                  onTap: _toggleMenu2, // Открытие второго выпадающего меню
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Кто может видеть мои плейлисты',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromRGBO(255, 244, 255, 1),
                          fontSize: 16,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _toggleMenu2,
                        child: Row(
                          children: [
                            Text(_selectedValue2),
                            Icon(
                              _isMenuOpen2 ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.transparent,
                          side: BorderSide(color: Colors.transparent, width: 2),
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        ),
                      ),
                    ],
                  ),
                ),
                if (_isMenuOpen2)
                  _buildMenu(_menuKey2, _menuItems, _onItemSelected2),
                const SizedBox(height: 20),
              ],
            ),
          ),
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

  // Метод для построения меню
  Widget _buildMenu(GlobalKey menuKey, List<String> items, Function(String) onItemSelected) {
    final RenderBox renderBox = menuKey.currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);

    return Padding(
      padding: const EdgeInsets.only(left: 250),
      child: Positioned(
        top: position.dy + renderBox.size.height + 5, // Сдвигаем вниз от кнопки
        left: position.dx,
        child: Material(
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 20, 56, 1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: items.map((item) {
                return GestureDetector(
                  onTap: () => onItemSelected(item),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Text(
                      item,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
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
