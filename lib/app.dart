import 'package:fas7ny/views/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/constants.dart';
import 'constants/my_colors.dart';
import 'cubit/city_cubit/city_cubit.dart';
import 'cubit/home_cubit/home_cubit.dart';
import 'cubit/place_cubit/place_cubit.dart';
import 'cubit/user_cubit/user_cubit.dart';
import 'data/repository/home_repository.dart';
import 'data/repository/user_repository.dart';
import 'data/web_services/http_services.dart';
import 'views/login/login_page.dart';

////////////////      Provide Bloc For Main Application //////////////////////////
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  HomesRepository homeRepository = HomesRepository(HttpServices());
  UserRepository userRepository = UserRepository(HttpServices());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(homeRepository),
        ),
        BlocProvider(
          create: (context) => PlacesCityCubit(homeRepository),
        ),
        BlocProvider(
          create: (context) => PlaceCubit(homeRepository),
        ),
        BlocProvider(
          create: (context) => UserCubit(userRepository)..getFavourites(),
        ),
      ],
      child: MaterialApp(
        color: MyColors.myGrey,
        debugShowCheckedModeBanner: false,
        title: "Fas7ny",
        theme: ThemeData(textTheme: Constants.appThemes),
        initialRoute: '/login',
        routes: {
          '/home': (context) => HomePage(),
          '/login': (context) => LoginPage(),
        },
      ),
    );
  }
}
