import 'package:bloc/bloc.dart';
import 'package:fas7ny/cubit/fav_cubit/fav_state.dart';
import 'package:fas7ny/data/repository/fav_repository.dart';
import 'package:fas7ny/models/place_model.dart';

class FavCubit extends Cubit<FavState> {
  FavRepository favRepository;
  FavCubit(
    this.favRepository,
  ) : super(FavInitial());

  List<Place> favoritePlaces = [];
  //late String favID;

  void getFavourites() {
    emit(FavoriteLoadingState());
    favRepository.getFavorites().then((favPlaces) {
      favoritePlaces = favPlaces;
      emit(FavoriteLoadedState(favoritePlaces));
    }).catchError((error) {
      emit(FavoriteErrorState(error.toString()));
    });
  }

  void deleteFavourite(Place deletedPlace) {
    emit(FavoriteLoadingState());
    favoritePlaces.remove(deletedPlace);

    favRepository
        .updateFavoritesData(
      favPlaces: favoritePlaces,
    )
        .then((favPlaces) {
      favoritePlaces = favPlaces;
      emit(FavoriteLoadedState(favPlaces));
    }).catchError((error) {
      print(error.toString());
      emit(FavoriteErrorState(error.toString()));
    });
  }

  void updateFavourites(Place addPlace) {
    emit(FavoriteLoadingState());
    if (!checkFavourites(addPlace.id)) {
      favoritePlaces.add(addPlace);

      favRepository
          .updateFavoritesData(
        favPlaces: favoritePlaces,
      )
          .then((favPlaces) {
        favoritePlaces = favPlaces;
        emit(FavoriteLoadedState(favPlaces));
      }).catchError((error) {
        print(error.toString());
        emit(FavoriteErrorState(error.toString()));
      });
    }
  }

  bool checkFavourites(String placeID) {
    emit(FavoriteAddLoadingState());
    for (var favPlace in favoritePlaces) {
      emit(FavoriteAddedState());
      return favPlace.id == placeID;
    }
    emit(FavoriteAddedState());
    return false;
  }
}
