import 'package:dartz/dartz.dart';
import 'package:songify/data/sources/songs/song_firebase_service.dart';
import 'package:songify/domain/repository/song/song.dart';



class SongRepositoryImpl extends SongsRepository {
  final SongFirebaseService service;

  SongRepositoryImpl(this.service);

  @override
  Future<Either> getNewSongs() async {
    return await service.getNewsSongs();
  }
}