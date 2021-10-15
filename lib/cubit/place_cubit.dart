import 'package:bloc/bloc.dart';
import 'package:fas7ny/data/repository/places_repository.dart';
import 'package:fas7ny/models/place_model.dart';
import 'package:meta/meta.dart';

part 'place_state.dart';

class PlaceCubit extends Cubit<PlaceState> {
  PlacesRepository placesRepository;
  PlaceCubit(this.placesRepository) : super(PlaceInitialState());

  List<Place> allplaces = [];

  List<Place> getAllPlaces() {
    emit(PlaceLoadingState());
    placesRepository.getAllPlaces().then((places) {
      allplaces = places;
      emit(PlaceLoadedState(places));
    });
    return allplaces;
  }
}
