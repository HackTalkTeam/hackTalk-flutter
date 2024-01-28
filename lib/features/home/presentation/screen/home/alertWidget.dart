import 'package:flutter/material.dart';
import 'package:hack_talk/core/utils/app_colors.dart';
import 'package:hack_talk/core/utils/app_routes.dart';
import 'package:hack_talk/core/widgets/text_widget.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({
    super.key,
    required this.text,
  });

  final String text;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Padding(
          padding: const EdgeInsets.only(left: 200.0),
          child: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                AppRoutes.pop(context);
              });
            },
          )),
      content: TextWidget(
        text,
        maxLines: 9,
        textAlign: TextAlign.center,
      ),
      contentPadding:
          const EdgeInsets.only(bottom: 88, left: 22, right: 22, top: 20),
      backgroundColor: AppColors.homeButtonColor,
      shadowColor: AppColors.textButtonBlueColor,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
    );
  }
}
