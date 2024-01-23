import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key, required this.isBigger}) : super(key: key);
  final bool isBigger;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.image_outlined,
      color: Colors.black,
      size: isBigger ? 80 : 35,
    );
  }
}
