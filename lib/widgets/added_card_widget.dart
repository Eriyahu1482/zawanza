import 'package:flutter/material.dart';
import 'package:zawanza1/models/music.dart';

class AddedCardWidget extends StatelessWidget {
  final Music music;

  const AddedCardWidget({
    super.key,
    required this.music,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 270, left: 5),
              width: 150,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                image: DecorationImage(
                  image: AssetImage(music.musicUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.zero,
                    width: 110,
                    child: Text(music.musicName,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}