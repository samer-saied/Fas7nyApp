import 'package:fas7ny/components/shared_widgets.dart';
import 'package:fas7ny/constants/my_colors.dart';
import 'package:fas7ny/views/home/home_page.dart';
import 'package:flutter/material.dart';
import 'Animation/fade_animation.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size mediaSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: MyColors.myWhite,
        body: SafeArea(
          child: SizedBox(
            width: mediaSize.width,
            height: mediaSize.height,
            child: Stack(
              children: [
                Positioned(
                  bottom: -90,
                  right: 0,
                  child: FadeAnimation(
                    1.5,
                    Container(
                      width: 250,
                      height: 250,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/pyramids.png'),
                        ),
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 50,
                      ),
                      const Fas7nyWordWidget(
                        fontSize: 36,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const AnimatedTextWidget(),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const FadeAnimation(
                                1.6,
                                Text(
                                  "Login ",
                                  style: TextStyle(
                                      color: MyColors.myMainColor,
                                      fontFamily: 'Ubuntu',
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            FadeAnimation(
                                1.8,
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: MyColors.myMainColor
                                                .withOpacity(0.20),
                                            blurRadius: 20.0,
                                            offset: Offset(0, 10))
                                      ]),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.grey))),
                                        child: TextField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Email or Phone number",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[400])),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Password",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[400])),
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                            const SizedBox(
                              height: 30,
                            ),
                            GestureDetector(
                              onTap: () {
                                ////////////////   Login  ///////////////
                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/', (route) => false);
                              },
                              child: FadeAnimation(
                                  2,
                                  Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: const LinearGradient(
                                        colors: [
                                          MyColors.mylightpink,
                                          MyColors.myMainColor,
                                        ],
                                        begin: Alignment.bottomRight,
                                        end: Alignment(0.2, 0.0),
                                      ),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Login",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            letterSpacing: 1.25,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  )),
                            ),
                            const SizedBox(
                              height: 70,
                            ),
                            const FadeAnimation(
                                1.5,
                                Center(
                                  child: Text(
                                    "Don't have account?",
                                    style:
                                        TextStyle(color: MyColors.myMainColor),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
