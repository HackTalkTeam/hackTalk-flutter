import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hack_talk/core/utils/app_assets.dart';
import 'package:hack_talk/core/utils/app_colors.dart';
import 'package:hack_talk/core/widgets/text_widget.dart';

class HomeButtonWidget extends StatelessWidget {
  const HomeButtonWidget({Key? key, required this.text, this.onPressed})
      : super(key: key);
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed ?? () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.homeButtonColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18))),
        child: TextWidget(text, color: AppColors.textButtonBlueColor),
      ),
    );
  }
}

class SmallHomeButtonWidget extends StatelessWidget {
  const SmallHomeButtonWidget(this.image, {Key? key, this.onPressed})
      : super(key: key);
  final String image;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed ?? () {},
      child: Container(
        width: 45,
        height: 40,
        decoration: BoxDecoration(
            color: AppColors.homeButtonColor,
            borderRadius: BorderRadius.circular(18)),
        padding: const EdgeInsets.all(10),
        child: SvgPicture.asset(image.getSvgAsset),
      ),
    );
  }
}
