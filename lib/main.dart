import 'package:bloc/bloc.dart';
import 'package:fas7ny/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'cubit/app_bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: MyColors.myMainColor,
      //statusBarBrightness: Brightness.light,
    ),
  );

  BlocOverrides.runZoned(
    () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return runApp(Phoenix(
          child: MyApp(
        locale: Locale(prefs.getString("language") ?? 'en'),
      )));
    },
    blocObserver: AppBlocObserver(),
  );
}
