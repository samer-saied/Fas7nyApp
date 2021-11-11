import 'package:fas7ny/constants/my_colors.dart';
import 'package:fas7ny/cubit/observe_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: MyColors.myMainColor,
      //statusBarBrightness: Brightness.light,
    ),
  );
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}
