import 'package:flutter/material.dart';
import 'package:hack_talk/core/widgets/text_widget.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget(
      {Key? key, this.onPressed, required this.icon, this.text, this.actions})
      : super(key: key);
  final void Function()? onPressed;
  final IconData icon;
  final String? text;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(100);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.black),
      ),
      title: text == null ? null : TextWidget(text ?? ''),
      actions: [
        ...(actions ?? []),
        const SizedBox(
          width: 12,
        ),
      ],
    );
  }
}
