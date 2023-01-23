import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors/palette.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            backgroundColor: Palette.primaryColor,
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20)),
        child: Text(title));
  }
}
