import 'package:flutter/material.dart';
import 'package:hack_talk/core/utils/app_colors.dart';

class CustomTextFormFeild extends StatelessWidget {
  final String hintText;
  final TextInputType kbType;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final Function? onSubmit;
  final Function? onChange;
  final Function? onTap;
  final String? lableText;
  final bool? isObscureText;
  final validator;
  final String? value;

  const CustomTextFormFeild({
    Key? key,
    this.suffixIcon,
    required this.hintText,
    required this.kbType,
    required this.controller,
    this.onSubmit,
    this.onChange,
    this.onTap,
    required Null Function(dynamic value) onChanged,
    this.lableText,
    this.isObscureText,
    this.validator,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextFormField(
        //enableInteractiveSelection: true,
        //autovalidateMode: AutovalidateMode.onUserInteraction,
        //focusNode: FocusNode(),
        //autofocus: true,
        controller: controller,
        decoration: InputDecoration(
          label: Container(
            margin: const EdgeInsets.symmetric(horizontal: 9),
            child: Text(
              lableText ?? '',
              style:
                  const TextStyle(color: AppColors.mainBlueColor, fontSize: 16),
            ),
          ),
          labelStyle: const TextStyle(color: Colors.grey, fontSize: 16),
          suffixIcon: suffixIcon,
          isDense: false,
          fillColor: AppColors.textFormFeild,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide:
                const BorderSide(color: AppColors.mainBlueColor, width: 1.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide:
                const BorderSide(color: AppColors.textFormFeild, width: 1.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide:
                const BorderSide(color: AppColors.textFormFeild, width: 1.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(color: AppColors.textFormFeild),
          ),
          focusColor: AppColors.black,
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          hintStyle: const TextStyle(color: Colors.grey, fontFamily: "Roboto"),
        ),
        obscureText: isObscureText ?? false,
        validator: validator,

      ),
    );
  }
}
