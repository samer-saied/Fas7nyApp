part of 'place_cubit.dart';

@immutable
abstract class PlaceState {}

class PlaceInitial extends PlaceState {}

//            Place          //
class PlaceLoadingState extends PlaceState {}

class PlaceErrorState extends PlaceState {
  final String error;

  PlaceErrorState(this.error);
}

class PlaceLoadedState extends PlaceState {
  final Place place;

  PlaceLoadedState(this.place);
}
