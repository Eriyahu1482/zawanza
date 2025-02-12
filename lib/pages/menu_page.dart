import 'package:flutter/material.dart';
import 'package:zawanza1/models/music.dart';
import 'package:zawanza1/pages/detail_music_page.dart';
import 'package:zawanza1/pages/media_page.dart';
import 'package:zawanza1/pages/profile_page.dart';
import 'package:zawanza1/pages/search_page.dart';
import 'package:zawanza1/widgets/music_card_widget.dart';

class MenuPage extends StatefulWidget {
  static const routeName = '/menu-page';
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return; // Не делаем ничего, если нажата текущая иконка

    setState(() {
      _selectedIndex = index;
    });

    // Навигация к соответствующим страницам
    switch (index) {
      case 0:
        break;
      case 1:
        Navigator.pushReplacementNamed(context, MediaPage.routeName);
        break;
      case 2:
        Navigator.pushReplacementNamed(context, SearchPage.routeName);
        break;
      case 3:
        Navigator.pushReplacementNamed(context, ProfilePage.routeName);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Center(child: Image.asset('assets/logo.png')),
              const SizedBox(height: 40),
              const Text(
                'Подобрано для вас',
                style: TextStyle(
                  color: Color.fromRGBO(225, 244, 255, 0.8),
                  fontSize: 26,
                   shadows: [
                    Shadow( 
                      blurRadius: 25, 
                      color: Color.fromRGBO(27,99,233, 1), 
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  SizedBox(
                  child: Transform.rotate(
                    angle: 3.14159,
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white.withOpacity(0.5),
                      size: 15,
                    ),
                  ),
                ),
                  SizedBox(
                    width: 350,
                    height: 300,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var music = musicData[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    DetailMusicPage(music: music)));
                          },
                          child: MusicCardWidget(music: musicData[index]),
                        );
                      },
                      separatorBuilder: (_, index) => const SizedBox(width: 8),
                      itemCount: musicData.length,
                    ),
                  ),
                  SizedBox(
                  child: Icon(
                      Icons.play_arrow,
                      color: Colors.white.withOpacity(0.5),
                      size: 15,
                  ),
                ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                'Новинки',
                style: TextStyle(
                  color: Color.fromRGBO(225, 244, 255, 0.8),
                  fontSize: 26,
                   shadows: [
                    Shadow( 
                      blurRadius: 25, 
                      color: Color.fromRGBO(27,99,233, 1), 
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  SizedBox(
                  child: Transform.rotate(
                    angle: 3.14159,
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white.withOpacity(0.5),
                      size: 15,
                    ),
                  ),
                ),
                  SizedBox(
                    width: 350,
                    height: 330,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var music = musicNewData[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    DetailMusicPage(music: music)));
                            
                          },
                          child: MusicCardWidget(music: musicNewData[index]),
                        );
                      },
                      separatorBuilder: (_, index) => const SizedBox(width: 8),
                      itemCount: musicNewData.length,
                    ),
                  ),
                  SizedBox(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white.withOpacity(0.5),
                      size: 15,
                  ),
                ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'Популярные исполнители',
                style: TextStyle(
                  color: Color.fromRGBO(225, 244, 255, 0.8),
                  fontSize: 26,
                   shadows: [
                    Shadow( 
                      blurRadius: 25, 
                      color: Color.fromRGBO(27,99,233, 1), 
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  SizedBox(
                  child: Transform.rotate(
                    angle: 3.14159,
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white.withOpacity(0.5),
                      size: 15,
                    ),
                  ),
                ),
                  SizedBox(
                    width: 350,
                    height: 330,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var music = musicPopularData[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    DetailMusicPage(music: music)));
                            
                          },
                          child: MusicCardWidget(music: musicPopularData[index]),
                        );
                      },
                      separatorBuilder: (_, index) => const SizedBox(width: 8),
                      itemCount: musicPopularData.length,
                    ),
                  ),
                  SizedBox(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white.withOpacity(0.5),
                      size: 15,
                  ),
                ),
                ],
              ),
            ],
          ),
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
