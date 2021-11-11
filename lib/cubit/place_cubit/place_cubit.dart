import 'package:bloc/bloc.dart';
import 'package:fas7ny/data/repository/home_repository.dart';
import 'package:fas7ny/models/place_model.dart';
import 'package:meta/meta.dart';

part 'place_state.dart';

class PlaceCubit extends Cubit<PlaceState> {
  HomesRepository homeRepository;
  PlaceCubit(this.homeRepository) : super(PlaceInitial());

  late Place placeDate;

  void getPlace({required String placeId}) {
    emit(PlaceLoadingState());
    homeRepository.getPlace(placeId: placeId).then((place) {
      placeDate = place;
      emit(PlaceLoadedState(place));
    }).catchError((error) {
      emit(PlaceErrorState(error.toString()));
    });
    ;
  }
}
