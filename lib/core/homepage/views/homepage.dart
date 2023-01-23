import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/homepage/cubit/navbar_cubit.dart';
import 'package:portfolio/features/category/presentation/pages/add_category_view.dart';
import 'package:portfolio/features/language/views/language_view.dart';
import 'package:portfolio/features/notification/presentation/pages/notif_view.dart';
import 'package:portfolio/features/overview/presentation/pages/overview_view.dart';
import 'package:portfolio/features/product/presentation/pages/product_view.dart';
import 'package:portfolio/utils/helpers/responsive.dart';
import '../../../features/category/presentation/pages/category_view.dart';
import '../cubit/menu_drawer_cubit.dart';
import 'components/header.dart';
import 'components/side_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget NavPage(int index) {
      switch (index) {
        case 0:
          return Overview();
        case 1:
          return ProductView();
        case 2:
          return CategoryView();
        case 3:
          return NotifView();
        case 4:
          return LanguageView();
        case 5:
          return AddCategoryView();
        default:
          return Overview();
      }
    }

    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 250, 251, 1),
      key: RepositoryProvider.of<MenuDrawerCubit>(context).scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
          child: Row(
        children: [
          if (Responsive.isDesktop(context)) Expanded(child: SideMenu()),
          Expanded(
              flex: 5,
              child: SafeArea(
                  child: Column(
                children: [
                  Header(),
                  BlocBuilder<NavbarCubit, int>(
                    builder: (context, currentIndexPage) {
                      return Expanded(
                        child: NavPage(currentIndexPage),
                      );
                    },
                  ),
                ],
              )))
        ],
      )),
    );
  }
}
