import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/modules/category/views/category_view.dart';
import 'package:portfolio/modules/homepage/cubit/navbar_cubit.dart';
import 'package:portfolio/modules/homepage/views/components/traffic.dart';
import 'package:portfolio/modules/language/views/language_view.dart';
import 'package:portfolio/modules/notification/views/notif_view.dart';
import 'package:portfolio/modules/product/views/product_view.dart';
import 'package:portfolio/utils/helpers/responsive.dart';

import '../cubit/menu_drawer_cubit.dart';
import 'components/activity.dart';
import 'components/header.dart';
import 'components/order_status.dart';
import 'components/side_menu.dart';
import 'components/statistic.dart';
import 'components/statistic_item.dart';

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

class Overview extends StatelessWidget {
  const Overview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 2, child: Statistic()),
              if (Responsive.isDesktop(context)) Expanded(child: Traffic()),
            ],
          ),
          if (!Responsive.isDesktop(context)) Traffic(),
          StatisticItem(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: RecentActivity()),
              if (Responsive.isDesktop(context))
                Expanded(flex: 2, child: OrderStatus()),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          if (!Responsive.isDesktop(context)) OrderStatus(),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
