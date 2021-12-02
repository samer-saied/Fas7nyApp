import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fas7ny/constants/my_colors.dart';
import 'package:fas7ny/cubit/user_cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TitleWidget extends StatelessWidget {
  final String titleName;
  const TitleWidget({Key? key, required this.titleName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            titleName,
            style: Theme.of(context).textTheme.caption,
          ),
        ),
      ],
    );
  }
}

class CircleLoadingWidget extends StatelessWidget {
  const CircleLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
      color: MyColors.myMainColor,
    ));
  }
}

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: MyColors.myMainColor,
      ),
      iconTheme: const IconThemeData(color: MyColors.myMainColor),
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: const Fas7nyWordWidget(
        fontSize: 30,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
              onTap: () {
                Scaffold.of(context).openEndDrawer();
              },
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              child:
                  BlocBuilder<UserCubit, UserState>(builder: (context, state) {
                if (BlocProvider.of<UserCubit>(context).currentUser!.image !=
                    null) {
                  return Container(
                      width: 35,
                      clipBehavior: Clip.antiAlias,
                      child: CachedNetworkImage(
                        imageUrl: BlocProvider.of<UserCubit>(context)
                            .currentUser!
                            .image!
                            .url,
                      ),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: MyColors.myGrey,
                      ));
                }
                return Container(
                  width: 35,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: MyColors.myGrey,
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage("assets/images/person.png")),
                  ),
                );
              })),
        )
      ],
    );
  }
}

class Fas7nyWordWidget extends StatelessWidget {
  final double fontSize;
  const Fas7nyWordWidget({
    Key? key,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Fas',
        style: TextStyle(
          color: MyColors.myDarkGrey,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          fontFamily: 'Ubuntu',
        ),
        children: const <TextSpan>[
          TextSpan(
              text: '7',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: MyColors.myMainColor,
              )),
          TextSpan(text: 'ny'),
        ],
      ),
    );
  }
}

class AnimatedTextWidget extends StatelessWidget {
  const AnimatedTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      repeatForever: true,
      animatedTexts: [
        WavyAnimatedText(' Enjoy in Egypt',
            textAlign: TextAlign.left,
            textStyle: TextStyle(
              color: MyColors.myDarkGrey.withOpacity(.8),
              fontFamily: 'Ubuntu',
              fontSize: 14,
            )),
      ],
      isRepeatingAnimation: true,
      onTap: () {
        print("Tap Event");
      },
    );
  }
}

getSnackBar(BuildContext context, String msgTxt) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(msgTxt),
      backgroundColor: MyColors.myMainColor,
    ),
  );
}

showAlertDialog(BuildContext context, String msgTxt, Function okPressBtn) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.NO_HEADER,
    animType: AnimType.BOTTOMSLIDE,
    title: 'Error',
    desc: msgTxt,
    btnOkOnPress: okPressBtn,
    btnOkColor: MyColors.myMainColor,
  ).show();
}

/////////////////////////// Social Button ///////////////////////////////////
class SocialIconWidget extends StatelessWidget {
  final Function() ontapFunc;
  final String socialName;
  const SocialIconWidget(
      {Key? key, required this.socialName, required this.ontapFunc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        width: 40,
        height: 40,
        child: Image(
          image: AssetImage("assets/images/social/$socialName.png"),
        ),
      ),
      onTap: ontapFunc,
    );
  }
}
