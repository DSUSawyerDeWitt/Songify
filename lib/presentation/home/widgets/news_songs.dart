import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:songify/domain/entities/song/song_entity.dart';
import 'package:songify/presentation/home/bloc/news_songs_cubit.dart';
import 'package:songify/presentation/home/bloc/news_songs_state.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsSongsCubit()..getNewsSongs(),
      child: SizedBox(
        height: 200,
        child: BlocBuilder<NewsSongsCubit, NewsSongsState>(
          builder: (context, state){
            if (state is NewsSongsLoaded) {
              return Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator()
              );
            }
            if (state is NewsSongsLoaded) {
              return _songs(
                state.songs,
              );
            }
            return Container();
          }
        )
      ),
    );
  }


  Widget _songs(List<SongEntity> songs){
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return SizedBox(
          width: 160,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      
                    )
                  )
                ),
              )
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(width: 14), 
      itemCount: songs.length,
    );
  }
}