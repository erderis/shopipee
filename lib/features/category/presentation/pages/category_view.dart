import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/constants/assets/assets.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Lottie.asset(Assets.underConstruction),
    );
  }
}
