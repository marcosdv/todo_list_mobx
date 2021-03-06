import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {

  const CustomIconButton({Key? key, this.radius = 0, this.iconData, this.onTap}) : super(key: key);

  final double radius;
  final IconData? iconData;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child : Material(
        color: Colors.transparent,
        child : InkWell(
          child : Icon(iconData),
          onTap: onTap,
        ),
      ),
    );
  }
}