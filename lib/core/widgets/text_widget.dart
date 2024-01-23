import 'package:flutter/material.dart';
import 'package:hack_talk/core/utils/app_colors.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
    this.text, {
    Key? key,
    this.color,
    this.overflow,
    this.textDirection,
    this.textAlign,
    this.fontSize,
    this.fontWeight,
    this.shadows,
    this.maxLines,
  }) : super(key: key);
  final String text;
  final Color? color;
  final TextOverflow? overflow;
  final TextDirection? textDirection;
  final TextAlign? textAlign;
  final double? fontSize;
  final FontWeight? fontWeight;
  final List<Shadow>? shadows;
  final int? maxLines;

  const TextWidget.bigTitle(
    this.text, {
    Key? key,
    this.color = AppColors.bigTitleColor,
    this.overflow,
    this.textDirection,
    this.textAlign,
    this.fontSize = 32,
    this.fontWeight = FontWeight.w700,
    this.shadows,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow ?? TextOverflow.ellipsis,
      textDirection: textDirection,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        shadows: shadows,
      ),
    );
  }
}
