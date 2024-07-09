import 'package:flutter/material.dart';
import 'package:hack_talk/core/utils/app_colors.dart';
import 'package:hack_talk/core/utils/app_routes.dart';
import 'package:hack_talk/core/widgets/text_widget.dart';
import 'package:lottie/lottie.dart';

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
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            '       Cancel       ',
            style: TextStyle(color: AppColors.mainBlueColor),
          ),
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: AppColors.mainBlueColor,),
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.mainBlueColor,
          ),
          onPressed: () {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              AppRoutes.pop(context, result: true);
              //AppRoutes.routeTo(context, LoginScreen());
            });
          },
          child: const Text(
            "     logout     ",
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

class AlertDialog2Widget extends StatelessWidget {
  const AlertDialog2Widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: AppColors.homeButtonColor,
      content: Lottie.asset("assets/animations/loading.json",
      fit: BoxFit.contain, height: 100,width: 100
              ),
      actions: [
        TextWidget(
          "The result will appear within a few minutes, please wait",
          maxLines: 9,
          textAlign: TextAlign.center,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.grey[600],
        ),
        const SizedBox(height: 55),
      ],
      contentPadding:
      const EdgeInsets.only(bottom: 22, left: 22, right: 22, top: 66),
      backgroundColor: AppColors.homeButtonColor,
      shadowColor: AppColors.mainBlueColor,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(38)),
    );
  }
}

class AlertDialogRateWidget extends StatelessWidget {
  const AlertDialogRateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: AppColors.homeButtonColor,
      content: Image.asset("assets/images/rate_done.png"),
      actions: [
        TextWidget(
          "Thank you for your feedback! This helps us understand Your needs and customize our services Accordingly",
          maxLines: 9,
          textAlign: TextAlign.center,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.grey[600],
        ),
        const SizedBox(height: 33),
      ],
      contentPadding:
      const EdgeInsets.only(bottom: 0, left: 66, right: 66, top: 0),
      backgroundColor: AppColors.homeButtonColor,
      shadowColor: AppColors.mainBlueColor,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(38)),
    );
  }
}