part of 'place_cubit.dart';

@immutable
abstract class PlaceState {}

class PlaceInitialState extends PlaceState {}

class PlaceLoadedState extends PlaceState {
  final List<Place> places;
  PlaceLoadedState(this.places);
}

class PlaceLoadingState extends PlaceState {}
