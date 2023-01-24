import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/constants/assets/assets.dart';
import 'package:portfolio/constants/colors/palette.dart';
import 'package:portfolio/utils/helpers/responsive.dart';
import 'package:portfolio/utils/helpers/show_toast.dart';
import 'package:portfolio/widgets/app_divider.dart';

import '../../../../widgets/global_button.dart';
import 'line_chart.dart';

class Statistic extends StatelessWidget {
  const Statistic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        margin: EdgeInsets.only(
            left: defaultPadding, right: defaultPadding, top: defaultPadding),
        padding: EdgeInsets.all(defaultPadding + 10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OverviewData(),
                if (Responsive.isDesktop(context))
                  SizedBox(
                    width: 50,
                  ),
                if (Responsive.isDesktop(context))
                  Expanded(
                      child:
                          SizedBox(height: 320, child: LineChartStatistic1())),
              ],
            ),
            if (!Responsive.isDesktop(context))
              SizedBox(
                height: 50,
              ),
            if (!Responsive.isDesktop(context))
              SizedBox(height: 320, child: LineChartStatistic1()),
            SizedBox(
              height: 50,
            ),
            AppDivider(),
            SizedBox(
              height: 30,
            ),
            OverviewBottom(),
            SizedBox(
              height: 20,
            ),
            if (Responsive.isMobile(context)) OverviewBottomAddMobile(),
          ],
        ));
  }
}

class OverviewBottomAddMobile extends StatelessWidget {
  const OverviewBottomAddMobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: Responsive.isMobile(context)
          ? MainAxisAlignment.spaceEvenly
          : MainAxisAlignment.spaceBetween,
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: 140),
          child: Row(
            children: [
              ItemStatistic(
                asset: Assets.estimatedSales,
                title: 'Estimates Sales',
                subtitle: '\$2345,7',
              ),
            ],
          ),
        ),
        Container(
          constraints: BoxConstraints(maxWidth: 140),
          child: Row(
            children: [
              ItemStatistic(
                asset: Assets.earnings,
                title: 'Earnings',
                subtitle: '\$76,212.32',
              ),
            ],
          ),
        )
      ],
    );
  }
}

class OverviewBottom extends StatelessWidget {
  const OverviewBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: Responsive.isMobile(context)
          ? MainAxisAlignment.spaceEvenly
          : MainAxisAlignment.spaceBetween,
      children: [
        Container(
          constraints: BoxConstraints(
              maxWidth: Responsive.isMobile(context) ? 140 : double.infinity),
          child: Row(
            children: [
              ItemStatistic(
                asset: Assets.wallet,
                title: 'Wallet Balance',
                subtitle: '\$4,4512.89',
              ),
            ],
          ),
        ),
        Container(
          constraints: BoxConstraints(
              maxWidth: Responsive.isMobile(context) ? 140 : double.infinity),
          child: Row(
            children: [
              if (!Responsive.isMobile(context)) AppVerticalDivider(),
              if (!Responsive.isMobile(context))
                SizedBox(
                  width: 20,
                ),
              ItemStatistic(
                asset: Assets.refferal,
                title: 'Refferal Earnings',
                subtitle: '\$1234,56',
              ),
            ],
          ),
        ),
        if (!Responsive.isMobile(context))
          Container(
            constraints: BoxConstraints(
                maxWidth: Responsive.isMobile(context) ? 140 : double.infinity),
            child: Row(
              children: [
                AppVerticalDivider(),
                SizedBox(
                  width: 20,
                ),
                ItemStatistic(
                  asset: Assets.estimatedSales,
                  title: 'Estimates Sales',
                  subtitle: '\$2345,7',
                ),
              ],
            ),
          ),
        if (!Responsive.isMobile(context))
          Container(
            constraints: BoxConstraints(
                maxWidth: Responsive.isMobile(context) ? 140 : double.infinity),
            child: Row(
              children: [
                AppVerticalDivider(),
                SizedBox(
                  width: 20,
                ),
                ItemStatistic(
                  asset: Assets.earnings,
                  title: 'Earnings',
                  subtitle: '\$76,212.32',
                ),
              ],
            ),
          )
      ],
    );
  }
}

class OverviewData extends StatelessWidget {
  const OverviewData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dashboard',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Text(
              'Overview of Latest Month',
              style: TextStyle(color: Palette.greyColor),
            )
          ],
        ),
        SizedBox(height: 25),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "\$5456.22",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
            ),
            Text(
              'Current Month Earnings',
              style: TextStyle(color: Palette.greyColor),
            )
          ],
        ),
        SizedBox(height: 25),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "130",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
            ),
            Text(
              'Current Month Sales',
              style: TextStyle(color: Palette.greyColor),
            )
          ],
        ),
        SizedBox(height: 25),
        GlobalButton(
          onTap: () {
            showToast('This Feature Under Development');
          },
          title: 'Last Month Summary',
        )
      ],
    );
  }
}

class ItemStatistic extends StatelessWidget {
  const ItemStatistic({
    Key? key,
    required this.asset,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String asset;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(asset),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Palette.greyColor, fontSize: 12),
            ),
            SizedBox(
              height: 5,
            ),
            Text(subtitle)
          ],
        )
      ],
    );
  }
}
