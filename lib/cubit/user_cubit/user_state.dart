part of 'user_cubit.dart';

@immutable
abstract class UserState {}

///
///
///
///
///////// User /////////////////////////////
class UserInitial extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  final User user;

  UserLoadedState(this.user);
}

class UserErrorState extends UserState {
  final String error;

  UserErrorState(this.error);
}

///
///
///
///
///////// Favourite /////////////////////////////

class FavoriteLoadingState extends UserState {}

class FavoriteLoadedState extends UserState {
  final List<Place> favPlaces;

  FavoriteLoadedState(this.favPlaces);
}

class FavoriteErrorState extends UserState {
  final String error;

  FavoriteErrorState(this.error);
}

class FavoriteAddLoadingState extends UserState {}

class FavoriteAddedState extends UserState {}
