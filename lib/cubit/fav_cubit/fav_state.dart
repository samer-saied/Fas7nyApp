import 'package:fas7ny/models/place_model.dart';

abstract class FavState {}

class FavInitial extends FavState {}

class FavoriteLoadingState extends FavState {}

class FavoriteLoadedState extends FavState {
  final List<Place> favPlaces;

  FavoriteLoadedState(this.favPlaces);
}

class FavoriteErrorState extends FavState {
  final String error;

  FavoriteErrorState(this.error);
}

class FavoriteAddLoadingState extends FavState {}

class FavoriteAddedState extends FavState {}
