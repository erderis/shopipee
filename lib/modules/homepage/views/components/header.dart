import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/constants/assets/assets.dart';
import 'package:portfolio/constants/colors/palette.dart';
import 'package:portfolio/modules/homepage/cubit/menu_drawer_cubit.dart';

import '../../../../../utils/helpers/responsive.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [MenuButton(), NotifAndAvatar()],
      ),
    );
  }
}

class NotifAndAvatar extends StatelessWidget {
  const NotifAndAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child:
                    InkWell(onTap: () {}, child: SvgPicture.asset(Assets.bell)),
              ),
              Positioned(
                right: 5,
                child: Container(
                  // alignment: Alignment(1, -0.5),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Palette.primaryColor, shape: BoxShape.circle),
                  child: Text(
                    '2',
                    style: TextStyle(color: Colors.white, fontSize: 9),
                  ),
                ),
              )
            ],
          ),
        ),
        CircleAvatar(
          backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
        )
      ],
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !Responsive.isDesktop(context),
      child: Material(
          color: Colors.transparent,
          child: InkWell(
              onTap: () {
                RepositoryProvider.of<MenuDrawerCubit>(context).controlMenu();
              },
              child: SvgPicture.asset(Assets.menuDashboard))),
    );
  }
}
