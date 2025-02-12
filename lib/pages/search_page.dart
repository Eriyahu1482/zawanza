import 'package:flutter/material.dart';
import 'package:zawanza1/models/music.dart'; // Импортируем модель Music
import 'package:zawanza1/pages/detail_music_page.dart';
import 'package:zawanza1/pages/menu_page.dart';
import 'package:zawanza1/pages/media_page.dart';
import 'package:zawanza1/pages/profile_page.dart';

class SearchPage extends StatefulWidget {
  static const routeName = '/search-page';
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _selectedIndex = 2;

  // Список музыки
  List<Music> _allMusic = musicAllData; // Заменим на список музыки
  List<Music> _filteredMusic = [];

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredMusic = _allMusic; // Изначально показываем все песни
    _searchController.addListener(_filterMusic);
  }

  // Функция фильтрации музыки по названию или исполнителю
  void _filterMusic() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredMusic = _allMusic
          .where((music) =>
              music.musicName.toLowerCase().contains(query) ||
              music.musicArtist.toLowerCase().contains(query))
          .toList();
    });
  }

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;

    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, MenuPage.routeName);
        break;
      case 1:
        Navigator.pushReplacementNamed(context, MediaPage.routeName);
        break;
      case 2:
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: const Text(
              'Поиск',
              style: TextStyle(
                color: Color.fromRGBO(225, 244, 255, 1),
                fontSize: 26,
                shadows: [
                  Shadow(
                    blurRadius: 25,
                    color: Color.fromRGBO(27, 99, 233, 1),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Введите, что хотите слушать',
                hintStyle: TextStyle(color: Color.fromRGBO(7, 39, 99, 0.8)),
                prefixIcon:
                    Icon(Icons.search, color: Color.fromRGBO(7, 39, 99, 0.8)),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                      color: Color.fromRGBO(7, 39, 99, 0.8), width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: Color.fromRGBO(7, 39, 99, 0.8), width: 1),
                ),
              ),
              style: TextStyle(color: Color.fromRGBO(7, 39, 99, 0.8)),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredMusic.length,
              itemBuilder: (context, index) {
                final music = _filteredMusic[index];
                return ListTile(
                  title: Text(music.musicName,
                      style: TextStyle(color: Colors.white)),
                  subtitle: Text(
                    'Исполнитель: ${music.musicArtist}',
                    style: TextStyle(color: Colors.white.withOpacity(0.7)),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailMusicPage(music: music)));
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 8,
        items: [
          _buildBottomNavigationBarItem(
              0, 'assets/home.png', 'assets/homealt.png', 'Главная'),
          _buildBottomNavigationBarItem(1, 'assets/mediateka.png',
              'assets/mediatekaalt.png', 'Моя медиатека'),
          _buildBottomNavigationBarItem(
              2, 'assets/search.png', 'assets/searchalt.png', 'Поиск'),
          _buildBottomNavigationBarItem(
              3, 'assets/profile.png', 'assets/profilealt.png', 'Мой профиль'),
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

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      int index, String defaultIcon, String selectedIcon, String label) {
    return BottomNavigationBarItem(
      backgroundColor: Colors.black,
      icon:
          _buildImageIcon(_selectedIndex == index ? selectedIcon : defaultIcon),
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
