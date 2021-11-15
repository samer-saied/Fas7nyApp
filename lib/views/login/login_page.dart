import 'package:fas7ny/components/shared_widgets.dart';
import 'package:fas7ny/constants/my_colors.dart';
import 'package:fas7ny/cubit/user_cubit/user_cubit.dart';
import 'package:fas7ny/views/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Animation/fade_animation.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userTextController = TextEditingController();
  final TextEditingController _passTextController = TextEditingController();

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
                            ///
                            ///
                            ///
                            ///
                            /////////////     Login Word    //////////////////////
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
                            //////////////////////  login button   /////////////////////

                            GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                if (_formKey.currentState!.validate()) {
                                  BlocProvider.of<UserCubit>(context).loginUser(
                                      userName: _userTextController.text.trim(),
                                      password: _passTextController.text);
                                }

                                ////////////////   Login  ///////////////
                                // Navigator.pushNamedAndRemoveUntil(
                                //     context, '/home', (route) => false);
                              },
                              child: FadeAnimation(
                                  2,
                                  Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(
                                        colors: [
                                          MyColors.myMainColor
                                              .withOpacity(0.40),
                                          MyColors.myMainColor,
                                        ],
                                        begin: Alignment.bottomRight,
                                        end: const Alignment(.01, 0),
                                      ),
                                    ),
                                    child: Center(
                                        child:
                                            BlocConsumer<UserCubit, UserState>(
                                                listener: (context, state) {
                                      if (state is UserLoadedState) {
                                        Navigator.pushReplacementNamed(
                                            context, '/home');
                                      }
                                    }, builder: (context, state) {
                                      if (state is UserLoadingState) {
                                        return const Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: CircularProgressIndicator(
                                              color: MyColors.myWhite,
                                            ),
                                          ),
                                        );
                                      } else if (state is UserErrorState) {
                                        Fluttertoast.showToast(
                                            msg: state.error,
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor:
                                                MyColors.myMainColor,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      }

                                      return const Text(
                                        "Login",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            letterSpacing: 1.25,
                                            fontWeight: FontWeight.normal),
                                      );
                                    })),
                                  )),
                            ),
                            const SizedBox(
                              height: 70,
                            ),
                            //////////////////////  Don't have account   /////////////////////
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
