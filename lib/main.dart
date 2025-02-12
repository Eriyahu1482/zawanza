import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zawanza1/my_app.dart';
import 'package:zawanza1/services/music_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MusicProvider(),
      child: const MyApp(),
    ),
  );
}