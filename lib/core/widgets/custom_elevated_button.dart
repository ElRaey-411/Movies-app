import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/colors_manager.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    this.icon,
    required this.onPress,
    this.color,
    this.textColor,
  });
  final String text;
  final Widget? icon;
  final VoidCallback onPress;
  final Color? color;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? ColorsManager.yellow,),
      onPressed: onPress,
      icon: icon,
      label: Text(text,style: TextStyle(color: textColor ?? ColorsManager.black)),
    );
  }
}
