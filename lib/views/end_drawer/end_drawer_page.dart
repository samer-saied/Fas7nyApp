import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fas7ny/components/shared_widgets.dart';
import 'package:fas7ny/cubit/user_cubit/user_cubit.dart';
import 'package:fas7ny/data/local/shared.dart';
import 'package:fas7ny/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EndDrawerAppPage extends StatelessWidget {
  const EndDrawerAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserErrorLoginState) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.BOTTOMSLIDE,
            title: 'Dialog Title',
            desc: state.error,
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
          ).show();
        }
      },
      builder: (context, state) {
        UserData? user = BlocProvider.of<UserCubit>(context).currentUser;

        // ImageProvider imageWidget() {
        //   if (user.user.image != null) {
        //     return CachedNetworkImageProvider(
        //       user.user.image!.url,
        //     );
        //   }
        //   return AssetImage("assets/images/person.png");
        // }
        if (user!.image == null) {
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
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage("assets/images/person.png")),
                ),
              ),
              ListTile(
                title: Text(user.username),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  //Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(user.email),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  //Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(user.mobile),
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
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/login');
                  })
            ],
          );
        } else if (user.image!.url.isNotEmpty) {
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
                      image: CachedNetworkImageProvider(
                        user.image!.url,
                      )),
                ),
              ),
              ListTile(
                title: Text(user.username),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  //Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(user.email),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  //Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(user.mobile),
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
                    SharedSetting().setSetting('user', '');
                    Navigator.pop(context);
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
