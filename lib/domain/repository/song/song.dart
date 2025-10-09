import 'package:dartz/dartz.dart';

abstract class SongsRepository{
  Future<Either> getNewSongs(); //
  Future<Either> getPlayList(); //fetch all the songs from firestore.
}