import 'package:flutter/material.dart';

import '../constants/colors/palette.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Palette.divider,
      height: 0.5,
    );
  }
}

class AppVerticalDivider extends StatelessWidget {
  const AppVerticalDivider({super.key, this.height = 40});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: VerticalDivider(
        color: Palette.divider,
        width: 0.5,
      ),
    );
  }
}
