import 'package:flutter/material.dart';

import '../../../../constants/colors/palette.dart';

class GlobalLittleButton extends StatelessWidget {
  const GlobalLittleButton({
    Key? key,
    required this.child,
    required this.onTap,
    this.secondary = false,
  }) : super(key: key);

  final Widget child;
  final VoidCallback onTap;
  final bool secondary;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: secondary ? Colors.white : Palette.primaryColor,
        side: BorderSide(
            color: secondary ? Palette.primaryColor : Colors.transparent),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      ),
      child: child,
    );
  }
}
