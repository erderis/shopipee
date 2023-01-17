import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors/palette.dart';
import 'package:portfolio/modules/homepage/views/components/traffic.dart';

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
    return Scaffold(
      backgroundColor: Palette.bgColor,
      body: SafeArea(
          child: Row(
        children: [
          Expanded(child: SideMenu()),
          Expanded(
              flex: 5,
              child: SafeArea(
                  child: Column(
                children: [
                  Header(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(flex: 2, child: Statistic()),
                              Expanded(
                                  child: Container(
                                      color: Colors.white,
                                      margin: EdgeInsets.only(
                                          right: defaultPadding,
                                          top: defaultPadding,
                                          bottom: defaultPadding),
                                      child: Traffic())),
                            ],
                          ),
                          StatisticItem(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: RecentActivity()),
                              Expanded(flex: 2, child: OrderStatus()),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )))
        ],
      )),
    );
  }
}
