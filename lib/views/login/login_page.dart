import 'package:fas7ny/components/shared_widgets.dart';
import 'package:fas7ny/constants/my_colors.dart';
import 'package:fas7ny/cubit/user_cubit/user_cubit.dart';
import 'package:fas7ny/data/lang/applocal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Animation/fade_animation.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userTextController = TextEditingController();
  final TextEditingController _passTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size mediaSize = MediaQuery.of(context).size;
    print(AppLocale.of(context).locale);
    return Stack(children: [
      ///////////////////// BackGround Image ////////////////////////////
      Container(
        height: mediaSize.height,
        width: mediaSize.width,
        color: MyColors.mySlaveColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            FadeAnimation(
              2.0,
              Image(
                image: AssetImage("assets/images/backGoundLayer.png"),
              ),
            )
          ],
        ),
      ),

      ///////////////////// Main Screen ////////////////////////////

      Positioned(
          child: Scaffold(
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SizedBox(
            height: mediaSize.height,
            width: mediaSize.width,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  const SizedBox(
                    height: 70,
                  ),
                  ////////////////////// Fas7ny Word ////////////////////////
                  // Padding(
                  //   padding: EdgeInsets.symmetric(
                  //       horizontal: mediaSize.width * 0.30),
                  //   child: const Image(
                  //       image: AssetImage("assets/images/fas7ny.png")),
                  // ),
                  const Text(
                    "فسحني",
                    style: TextStyle(
                        fontFamily: 'Kufam',
                        fontSize: 60,
                        fontWeight: FontWeight.normal,
                        color: MyColors.myMainColor),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: BlocBuilder<UserCubit, UserState>(
                      builder: (context, state) {
                        if (state is UserLoadingAutoState) {
                          return SizedBox(
                            width: mediaSize.width,
                            height: mediaSize.height / 3,
                            child: const Center(
                              child: CircleLoadingWidget(),
                            ),
                          );
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ///
                            ///
                            ///
                            ///
                            /////////////     Login Word    //////////////////////
                            FadeAnimation(
                                1.6,
                                Text(
                                  "${getLang(context, "login")}",
                                  style: const TextStyle(
                                      color: MyColors.myMainColor,
                                      fontFamily: 'Ubuntu',
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                )),
                            const SizedBox(
                              height: 10,
                            ),

                            ///
                            ///
                            ///
                            ///////////////////////   Form    ////////////////
                            FadeAnimation(
                                1.8,
                                Container(
                                  // padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: MyColors.myMainColor
                                                .withOpacity(0.20),
                                            blurRadius: 20.0,
                                            offset: const Offset(0, 7))
                                      ]),
                                  child: Form(
                                    key: _formKey,
                                    child: Column(
                                      children: <Widget>[
                                        ///
                                        ///
                                        ///
                                        ////////////   UserName Field ////////////////
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5.0, horizontal: 10.0),
                                          decoration: const BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.grey))),
                                          child: Center(
                                            child: TextFormField(
                                              cursorColor: MyColors.myMainColor,
                                              cursorHeight: 25,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                fontSize: 20,
                                                color: MyColors.myblack,
                                              ),
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              validator: userNameValidateFunc,
                                              controller: _userTextController,
                                              decoration: InputDecoration(
                                                  errorStyle: const TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.red),
                                                  border: InputBorder.none,
                                                  hintText:
                                                      "Email or Phone number",
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey[400])),
                                            ),
                                          ),
                                        ),

                                        ///
                                        ///
                                        ///
                                        ////////////   Password Field ////////////////
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5.0, horizontal: 10.0),
                                          child: TextFormField(
                                            cursorColor: MyColors.myMainColor,
                                            cursorHeight: 25,
                                            maxLines: 1,
                                            style: const TextStyle(
                                              fontSize: 20,
                                              color: MyColors.myblack,
                                            ),
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            validator: passwordValidateFunc,
                                            controller: _passTextController,
                                            obscureText: true,
                                            decoration: InputDecoration(
                                                errorStyle: const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.red),
                                                border: InputBorder.none,
                                                hintText: "Password",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey[400])),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                            const SizedBox(
                              height: 30,
                            ),
                            //////////////////////  Login button   /////////////////////

                            GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                if (_formKey.currentState!.validate()) {
                                  BlocProvider.of<UserCubit>(context).loginUser(
                                      userName: _userTextController.text.trim(),
                                      password: _passTextController.text);
                                }
                              },
                              child: FadeAnimation(
                                  2,
                                  Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: const LinearGradient(
                                        colors: [
                                          MyColors.mySlaveColor,
                                          MyColors.myMainColor,
                                        ],
                                        begin: Alignment.bottomRight,
                                        end: Alignment(.01, 0),
                                      ),
                                    ),
                                    child: Center(
                                        child:
                                            BlocConsumer<UserCubit, UserState>(
                                                listener: (context, state) {
                                      if (state is UserLoadedByLoginState) {
                                        Navigator.pushReplacementNamed(
                                            context, '/home');
                                      } else if (state is UserErrorLoginState) {
                                        showAlertDialog(
                                            context, state.error, () {});
                                      }
                                    }, builder: (context, state) {
                                      if (state is UserLoadingByLoginState) {
                                        return const Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: CircularProgressIndicator(
                                              color: MyColors.myWhite,
                                            ),
                                          ),
                                        );
                                      }

                                      return Text(
                                        "${getLang(context, "login")}",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            letterSpacing: 1.25,
                                            fontWeight: FontWeight.normal),
                                      );
                                    })),
                                  )),
                            ),
                            ///////////////////////   Or   ///////////////////////
                            FadeAnimation(
                              1.7,
                              Center(
                                  child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 1,
                                      width: 50,
                                      color: MyColors.myMainColor,
                                    ),
                                    const Text(
                                      "   Or   ",
                                      style: TextStyle(
                                          color: MyColors.myMainColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      height: 1,
                                      width: 50,
                                      color: MyColors.myMainColor,
                                    ),
                                  ],
                                ),
                              )),
                            ),

                            ///////////////////////  Social Icons    ///////////////////////
                            FadeAnimation(
                              1.6,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SocialIconWidget(
                                    socialName: 'apple',
                                    ontapFunc: () {
                                      showAlertDialog(
                                          context,
                                          "Apple sign in Not available now ",
                                          () {});
                                    },
                                  ),
                                  SocialIconWidget(
                                    socialName: 'facebook',
                                    ontapFunc: () {
                                      showAlertDialog(
                                          context,
                                          "Facebook sign in is Not available now ",
                                          () {});
                                    },
                                  ),
                                  SocialIconWidget(
                                    socialName: 'google',
                                    ontapFunc: () {
                                      showAlertDialog(
                                          context,
                                          "Google sign in is Not available now ",
                                          () {});
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),

                            const SizedBox(
                              height: 15,
                            ),
                            //////////////////////  Don't have account   /////////////////////
                            FadeAnimation(
                                1.9,
                                Center(
                                  child: InkWell(
                                    child: Text(
                                      "${getLang(context, "Create new account")}",
                                      style: MediaQuery.of(context)
                                                  .orientation ==
                                              Orientation.landscape
                                          ? const TextStyle(color: Colors.white)
                                          : const TextStyle(
                                              color: MyColors.myMainColor),
                                    ),
                                    onTap: () {
                                      Navigator.pushNamed(context, '/register');
                                    },
                                  ),
                                )),

                            const SizedBox(
                              height: 50,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ))
    ]);
  }

  String? userNameValidateFunc(value) {
    Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regex.hasMatch(value) || value == null || value.isEmpty) {
      return 'Correct Email is required';
    } else {
      return null;
    }
  }

  String? passwordValidateFunc(value) {
    if (value == null || value.isEmpty || value.length < 6) {
      return 'Must be more then 6 character';
    }
    return null;
  }
}
