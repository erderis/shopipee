import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:portfolio/constants/assets/assets.dart';
import 'package:portfolio/constants/colors/palette.dart';
import 'package:portfolio/modules/homepage/cubit/switcher_cubit.dart';
import 'package:portfolio/widgets/app_divider.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Image.asset(
            Assets.logo,
          ),
          SizedBox(
            height: 20,
          ),
          DrawerMenu(
            assetName: Assets.home,
            title: 'Overview',
            onTap: () {},
            isSelected: true,
          ),
          DrawerMenu(
            assetName: Assets.package,
            title: 'Produk',
            onTap: () {},
          ),
          DrawerMenu(
            assetName: Assets.grid,
            title: 'Kategori',
            onTap: () {},
          ),
          DrawerMenu(
            assetName: Assets.bell,
            title: 'Notifikasi',
            onTap: () {},
          ),
          AppDivider(),
          DrawerMenu(
            assetName: Assets.globe,
            title: 'Bahasa',
            onTap: () {},
          ),
          Spacer(),
          BlocBuilder<SwitcherCubit, bool>(
            builder: (context, state) {
              return FlutterSwitch(
                width: 125.0,
                height: 55.0,
                valueFontSize: 16.0,
                toggleSize: 45.0,
                value: state,
                activeText: 'Light',
                inactiveText: 'Dark',
                activeColor: Colors.black,
                inactiveColor: Palette.primaryColor,
                activeToggleColor: Colors.white,
                borderRadius: 30.0,
                padding: 8.0,
                showOnOff: true,
                onToggle: (val) {
                  if (val)
                    context.read<SwitcherCubit>().dark();
                  else
                    context.read<SwitcherCubit>().light();
                },
              );
            },
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    Key? key,
    required this.onTap,
    required this.assetName,
    required this.title,
    this.isSelected = false,
  }) : super(key: key);

  final VoidCallback onTap;
  final String assetName;
  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: isSelected ? Palette.secondaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        onTap: onTap,
        selected: isSelected,
        selectedColor: Colors.white,
        horizontalTitleGap: 0.0,
        leading: SvgPicture.asset(
          assetName,
          color: isSelected ? Colors.white : Colors.black54,
        ),
        title: Text(title),
      ),
    );
  }
}
