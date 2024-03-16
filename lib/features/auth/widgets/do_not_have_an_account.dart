import 'package:flutter/material.dart';
import 'package:hack_talk/core/utils/app_colors.dart';

class Richtxt extends StatelessWidget {
  const Richtxt({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        text: 'Don\'t have an account? ',
        style: TextStyle(color: Colors.grey),
        children: <TextSpan>[
          TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: AppColors.mainBlueColor,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
