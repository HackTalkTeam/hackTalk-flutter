import 'package:flutter/material.dart';

class Social_icon extends StatelessWidget {
  const Social_icon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {},
            icon: Image.asset('assets/images/Google (1).png')),
        IconButton(
            onPressed: () {},
            icon: Image.asset('assets/images/Facebook.png'))
      ],
    );
  }
}
