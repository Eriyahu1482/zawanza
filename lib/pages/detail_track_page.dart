import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:zawanza1/pages/media_page.dart';
import 'package:zawanza1/pages/menu_page.dart';
import 'package:zawanza1/pages/profile_page.dart';

class DetailTrackPage extends StatefulWidget {
  static const routeName = '/track-page';
  const DetailTrackPage({super.key});

  @override
  State<DetailTrackPage> createState() => _DetailTrackPageState();
}

class _DetailTrackPageState extends State<DetailTrackPage> {
  int _selectedIndex = 0;

  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();

    // Подписываемся на изменения состояния проигрывателя
    _audioPlayer.playerStateStream.listen((state) {
      setState(() {
        _isPlaying = state.playing;
      });
    });

    // Подписываемся на изменение длительности трека
    _audioPlayer.durationStream.listen((newDuration) {
      setState(() {
        _duration = newDuration ?? Duration.zero;
      });
    });

    // Подписываемся на изменение текущей позиции трека
    _audioPlayer.positionStream.listen((newPosition) {
      setState(() {
        _position = newPosition;
      });
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

  Future<void> _togglePlayPause() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play();
    }
  }

  Future<void> _seekTo(Duration position) async {
    await _audioPlayer.seek(position);
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  Future<void> _loadTrack(String assetPath) async {
    try {
      await _audioPlayer.setAsset(assetPath); // Загружаем локальный файл
    } catch (e) {
      print('Ошибка загрузки аудиофайла: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 320,
            height: 320,
            child: Image.asset('assets/cardimages/RISADA DO SENHOR.png'),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              children: [
                Text(
                  'RISADA DO SENHOR',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25  ,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'DJ ESXF',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),


          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              children: [
                SizedBox(
                    width: 350,
                    child: SliderTheme(
  data: SliderTheme.of(context).copyWith(
    thumbShape: SquareThumbShape(thumbSize: 20), // Квадратный маркер размером 20x20
  ),
  child: Slider(
    min: 0,
    max: _duration.inSeconds.toDouble(),
    value: _position.inSeconds.toDouble(),
    activeColor: Color.fromRGBO(189, 230, 255, 1), // Светло-голубой цвет заполненной части
    inactiveColor: Color.fromRGBO(189, 230, 255, 0.5), // Полупрозрачный светло-голубой для незаполненной части
    onChanged: (value) {
      final position = Duration(seconds: value.toInt());
      _seekTo(position);
    },
  ),
)
                    ),
                Row(
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      '${_formatDuration(_position)}',
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    SizedBox(
                      width: 230,
                    ),
                    Text(
                      ' ${_formatDuration(_duration)}',
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 35,
                height: 35,
                child: Image.asset('assets/shuffle.png', fit: BoxFit.cover,),
              ),
              IconButton(
                onPressed: null,
                icon: const Icon(
                  Icons.skip_previous,
                  color: Colors.white,
                  size: 50,
                ),
              ),
              IconButton(
                onPressed: _togglePlayPause,
                icon: Icon(
                  _isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                  size: 60,
                ),
              ),
              IconButton(
                onPressed: null,
                icon: const Icon(
                  size: 50,
                  Icons.skip_next,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: null,
                icon: const Icon(
                  Icons.repeat,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ],
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
        selectedItemColor: const Color.fromRGBO(225, 244, 255, 0.8),
        unselectedItemColor: const Color.fromRGBO(225, 244, 255, 0.6),
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

class SquareThumbShape extends SliderComponentShape {
  final double thumbSize;

  SquareThumbShape({required this.thumbSize});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(thumbSize, thumbSize); // Устанавливаем размер квадрата
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    // Рисуем квадрат
    final rect = Rect.fromCenter(center: center, width: thumbSize, height: thumbSize);
    final paint = Paint()..color = Colors.white; // Цвет квадрата
    canvas.drawRect(rect, paint);
  }
}