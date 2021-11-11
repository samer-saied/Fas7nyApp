import 'package:bloc/bloc.dart';
import 'package:fas7ny/data/repository/search_repository.dart';
import 'package:fas7ny/models/place_model.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchRepository searchRepository;

  SearchCubit(this.searchRepository) : super(SearchInitialState());

  List<Place>? searchedPlaces;

  void getSearchData(String searchData) {
    emit(SearchLoadingState());
    searchRepository.getSearchResults(searchData).then((places) {
      searchedPlaces = places;
      emit(SearchLoadedState(places));
    }).catchError((error) {
      emit(SearchErrorState(error));
    });
  }
}
