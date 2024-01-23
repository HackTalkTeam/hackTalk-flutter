import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hack_talk/core/utils/app_assets.dart';
import 'package:hack_talk/core/utils/app_colors.dart';
import 'package:hack_talk/core/widgets/text_widget.dart';

class HomeContainerWidget extends StatelessWidget {
  const HomeContainerWidget(
      {Key? key, required this.image, required this.text, this.onTap})
      : super(key: key);
  final String image;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Container(
        height: 210,
        width: MediaQuery.of(context).size.width - 64,
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: AppColors.cvButtonColor),
            boxShadow: [
              BoxShadow(
                  blurRadius: 4,
                  color: AppColors.cvButtonColor.withOpacity(0.5),
                  offset: const Offset(0, 2))
            ]),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(
                text,
                maxLines: 6,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              SvgPicture.asset(image.getSvgAsset),
            ],
          ),
        ),
      ),
    );
  }
}
