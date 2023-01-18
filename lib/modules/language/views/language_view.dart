import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/constants/assets/assets.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Lottie.asset(Assets.underConstruction),
    );
  }
}
