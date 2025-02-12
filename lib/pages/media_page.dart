import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zawanza1/models/music.dart';
import 'package:zawanza1/pages/menu_page.dart';
import 'package:zawanza1/pages/profile_page.dart';
import 'package:zawanza1/pages/search_page.dart';
import 'package:zawanza1/services/music_provider.dart';
import 'package:zawanza1/widgets/added_card_widget.dart';
import 'package:zawanza1/widgets/long_card_widget.dart';

class MediaPage extends StatefulWidget {
  static const routeName = '/media-page';
  const MediaPage({super.key});

  @override
  State<MediaPage> createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage> {
  int _selectedIndex = 1;

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
    final listenedModel = Provider.of<MusicProvider>(context).listenedModel;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 50),
              child: Text(
                'Мои плейлисты',
                style: TextStyle(
                  color: const Color.fromRGBO(225, 244, 255, 0.8),
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
            SizedBox(
              height: 500,
              child: GridView.builder(
                  padding: const EdgeInsets.only(right: 20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: listenedModel.length - 1,
                  itemBuilder: (context, index) {
                    Music music = listenedModel[index + 1];

                    return Dismissible(
                      key: Key(music.musicName),
                      direction: DismissDirection.endToStart,
                      background: Container(color: Colors.red),
                      onDismissed: (direction) {
                        Provider.of<MusicProvider>(context, listen: false)
                            .removeAlboum(music);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("${music.musicName} удалён")),
                        );
                      },
                      child: AddedCardWidget(music: musicAllData[index]),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 50),
              child: Text(
                'Мои треки',
                style: TextStyle(
                  color: const Color.fromRGBO(225, 244, 255, 0.8),
                  fontSize: 26,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 600,
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  SizedBox(height: 10,),
                  LongCardWidget(
                    trackName: 'RISADA DO SENHOR',
                    trackUrl: 'assets/cardimages/RISADA DO SENHOR.png',
                    trackArtist: 'DJ ESXF',
                  ),
                  SizedBox(height: 10,),
                  LongCardWidget(
                    trackName: 'SLIDE DO LOUCURA',
                    trackUrl: 'assets/cardimages/SLIDE DO LOUCURA.png',
                    trackArtist: 'SXMNR',
                  ),
                  SizedBox(height: 10,),
                  LongCardWidget(
                    trackName: 'SLIDE EXÓTICA 1.0',
                    trackUrl: 'assets/cardimages/SLIDE EXÓTICA 1.0.png',
                    trackArtist: 'nightfxrce, dvspair',
                  ),
                  SizedBox(height: 10,),
                  LongCardWidget(
                    trackName: 'KRUSHWORLD',
                    trackUrl: 'assets/cardimages/KRUSHWORLD.png',
                    trackArtist: 'SXMNR',
                  ),
                  SizedBox(height: 10,),
                  LongCardWidget(
                    trackName: 'PUTA',
                    trackUrl: 'assets/cardimages/PUTA.png',
                    trackArtist: 'SXMNR',
                  ),
                  SizedBox(height: 10,),
                  LongCardWidget(
                    trackName: 'JO JO FUNK',
                    trackUrl: 'assets/cardimages/JO JO FUNK.png',
                    trackArtist: 'SXMNR',
                  ),
                  SizedBox(height: 10,),
                  LongCardWidget(
                    trackName: 'BALANÇO DO FUNK',
                    trackUrl: 'assets/cardimages/BALANÇO DO FUNK.png',
                    trackArtist: 'SXMNR',
                  ),
                ],
              )),
            ),
          ],
        ),
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
