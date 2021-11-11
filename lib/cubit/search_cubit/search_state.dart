part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitialState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchLoadedState extends SearchState {
  final List<Place> searchedPlaces;

  SearchLoadedState(this.searchedPlaces);
}

class SearchErrorState extends SearchState {
  final String error;

  SearchErrorState(this.error);
}
