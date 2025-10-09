import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:songify/data/models/song/song_model.dart';
import 'package:songify/domain/entities/song/song_entity.dart';

abstract class SongFirebaseService{

  Future<Either> getNewsSongs();
  Future<Either> getPlayList();
}


class SongFirebaseServiceImpl extends SongFirebaseService {
  @override
  Future<Either> getNewsSongs() async {
    try {
      var data = await FirebaseFirestore.instance.collection('Songs')
      .orderBy('releaseDate', descending: true)
      .limit(3)
      .get();
      List<SongEntity> songs = [];
      for(var element in data.docs){
        var songModel = SongModel.fromJson(element.data());
        songs.add(
          songModel.toEntity()
        );
      }
      return Right(songs);
    } catch(e){
      return Left('An error occured, Please try again.');    
    }
  }
  
  @override
  Future<Either> getPlayList() async{
    try {
      var data = await FirebaseFirestore.instance.collection('Songs')
      .orderBy('releaseDate', descending: true)
      .get();
      List<SongEntity> songs = [];
      for(var element in data.docs){
        var songModel = SongModel.fromJson(element.data());
        songs.add(
          songModel.toEntity()
        );
      }
      return Right(songs);
    } catch(e){
      return Left('An error occured, Please try again.');    
    }
  }
}