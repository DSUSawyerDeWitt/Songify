import 'package:dartz/dartz.dart';
import 'package:songify/data/sources/songs/song_firebase_service.dart';
import 'package:songify/domain/repository/song/song.dart';

import '../../../service_locator.dart';

class SongRepositoryImpl extends SongsRepository{
  @override
  Future<Either> getNewSongs() async {
    return await sl<SongFirebaseService>().getNewsSongs();
  }
  
}