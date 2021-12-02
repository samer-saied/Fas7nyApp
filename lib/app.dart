import 'package:fas7ny/cubit/fav_cubit/fav_cubit.dart';
import 'package:fas7ny/data/lang/applocal.dart';
import 'package:fas7ny/data/repository/fav_repository.dart';
import 'package:fas7ny/views/home/home_page.dart';
import 'package:fas7ny/views/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
  final Locale locale;
  MyApp({Key? key, required this.locale}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  HomesRepository homeRepository = HomesRepository(HttpServices());
  UserRepository userRepository = UserRepository(HttpServices());
  FavRepository favRepository = FavRepository(HttpServices());

  @override
  void initState() {
    super.initState();
  }

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
          create: (context) =>
              UserCubit(userRepository, favRepository)..getUserData(),
        ),
        BlocProvider(
          create: (context) => FavCubit(favRepository),
        ),
      ],
      child: BlocBuilder<UserCubit, UserState>(builder: (context, state) {
        return MaterialApp(
          localizationsDelegates: const [
            AppLocale.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
            Locale('ar', ''), // arabic, no country code
            Locale('es', ''),
            Locale('ru', ''),
          ],
          // user locale for Default One langauage for application
          locale: widget.locale,
          // localeResolutionCallback: (currentLocale, supportedLocale) {
          //   for (Locale locale in supportedLocale) {
          //     if (currentLocale!.languageCode == locale.languageCode) {
          //       return locale;
          //     }
          //     return supportedLocale.first;
          //   }
          // },
          color: MyColors.myGrey,
          debugShowCheckedModeBanner: false,
          title: "Fas7ny",
          theme: ThemeData(textTheme: Constants.appThemes),
          home: (state is UserLoadedAutoState) ? HomePage() : LoginPage(),
          routes: {
            '/home': (context) => HomePage(),
            '/login': (context) => LoginPage(),
            '/register': (context) => RegisterPage(),
          },
        );
      }),
    );
  }
}
