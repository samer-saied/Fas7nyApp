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
  List<Place> tempFavoritePlaces = [];

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

  void addFavourite(Place addedPlace) {
    emit(FavoriteLoadingState());
    if (favoritePlaces.isEmpty) {
      getFavourites();
    }

    if (checkFavourites(addedPlace.id)) {
      return;
    } else {
      favoritePlaces.add(addedPlace);
      favRepository
          .updateFavoritesData(
        favPlaces: favoritePlaces,
      )
          .then((favPlaces) {
        favoritePlaces = favPlaces;
        emit(FavoriteLoadedState(favPlaces));
      }).catchError((error) {
        emit(FavoriteErrorState(error.toString()));
      });
    }
  }

  void deleteFavourite(Place deletedPlace) {
    emit(FavoriteLoadingState());
    print(deletedPlace);
    print(favoritePlaces.length);

    print(favoritePlaces.remove(deletedPlace));
    favoritePlaces.removeWhere((item) => item.id == deletedPlace.id);

    favRepository
        .updateFavoritesData(
      favPlaces: favoritePlaces,
    )
        .then((favPlaces) {
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
