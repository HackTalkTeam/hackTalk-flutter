import 'package:flutter/material.dart';
import 'package:hack_talk/core/utils/app_colors.dart';
import 'package:hack_talk/core/widgets/text_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget(
      {Key? key, required this.text, required this.icon, this.onPressed})
      : super(key: key);
  final String text;
  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          IconButton(
              onPressed: onPressed,
              icon: Icon(
                icon,
                color: AppColors.bigTitleColor,
                size: 24,
              )),
          Column(
            children: [
              TextWidget(text,
                  color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
            ],
          ),
        ],
      ),
    );
  }
}
