import 'package:flutter/material.dart';
import 'package:zawanza1/models/music.dart';

class MusicProvider with ChangeNotifier {
  final List<Music> _listenedModel = [Music(musicUrl: '', musicName:'', musicListeners: '',),];
  final List<Music> _listenedTracks = [Music(musicUrl: '', musicName:'',),];

  List<Music> get listenedModel => _listenedModel;

  void addAlboum(Music music) {
    if (!_listenedModel.contains(music)) {
      _listenedModel.add(music);
      notifyListeners();
    }
  }
    void removeAlboum(Music music) {
    _listenedModel.remove(music);
    notifyListeners(); 
  }

    void addTrack(Music music) {
    if (!_listenedTracks.contains(music)) {
      _listenedTracks.add(music);
      notifyListeners();
    }
  }
    void removeTrack(Music music) {
    _listenedTracks.remove(music);
    notifyListeners(); 
  }
}