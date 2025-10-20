import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:songify/common/bloc/favorite_button/favorite_button_cubit.dart';
import 'package:songify/common/bloc/favorite_button/favorite_button_state.dart';
import 'package:songify/core/configs/theme/app_colors.dart';
import 'package:songify/domain/entities/song/song_entity.dart';

class FavoriteButton extends StatelessWidget {
  final SongEntity songEntity;
  const FavoriteButton({
    required this.songEntity,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteButtonCubit(),
      child: BlocBuilder<FavoriteButtonCubit, FavoriteButtonState>(
        builder: (context, state) {
          if(state is FavoriteButtonInitial){
            return IconButton(
              onPressed: () {
                context.read<FavoriteButtonCubit>().favoriteButtonUpdated(
                  songEntity.songId
                );
              },
                icon: Icon(
                songEntity.isFavorite ? Icons.favorite : Icons.favorite_outline,
                //add size maybe
                color: AppColors.grey,
              ),
            );
          }
          if(state is FavoriteButtonUpdated){
            return IconButton(
              onPressed: () {
                context.read<FavoriteButtonCubit>().favoriteButtonUpdated(
                  songEntity.songId
                );
              },
                icon: Icon(
                state.isFavorite ? Icons.favorite : Icons.favorite_outline,
                //add size maybe
                color: AppColors.grey,
              ),
            );
          }
          return Container();
        },
      )
    );
  }
}