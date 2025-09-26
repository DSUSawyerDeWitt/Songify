import 'package:dartz/dartz.dart';
import 'package:songify/core/usecase/usecase.dart';
import 'package:songify/data/repository/song/song_repository_impl.dart';

import '../../../service_locator.dart';

class GetNewsSongsUseCase extends UseCase<Either, dynamic>{
  @override
  Future<Either> call({params}) async {
    return await sl<SongRepositoryImpl>().getNewSongs();
  }
}