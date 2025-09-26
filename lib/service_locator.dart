import 'package:get_it/get_it.dart';
import 'package:songify/data/repository/auth/auth_repository_impl.dart';
import 'package:songify/data/repository/song/song_repository_impl.dart';
import 'package:songify/data/sources/auth/auth_firebase_service.dart';
import 'package:songify/data/sources/songs/song_firebase_service.dart';
import 'package:songify/domain/repository/auth/auth.dart';
import 'package:songify/domain/repository/song/song.dart';
import 'package:songify/domain/usecases/auth/signin_usecase.dart';
import 'package:songify/domain/usecases/auth/signup_usecase.dart';
import 'package:songify/domain/usecases/song/get_news_songs.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  sl.registerSingleton<AuthFirebaseService>(
    AuthFireBaseServiceImpl()
  );

  sl.registerSingleton<SongFirebaseService>(
    SongFirebaseServiceImpl()
  );

  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl()
  );

  sl.registerSingleton<SongsRepository>(
    SongRepositoryImpl()
  );

  sl.registerSingleton<SignupUseCase>(
    SignupUseCase()
  );

  sl.registerSingleton<SigninUseCase>(
    SigninUseCase()
  );

  sl.registerSingleton<GetNewsSongsUseCase>(
    GetNewsSongsUseCase()
  );
}