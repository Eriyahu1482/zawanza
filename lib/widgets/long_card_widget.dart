import 'package:flutter/material.dart';
import 'package:zawanza1/widgets/mini_add_button_widget.dart';

class LongCardWidget extends StatelessWidget {
  final String trackUrl;
  final String trackName;
  final String trackArtist;
  
  const LongCardWidget({
    super.key, required this.trackUrl, required this.trackName, required this.trackArtist,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 2,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.zero,
                width: 100,
                height: 70,
                child: Image.asset(trackUrl, fit: BoxFit.contain,)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                  ),
                  child: Text(trackName,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                ),
                const SizedBox(height: 5,),
               Text(trackArtist, style: TextStyle(color: Colors.white.withOpacity(0.5)),)
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 14),
              child: MiniAddButtonWidget(onTap: (){}),
            ),
          ],
        ),
      ),
    );
  }
}