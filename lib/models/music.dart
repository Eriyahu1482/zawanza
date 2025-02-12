class Music{
  String  musicUrl;
  String musicName;
  String musicListeners;
  String musicArtist;
  
  Music ({this.musicUrl = '', required this.musicName,  this.musicListeners = '120 Аудиозаписей', this.musicArtist = '' });
}

final List<Music> musicData = [
Music(musicUrl: 'assets/cardimages/MarylandMuscleMachine.png', musicName: 'Maryland Muscle Machine', musicListeners: '2 тыс. прослушиваний', musicArtist: 'NElknww'),
Music(musicUrl: 'assets/cardimages/BrazilianPhonk.png', musicName: 'Brazilian Phonk', musicListeners: '10 тыс. прослушиваний',  musicArtist: 'name'),
];

final List<Music> musicNewData = [
Music(musicUrl: 'assets/cardimages/FUNKDOVINHETA.png', musicName: 'FUNKDOVINHETA', musicListeners: '2 тыс. прослушиваний'),
Music(musicUrl: 'assets/cardimages/Bolada.png', musicName: 'Bolada', musicListeners: '10 тыс. прослушиваний'),
];

final List<Music> musicAllData = [
Music(musicUrl: 'assets/cardimages/MarylandMuscleMachine.png', musicName: 'Maryland Muscle Machine', musicListeners: '2 тыс. прослушиваний', musicArtist: 'SXMNR'),
Music(musicUrl: 'assets/cardimages/BrazilianPhonk.png', musicName: 'Brazilian Phonk', musicListeners: '10 тыс. прослушиваний',  musicArtist: 'MOONDEITY'),
Music(musicUrl: 'assets/cardimages/FUNKDOVINHETA.png', musicName: 'FUNKDOVINHETA', musicListeners: '2 тыс. прослушиваний', musicArtist: 'Kordhell'),
Music(musicUrl: 'assets/cardimages/Bolada.png', musicName: 'Bolada', musicListeners: '10 тыс. прослушиваний', musicArtist: 'Scriptyz,'),
Music(musicUrl: 'assets/cardimages/djtuta.png', musicName: 'Dj Tuta 061', musicListeners: '15.1 тыс. слушателей'),
Music(musicUrl: 'assets/cardimages/swere.png', musicName: 'SWERVE', musicListeners: '233.8 тыс. прослушиваний'),
];

final List<Music> musicPopularData = [
Music(musicUrl: 'assets/cardimages/djtuta.png', musicName: 'Dj Tuta 061', musicListeners: '15.1 тыс. слушателей'),
Music(musicUrl: 'assets/cardimages/swere.png', musicName: 'SWERVE', musicListeners: '233.8 тыс. прослушиваний'),
];

final List<Music> musicTracks1 = [
Music(musicUrl: 'assets/cardimages/FUNKDOVINHETA.png', musicName: 'FUNKDOVINHETA', musicListeners: '2 тыс. прослушиваний'),
Music(musicUrl: 'assets/cardimages/Bolada.png', musicName: 'Bolada', musicListeners: '10 тыс. прослушиваний'),
];
