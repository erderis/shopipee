import 'package:flutter/material.dart';
import 'package:portfolio/utils/helpers/responsive.dart';

import 'components/activity.dart';
import 'components/order_status.dart';
import 'components/statistic.dart';
import 'components/statistic_item.dart';
import 'components/traffic.dart';

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
