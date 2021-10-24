import 'package:fas7ny/constants/my_colors.dart';
import 'package:fas7ny/cubit/city_cubit/city_cubit.dart';
import 'package:fas7ny/cubit/home_cubit/home_cubit.dart';
import 'package:fas7ny/cubit/observe_cubit.dart';
import 'package:fas7ny/data/repository/home_repositoryy.dart';
import 'package:fas7ny/data/web_services/http_services.dart';
import 'package:fas7ny/views/home/layouts/home_page.dart';
import 'package:fas7ny/views/login/login_page.dart';
import 'package:fas7ny/views/places_for_city/places_for_city.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/constants.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: MyColors.myDarkGrey,
      statusBarBrightness: Brightness.light));
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // PlacesRepository placesRepository = PlacesRepository(HttpServices());

  HomesRepository homeRepository = HomesRepository(HttpServices());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PlacesCityCubit(homeRepository),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => HomeCubit(homeRepository)..getAllBanners(),
        ),
      ],
      child: MaterialApp(
        home: LoginPage(),
        color: MyColors.myGrey,
        debugShowCheckedModeBanner: false,
        title: "Fas7ny",
        theme: ThemeData(textTheme: Constants.appThemes),
      ),
    );
  }
}
