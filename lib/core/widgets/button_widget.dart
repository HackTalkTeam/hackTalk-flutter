import 'package:flutter/material.dart';
import 'package:hack_talk/core/utils/app_colors.dart';
import 'package:hack_talk/core/widgets/text_widget.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(this.text,{Key? key, this.onPressed }) : super(key: key);
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.all(16),
      child: ElevatedButton(
          onPressed: onPressed??(){},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.textButtonColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))
        ),
          child: TextWidget(text),
      ),
    );
  }
}
