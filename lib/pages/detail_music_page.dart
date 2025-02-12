import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:zawanza1/models/music.dart';
import 'package:zawanza1/pages/detail_track_page.dart';
import 'package:zawanza1/pages/media_page.dart';
import 'package:zawanza1/pages/profile_page.dart';
import 'package:zawanza1/pages/search_page.dart';
import 'package:zawanza1/services/music_provider.dart';
import 'package:zawanza1/widgets/add_button_widget.dart';
import 'package:zawanza1/widgets/long_card_widget.dart';

class DetailMusicPage extends StatefulWidget {
  final Music music;
  const DetailMusicPage({super.key, required this.music});

  @override
  State<DetailMusicPage> createState() => _DetailMusicPageState();
}

class _DetailMusicPageState extends State<DetailMusicPage> {
  int _selectedIndex = 0;

  // Проигрыватель
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();

    // Подписываемся на изменения состояния проигрывателя
    _audioPlayer.playerStateStream.listen((state) async {
      await _updateIsPlaying(state.playing);
    });

    // Подписываемся на изменение длительности трека
    _audioPlayer.durationStream.listen((newDuration) async {
      await _updateDuration(newDuration ?? Duration.zero);
    });

    // Подписываемся на изменение текущей позиции трека
    _audioPlayer.positionStream.listen((newPosition) async {
      await _updatePosition(newPosition);
    });

    // Загружаем трек при старте страницы
    _loadTrack('assets/sad.mp3');
  }

  @override
  void dispose() {
    _audioPlayer.dispose(); // Очищаем ресурсы при закрытии страницы
    super.dispose();
  }

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return;

    setState(() {
      _selectedIndex = index;
    });

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

  Future<void> _togglePlayPause() async {
    if (_isPlaying) {
      await _pausePlayback();
    } else {
      await _resumePlayback();
    }
  }

  Future<void> _pausePlayback() async {
    await _audioPlayer.pause();
    await _updateIsPlaying(false);
  }

  Future<void> _resumePlayback() async {
    await _audioPlayer.play();
    await _updateIsPlaying(true);
  }

  Future<void> _seekTo(Duration position) async {
    await _audioPlayer.seek(position);
    await _updatePosition(position);
  }

  Future<void> _updateIsPlaying(bool isPlaying) async {
    setState(() {
      _isPlaying = isPlaying;
    });
  }

  Future<void> _updateDuration(Duration duration) async {
    setState(() {
    });
  }

  Future<void> _updatePosition(Duration position) async {
    setState(() {
      _position = position;
    });
  }

  Future<void> _loadTrack(String assetPath) async {
    try {
      await _audioPlayer.setAsset(assetPath); // Загружаем локальный файл
    } catch (e) {
      print('Ошибка загрузки аудиофайла: $e');
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 1),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 80, left: 30),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 200,
                          height: 200,
                          child: Image.asset(
                            widget.music.musicUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.music.musicName,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color.fromRGBO(255, 244, 255, 1),
                                fontSize: 12,
                                shadows: [
                                  Shadow(
                                    blurRadius: 25,
                                    color: Color.fromRGBO(27, 99, 233, 1),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              widget.music.musicArtist,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color.fromRGBO(255, 244, 255, 0.5),
                                fontSize: 12,
                                shadows: [
                                  Shadow(
                                    blurRadius: 25,
                                    color: Color.fromRGBO(27, 99, 233, 1),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 25),
                            Text(
                              widget.music.musicListeners,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color.fromRGBO(255, 244, 255, 0.5),
                                fontSize: 12,
                                shadows: [
                                  Shadow(
                                    blurRadius: 25,
                                    color: Color.fromRGBO(27, 99, 233, 1),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 35),
                            AddButtonWidget(
                              buttonName: 'Добавить',
                              buttonColor: Colors.transparent,
                              buttonTextColor:
                                  Color.fromRGBO(255, 255, 255, 0.5),
                              onTap: () {
                                final mangaProvider =
                                    Provider.of<MusicProvider>(context,
                                        listen: false);
                                mangaProvider.addAlboum(widget.music);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          '${widget.music.musicName} добавлена в просмотренное')),
                                );
                              },
                              icon: Icons.add,
                            ),
                            AddButtonWidget(
                              buttonName: 'Поделиться',
                              buttonColor: Colors.transparent,
                              buttonTextColor:
                                  Color.fromRGBO(255, 255, 255, 0.5),
                              onTap: () {},
                              icon: Icons.send,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  LongCardWidget(
                    trackUrl: widget.music.musicUrl,
                    trackArtist: widget.music.musicArtist,
                    trackName: 'SLIDE DO LOUCURA',
                  ),
                  LongCardWidget(
                    trackUrl: widget.music.musicUrl,
                    trackArtist: widget.music.musicArtist,
                    trackName: 'SLIDE DO LOUCURA (SLOWED)',
                  ),
                  LongCardWidget(
                    trackUrl: widget.music.musicUrl,
                    trackArtist: widget.music.musicArtist,
                    trackName: 'SLIDE DO LOUCURA (SPEED UP)',
                  ),
                  LongCardWidget(
                    trackUrl: widget.music.musicUrl,
                    trackArtist: widget.music.musicArtist,
                    trackName: 'SLIDE DO LOUCURA (SUPER SL...)',
                  ),
                ],
              ),
            ),
          ),

          // Проигрыватель над BottomNavigationBar
          Container(
            color: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: GestureDetector(
              onTap: () {
        Navigator.pushReplacementNamed(context, DetailTrackPage.routeName);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 50,
                      height: 50,
                      child:
                          Image.asset('assets/cardimages/RISADA DO SENHOR.png')),
                  Column(
                    children: [
                      SizedBox(
                        width: 125,
                        height: 20,
                        child: Text(
                          'RISADA DO SENHOR',
                          style: TextStyle(
                            color: Color.fromRGBO(255, 244, 255, 1),
                            fontSize: 14,
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
                        width: 100,
                        height: 20,
                        child: Text(
                          'DJ ESXF',
                          style: TextStyle(
                            color: Color.fromRGBO(255, 244, 255, 0.5),
                            fontSize: 14,
                            shadows: [
                              Shadow(
                                blurRadius: 25,
                                color: Color.fromRGBO(27, 99, 233, 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: null, // Нет функциональности
                    icon: Icon(
                      Icons.skip_previous,
                      color: Colors.white,
                    ),
                  ),
              
                  // Кнопка Play/Pause
                  IconButton(
                    onPressed: _togglePlayPause,
                    icon: Icon(
                      _isPlaying ? Icons.pause : Icons.play_arrow,
                      color: Colors.white,
                    ),
                  ),
              
                  // Кнопка Next Track (заглушка)
                  IconButton(
                    onPressed: null, // Нет функциональности
                    icon: Icon(
                      Icons.skip_next,
                      color: Colors.white,
                    ),
                  ),
              
                  // Текущее время трека
                  Text(
                    '${_formatDuration(_position)}',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // BottomNavigationBar
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
