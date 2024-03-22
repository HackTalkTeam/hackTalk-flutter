import 'package:flutter/material.dart';
import 'package:hack_talk/core/utils/app_colors.dart';
import 'package:hack_talk/core/utils/app_routes.dart';
import 'package:hack_talk/core/widgets/text_widget.dart';

import 'home_screen.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const TextWidget(
        "Are you sure you want to exit HackTalk",
        maxLines: 9,
        textAlign: TextAlign.center,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.mainBlueColor,
          ),
          onPressed: () {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              AppRoutes.pop(context);
            });
          },
          child: const Text(
            "cancel",
            style: TextStyle(color: Colors.white),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.mainBlueColor,
          ),
          onPressed: () {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              AppRoutes.pop(context, result: true);
            });
          },
          child: const Text(
            "logout",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
      contentPadding:
          const EdgeInsets.only(bottom: 33, left: 22, right: 22, top: 66),
      backgroundColor: Colors.white,
      shadowColor: AppColors.mainBlueColor,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(38)),
    );
  }
}
