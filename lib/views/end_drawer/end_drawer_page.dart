import 'package:fas7ny/components/shared_widgets.dart';
import 'package:fas7ny/constants/my_colors.dart';
import 'package:fas7ny/cubit/user_cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EndDrawerAppPage extends StatelessWidget {
  const EndDrawerAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserErrorState) {
          Fluttertoast.showToast(
              msg: state.error.toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: MyColors.myWhite,
              textColor: MyColors.myMainColor,
              fontSize: 16.0);
        }
      },
      builder: (context, state) {
        if (state is UserLoadedState) {
          return ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                clipBehavior: Clip.antiAlias,
                padding: EdgeInsets.zero,
                height: 100,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: NetworkImage(
                      state.user.user.image.url,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text(state.user.user.username),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  //Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(state.user.user.mobile),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  //  Navigator.pop(context);
                },
              ),
              MaterialButton(
                  child: const Text("LogOut"),
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  })
            ],
          );
        }
        return const CircleLoadingWidget();
      },
    ));
  }
}
