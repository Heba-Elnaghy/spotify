import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:spotify/common/bloc/favorite_button/favoite_button_state.dart';
import 'package:spotify/domain/usecases/song/add_or_remove_favorete_song.dart';
import 'package:spotify/service_locator.dart';

class FavoriteButtonCubit extends Cubit<FavoriteButtonState> {

  FavoriteButtonCubit() : super(FavoriteButtonInitial());

  Future<void> favoriteButtonUpdated(String songId) async {
    
    var result = await sl<AddOrRemoveFavoriteSongUseCase>().call(
      params: songId
    );
    result.fold(
      (l){},
      (isFavorite){
        emit(
          FavoriteButtonUpdated(
            isFavorite: isFavorite
          )
        );
      },
    );
  }
}