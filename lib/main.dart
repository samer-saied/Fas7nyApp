import 'package:fas7ny/constants/my_colors.dart';
import 'package:fas7ny/cubit/home_cubit/home_cubit.dart';
import 'package:fas7ny/cubit/observe_cubit.dart';
import 'package:fas7ny/data/repository/home_repositoryy.dart';
import 'package:fas7ny/data/repository/places_repository.dart';
import 'package:fas7ny/data/web_services/dio_services.dart';
import 'package:fas7ny/views/home/layouts/home_page.dart';
import 'package:fas7ny/views/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/constants.dart';
import 'cubit/place_cubit.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: MyColors.myDarkGrey));
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  PlacesRepository placesRepository = PlacesRepository(Services());
  HomesRepository homeRepository = HomesRepository(Services());
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PlaceCubit(placesRepository),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => HomeCubit(homeRepository),
        ),
      ],
      child: MaterialApp(
        home: const HomePage(),
        color: MyColors.myDarkGrey,
        debugShowCheckedModeBanner: false,
        title: "Fas7ny",
        theme: ThemeData(textTheme: Constants.appThemes),
      ),
    );
  }
}
