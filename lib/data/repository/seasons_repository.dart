import 'package:fas7ny/data/web_services/dio_services.dart';
import 'package:fas7ny/models/place_model.dart';

class SeasonsRepository {
  final DioServices services;

  SeasonsRepository(this.services);

  Future<List<Seasons>> getAllSeasons() async {
    try {
      final List seasons = await services.getAll(gategory: 'seasons');
      return seasons.map((season) => Seasons.fromJson(season)).toList();
    } catch (e) {
      return [];
    }
  }
}
