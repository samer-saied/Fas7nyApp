import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:fas7ny/constants/strings.dart';
import 'package:fas7ny/data/repository/user_repository.dart';
import 'package:fas7ny/models/place_model.dart';
import 'package:fas7ny/models/user_model.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserRepository userRepository;

  UserCubit(this.userRepository) : super(UserInitial());

  List<Place> favoritePlaces = [];
  User? currentUser;

  void getUserData() {
    emit(UserLoadingState());
    userRepository.loginUser(data: jsonEncode(userData)).then((user) {
      currentUser = user;
      emit(UserLoadedState(user));
    }).catchError((error) {
      print(error.toString());
      emit(UserErrorState(error));
    });
  }

  void getFavourites() {
    emit(FavoriteLoadingState());
    if (favoritePlaces.isNotEmpty) {
      emit(FavoriteLoadedState(favoritePlaces));
      return;
    } else {
      userRepository.getFavorites().then((favPlaces) {
        favoritePlaces = favPlaces;
        emit(FavoriteLoadedState(favoritePlaces));
      }).catchError((error) {
        emit(FavoriteErrorState(error.toString()));
      });
    }
  }

  void deleteFavourite(Place deletedPlace) {
    emit(FavoriteLoadingState());
    favoritePlaces.remove(deletedPlace);
    var data = {
      "places": favoritePlaces.map((e) => {"_id": e.id}).toList(),
      "users_permissions_user": {"_id": "$userID"}
    };
    userRepository.deleteFavorites(data).then((favPlaces) {
      favoritePlaces = favPlaces;
      emit(FavoriteLoadedState(favPlaces));
    }).catchError((error) {
      print(error.toString());
      emit(FavoriteErrorState(error.toString()));
    });
  }

  void addFavourites(Place addPlace) {
    emit(FavoriteLoadingState());
    if (!checkFavourites(addPlace.id)) {
      favoritePlaces.add(addPlace);
      var data = {
        "places": favoritePlaces.map((e) => {"_id": e.id}).toList(),
        "users_permissions_user": {"_id": "$userID"}
      };
      userRepository.updateFavorites(data).then((favPlaces) {
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
