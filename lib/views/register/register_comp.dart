import 'package:fas7ny/constants/my_colors.dart';
import 'package:flutter/material.dart';

class RegisterCompanent {
  /////////////////////////// Validate Funcation ///////////////////////////////////
  String? emailValidateFunc(value) {
    RegExp regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regex.hasMatch(value) || value == null || value.isEmpty) {
      return 'Username Required and more than 6 Characters';
    } else {
      return null;
    }
  }

  String? nameValidateFunc(value) {
    if (value.toString().length < 3 || value == null || value.isEmpty) {
      return 'Must be more then 3 character';
    } else {
      return null;
    }
  }

  String? userNameValidateFunc(value) {
    final RegExp regex =
        RegExp(r"^(?=.{6,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$");
    if (!regex.hasMatch(value) || value == null || value.isEmpty) {
      return 'Correct UserName is Required ';
    } else {
      return null;
    }
  }

  String? passwordValidateFunc(value) {
    if (value == null || value.isEmpty || value.length < 5) {
      return 'Must be more then 6 character';
    }
    return null;
  }

  String? phoneValidateFunc(value) {
    if (value == null || value.isEmpty || value.length < 10) {
      return 'Must be more then 10 character';
    }
    return null;
  }
}

/////////////////////////// Input Text Field ///////////////////////////////////
class InputFieldWidget extends StatelessWidget {
  final String? Function(String?) validateFunc;
  final TextEditingController textController;
  final String hintTxt;
  final iconType;
  final textInputType;
  final bool isPassword;

  const InputFieldWidget(
      {Key? key,
      required this.validateFunc,
      required this.textController,
      required this.hintTxt,
      this.isPassword = false,
      this.textInputType,
      this.iconType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: TextFormField(
          cursorColor: MyColors.myMainColor,
          cursorHeight: 25,
          maxLines: 1,
          style: const TextStyle(
            fontSize: 20,
            color: MyColors.myblack,
          ),
          keyboardType: textInputType,
          obscureText: isPassword,
          validator: validateFunc,
          controller: textController,
          decoration: InputDecoration(
              icon: Icon(
                iconType,
              ),
              errorStyle: const TextStyle(fontSize: 10, color: Colors.red),
              border: InputBorder.none,
              hintText: hintTxt,
              hintStyle: TextStyle(color: Colors.grey[400])),
        ),
      ),
    );
  }
}
