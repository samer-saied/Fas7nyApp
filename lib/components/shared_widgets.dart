import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fas7ny/constants/my_colors.dart';
import 'package:flutter/material.dart';

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
      color: MyColors.mypurpleRGB,
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
      //centerTitle: true,
      iconTheme: const IconThemeData(color: MyColors.mypurpleRGB),
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: const Fas7nyWordWidget(
        fontSize: 36,
      ),
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
                color: MyColors.mypurpleRGB,
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
