import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/constants/assets/assets.dart';
import 'package:portfolio/constants/colors/palette.dart';
import 'package:portfolio/utils/helpers/responsive.dart';
import 'package:portfolio/widgets/app_divider.dart';
import 'package:portfolio/widgets/line_chart.dart';

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
                Column(
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
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 30),
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
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 30),
                        ),
                        Text(
                          'Current Month Sales',
                          style: TextStyle(color: Palette.greyColor),
                        )
                      ],
                    ),
                    SizedBox(height: 25),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Palette.primaryColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 20)),
                        child: Text('Last Month Summary'))
                  ],
                ),
                if (Responsive.isDesktop(context))
                  SizedBox(
                    width: 50,
                  ),
                if (Responsive.isDesktop(context))
                  Expanded(
                      child: SizedBox(height: 320, child: LineChartSample1())),
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text(
                //       'DAILY',
                //       style: TextStyle(color: Palette.greyColor2),
                //     ),
                //     SizedBox(
                //       width: 20,
                //     ),
                //     Text(
                //       'WEEKLY',
                //       style: TextStyle(color: Palette.greyColor2),
                //     ),
                //     SizedBox(
                //       width: 20,
                //     ),
                //     Text(
                //       'MONTHLY',
                //       style: TextStyle(color: Colors.black),
                //     ),
                //     SizedBox(
                //       width: 20,
                //     ),
                //     Text(
                //       'YEARLY',
                //       style: TextStyle(color: Palette.greyColor2),
                //     ),
                //   ],
                // ),
              ],
            ),
            if (!Responsive.isDesktop(context))
              SizedBox(
                height: 50,
              ),
            if (!Responsive.isDesktop(context))
              SizedBox(height: 320, child: LineChartSample1()),
            SizedBox(
              height: 50,
            ),
            AppDivider(),
            SizedBox(
              height: 30,
            ),
            GridView(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: Responsive.isDesktop(context)
                      ? 4
                      : Responsive.isTablet(context)
                          ? 2
                          : 1,
                  childAspectRatio: 4),
              shrinkWrap: true,
              children: [
                Row(
                  children: [
                    if (!Responsive.isDesktop(context))
                      SizedBox(
                        height: 40,
                        child: VerticalDivider(
                          color: Palette.divider,
                          width: 0.5,
                        ),
                      ),
                    if (!Responsive.isDesktop(context))
                      SizedBox(
                        width: 20,
                      ),
                    ItemStatistic(
                      asset: Assets.wallet,
                      title: 'Wallet Balance',
                      subtitle: '\$4,4512.89',
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 40,
                      child: VerticalDivider(
                        color: Palette.divider,
                        width: 0.5,
                      ),
                    ),
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
                Row(
                  children: [
                    SizedBox(
                      height: 40,
                      child: VerticalDivider(
                        color: Palette.divider,
                        width: 0.5,
                      ),
                    ),
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
                Row(
                  children: [
                    SizedBox(
                      height: 40,
                      child: VerticalDivider(
                        color: Palette.divider,
                        width: 0.5,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ItemStatistic(
                      asset: Assets.earnings,
                      title: 'Earnings',
                      subtitle: '\$76,212.32',
                    ),
                  ],
                )
              ],
            ),
          ],
        ));
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
