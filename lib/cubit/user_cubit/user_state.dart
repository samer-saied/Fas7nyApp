part of 'user_cubit.dart';

@immutable
abstract class UserState {}

///
///
///
///
///////// User /////////////////////////////
class UserInitial extends UserState {}

class UserLoadingAutoState extends UserState {}

class UserLoadingByLoginState extends UserState {}

class UserLoadingByRegisterState extends UserState {}

class UserRegisteredState extends UserState {}

class UserLoadedByLoginState extends UserState {
  final User user;

  UserLoadedByLoginState(this.user);
}

class UserLoadedAutoState extends UserState {
  final UserData user;

  UserLoadedAutoState(this.user);
}

class UserErrorLoginState extends UserState {
  final String error;

  UserErrorLoginState(this.error);
}

class UserErrorAutoState extends UserState {
  final String error;

  UserErrorAutoState(this.error);
}

class UserErrorRegisterState extends UserState {
  final String error;

  UserErrorRegisterState(this.error);
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
