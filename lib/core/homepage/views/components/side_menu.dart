import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:portfolio/constants/assets/assets.dart';
import 'package:portfolio/constants/colors/palette.dart';
import 'package:portfolio/core/homepage/cubit/navbar_cubit.dart';
import 'package:portfolio/core/homepage/cubit/switcher_cubit.dart';
import 'package:portfolio/utils/helpers/responsive.dart';
import 'package:portfolio/widgets/app_divider.dart';

import '../../cubit/menu_drawer_cubit.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void changeMenu(int index) {
      if (!Responsive.isDesktop(context)) {
        RepositoryProvider.of<MenuDrawerCubit>(context).controlMenu();
      }
      context.read<NavbarCubit>().changePage(index);
    }

    return Drawer(
      elevation: 0,
      backgroundColor: Colors.white,
      child: Stack(
        children: [
          BlocBuilder<NavbarCubit, int>(
            builder: (context, currentPage) {
              return ListView(
                children: [
                  Image.asset(
                    Assets.logo,
                    height: 56,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DrawerMenu(
                    assetName: Assets.home,
                    title: 'Overview',
                    onTap: () => changeMenu(0),
                    isSelected: currentPage == 0,
                  ),
                  DrawerMenu(
                    assetName: Assets.package,
                    title: 'Produk',
                    onTap: () => changeMenu(1),
                    isSelected: currentPage == 1,
                  ),
                  DrawerMenu(
                    assetName: Assets.grid,
                    title: 'Kategori',
                    onTap: () => changeMenu(2),
                    isSelected: currentPage == 2,
                  ),
                  DrawerMenu(
                    assetName: Assets.bell,
                    title: 'Notifikasi',
                    onTap: () => changeMenu(3),
                    isSelected: currentPage == 3,
                  ),
                  AppDivider(),
                  DrawerMenu(
                    assetName: Assets.globe,
                    title: 'Bahasa',
                    onTap: () => changeMenu(4),
                    isSelected: currentPage == 4,
                  ),
                  // Spacer(),
                  // SizedBox(
                  //   height: 20,
                  // )
                ],
              );
            },
          ),
          // Positioned(bottom: 20, left: 0, right: 0, child: ThemeChange()),
        ],
      ),
    );
  }
}

// class ThemeChange extends StatelessWidget {
//   const ThemeChange({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<SwitcherCubit, bool>(
//       builder: (context, state) {
//         return FlutterSwitch(
//           width: 125.0,
//           height: 55.0,
//           valueFontSize: 16.0,
//           toggleSize: 45.0,
//           value: state,
//           activeText: 'Light',
//           inactiveText: 'Dark',
//           activeColor: Colors.black,
//           inactiveColor: Palette.primaryColor,
//           activeToggleColor: Colors.white,
//           borderRadius: 30.0,
//           padding: 8.0,
//           showOnOff: true,
//           onToggle: (val) {
//             if (val)
//               context.read<SwitcherCubit>().dark();
//             else
//               context.read<SwitcherCubit>().light();
//           },
//         );
//       },
//     );
//   }
// }

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
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: isSelected ? Palette.secondaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(10)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: onTap,
            child: ListTile(
              // onTap: onTap,
              selected: isSelected,
              selectedColor: Colors.white,
              horizontalTitleGap: 0.0,
              leading: SvgPicture.asset(
                assetName,
                color: isSelected ? Colors.white : Colors.black54,
              ),
              title: Text(title),
            ),
          ),
        ),
      ),
    );
  }
}
