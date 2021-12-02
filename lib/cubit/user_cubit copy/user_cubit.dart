import 'package:bloc/bloc.dart';
import 'package:fas7ny/cubit/user_cubit/user_cubit.dart';
import 'package:fas7ny/data/local/shared.dart';
import 'package:fas7ny/data/repository/fav_repository.dart';
import 'package:fas7ny/data/repository/user_repository.dart';
import 'package:fas7ny/data/web_services/http_services.dart';
import 'package:fas7ny/models/place_model.dart';
import 'package:fas7ny/models/user_model.dart';

class UserCubit extends Cubit<UserState> {
  UserRepository userRepository;

  UserCubit(this.userRepository) : super(UserInitial());

  List<Place> favoritePlaces = [];
  UserData? currentUser;
  late String favID;

  void loginUser({required String userName, required String password}) {
    emit(UserLoadingByLoginState());
    userRepository
        .loginUser(userName: userName, password: password)
        .then((user) {
      SharedSetting().setSetting("user", user.jwt);
      currentUser = user.user;
      emit(UserLoadedByLoginState(user));
    }).catchError((error) {
      emit(UserErrorLoginState(error.toString()));
    });
  }

  void registerUser({required UserData user, required String password}) {
    emit(UserLoadingByRegisterState());
    userRepository
        .registerUser(userdata: user.toJson(), passworddata: password)
        .then((user) {
      SharedSetting().setSetting("user", user.jwt);
      currentUser = user.user;
      FavRepository(HttpServices())
          .createFav(userID: user.user.id)
          .then((value) {
        print(favID);
        favID = value;
      });
      emit(UserRegisteredState());
      return user;
    }).catchError((error) {
      emit(UserErrorRegisterState(error.toString()));
    });
  }

  void getUserData() {
    emit(UserLoadingAutoState());
    userRepository.checkTokenUser().then((user) {
      if (user != null) {
        currentUser = user;
        emit(UserLoadedAutoState(user));
      }
    }).catchError((error) {
      print("----------Error---4---------------");
      emit(UserErrorAutoState(error.toString()));
    });
  }
}
