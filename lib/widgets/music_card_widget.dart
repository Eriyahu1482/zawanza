import 'package:flutter/material.dart';
import 'package:zawanza1/models/music.dart';  // Импортируем модель Music

class MusicCardWidget extends StatelessWidget {
  final Music music;  // Объект Music, который содержит информацию о треке и альбоме

  const MusicCardWidget({super.key, required this.music});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        width: 250,
        height: 300,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
            image: AssetImage(music.musicUrl),  // Используем musicUrl для изображения
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Color.fromRGBO(0, 0, 0, 0.8),
          child: Stack(
            children: [
              Center(
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white.withOpacity(0.3),
                  ),
                  child: Icon(Icons.play_arrow, color: Colors.white.withOpacity(0.7), size: 35),
                ),
              ),
              Positioned(
                bottom: 230,
                left: 10,
                child: Text(
                  music.musicName,  // Название трека
                  style: const TextStyle(
                    color: Color.fromRGBO(225, 244, 255, 0.8),
                    fontSize: 20,
                  ),
                ),
              ),
              Positioned(
                top: 270,
                left: 10,
                child: Text(
                  music.musicListeners,  // Количество слушателей
                  style: const TextStyle(
                    color: Color.fromRGBO(225, 244, 255, 0.5),
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
