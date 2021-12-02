import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:fas7ny/constants/my_colors.dart';
import 'package:fas7ny/cubit/user_cubit/user_cubit.dart';
import 'package:fas7ny/data/lang/applocal.dart';
import 'package:fas7ny/models/user_model.dart';
import 'package:fas7ny/views/login/Animation/fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'register_comp.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fristNameTextController =
      TextEditingController();
  final TextEditingController _lastNameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passTextController = TextEditingController();
  final TextEditingController _phoneTextController = TextEditingController();
  final TextEditingController _userNameTextController = TextEditingController();

  RegisterCompanent registerCompanent = RegisterCompanent();

  @override
  Widget build(BuildContext context) {
    Size mediaSize = MediaQuery.of(context).size;
    print(AppLocale.of(context).locale);
    UserData user;

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
            /// Remove stack keyboard on Register
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
                    height: 40,
                  ),
                  const Icon(
                    Icons.person_add,
                    color: MyColors.myMainColor,
                    size: 50,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ///////////////////////     "register by" Word    ///////////////////////
                        FadeAnimation(
                            1.5,
                            Text(
                              "${getLang(context, "Please fill form")}",
                              style: const TextStyle(
                                  color: MyColors.myMainColor,
                                  fontFamily: 'Ubuntu',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )),
                        const SizedBox(
                          height: 8,
                        ),

                        ///
                        ///
                        ///
                        ///////////////////////   Form    ///////////////////////
                        FadeAnimation(
                            1.8,
                            Container(
                              // padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
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
                                    ////////////   userName Field ////////////////
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    InputFieldWidget(
                                      validateFunc: registerCompanent
                                          .userNameValidateFunc,
                                      textController: _userNameTextController,
                                      hintTxt: "User Name",
                                      iconType: Icons.person,
                                    ),

                                    ///
                                    ///
                                    ///
                                    ////////////   FristName Field ////////////////
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    InputFieldWidget(
                                      validateFunc:
                                          registerCompanent.nameValidateFunc,
                                      textController: _fristNameTextController,
                                      hintTxt: "Frist Name",
                                      iconType: Icons.person,
                                    ),

                                    ///
                                    ///
                                    ///
                                    ////////////   LastName Field ////////////////
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    InputFieldWidget(
                                        validateFunc:
                                            registerCompanent.nameValidateFunc,
                                        textController: _lastNameTextController,
                                        hintTxt: "Last Name",
                                        iconType: Icons.group),

                                    ///
                                    ///
                                    ///
                                    ////////////   Email Field ////////////////
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    InputFieldWidget(
                                      validateFunc:
                                          registerCompanent.emailValidateFunc,
                                      textController: _emailTextController,
                                      hintTxt: "Email",
                                      textInputType: TextInputType.emailAddress,
                                      iconType: Icons.email,
                                    ),

                                    ///
                                    ///
                                    ///
                                    ////////////   password Field ////////////////
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    InputFieldWidget(
                                      validateFunc: registerCompanent
                                          .passwordValidateFunc,
                                      textController: _passTextController,
                                      hintTxt: "Password",
                                      isPassword: true,
                                      iconType: Icons.lock,
                                    ),

                                    ///
                                    ///
                                    ///
                                    ////////////   phone Field ////////////////
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    InputFieldWidget(
                                      validateFunc:
                                          registerCompanent.phoneValidateFunc,
                                      textController: _phoneTextController,
                                      hintTxt: "Phone",
                                      textInputType: TextInputType.phone,
                                      iconType: Icons.phone_rounded,
                                    ),
                                  ],
                                ),
                              ),
                            )),
                        const SizedBox(
                          height: 30,
                        ),

                        ///////////////////////  register button   ///////////////////////
                        GestureDetector(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            if (_formKey.currentState!.validate()) {
                              print(_emailTextController.text.toString());
                              user = UserData(
                                  email: _emailTextController.text.toString(),
                                  username: _userNameTextController.text,
                                  fristname: _fristNameTextController.text,
                                  lastname: _lastNameTextController.text,
                                  mobile: _phoneTextController.text);

                              BlocProvider.of<UserCubit>(context).registerUser(
                                  user: user,
                                  password: _passTextController.text);
                            }
                          },
                          child: FadeAnimation(
                              1.9,
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
                                    child: BlocConsumer<UserCubit, UserState>(
                                        listener: (context, state) {
                                  if (state is UserRegisteredState) {
                                    Navigator.pushReplacementNamed(
                                        context, '/home');
                                  } else if (state is UserErrorRegisterState) {
                                    ////
                                    ///
                                    ///
                                    ///       Error Message //////////////////
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.ERROR,
                                      animType: AnimType.BOTTOMSLIDE,
                                      title: 'Error',
                                      desc: state.error,
                                      btnOkOnPress: () {},
                                      btnOkColor: MyColors.myMainColor,
                                    ).show();
                                  }
                                }, builder: (context, state) {
                                  if (state is UserLoadingByRegisterState) {
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
                                    "${getLang(context, "register")}",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        letterSpacing: 1.25,
                                        fontWeight: FontWeight.normal),
                                  );
                                })),
                              )),
                        ),
                        const SizedBox(
                          height: 25,
                        ),

                        ///////////////////////  back to Login account   ///////////////////////
                        FadeAnimation(
                            2,
                            Center(
                              child: InkWell(
                                child: Text(
                                    "${getLang(context, "BacktoLogin")}",
                                    style:
                                        const TextStyle(color: Colors.white)),
                                onTap: () {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, '/login', (route) => false);
                                },
                              ),
                            )),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
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
}
