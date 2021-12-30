import 'package:flutter/material.dart';

class IconButtonEx extends StatelessWidget {
  final Color? color;
  final Widget icon;
  final double? size;
  final VoidCallback? onPressed;
  const IconButtonEx({
    Key? key,
    this.color,
    required this.icon,
    this.size,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: color,
      ),
      child: IconButton(
        icon: icon,
        onPressed: onPressed,
        iconSize: size ?? 28.0,
      ),
    );
  }
}
