import 'package:bloc/bloc.dart';
import 'package:fas7ny/data/local/shared.dart';
import 'package:fas7ny/data/repository/fav_repository.dart';
import 'package:fas7ny/data/repository/user_repository.dart';
import 'package:fas7ny/models/place_model.dart';
import 'package:fas7ny/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserRepository userRepository;
  FavRepository favRepository;

  UserCubit(this.userRepository, this.favRepository) : super(UserInitial());

  UserData? currentUser;

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
      SharedSetting().setSetting("userID", user.user.id);

      currentUser = user.user;
      favRepository.createFav(userID: user.user.id).then((value) {
        SharedSetting().setSetting("favID", value);
        print(value);
        ///////////////////////////////////
        emit(UserRegisteredState());
      });
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
      } else {
        emit(UserErrorAutoState("error"));
      }
    }).catchError((error) {
      print("----------Error---4---------------");
      emit(UserErrorAutoState(error.toString()));
    });
  }
}
