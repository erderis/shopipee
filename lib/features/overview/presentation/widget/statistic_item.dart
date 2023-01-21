import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/constants/colors/palette.dart';
import 'package:portfolio/core/homepage/cubit/dropdown_cubit.dart';
import 'package:portfolio/utils/helpers/responsive.dart';

import 'bar_chart.dart';
import 'line_chart2.dart';
import 'line_chart3.dart';

class StatisticItem extends StatelessWidget {
  const StatisticItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      'Daily',
      'Weekly',
      'Monthly',
      'Yearly',
    ];

    return GridView(
      padding: EdgeInsets.all(defaultPadding),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Responsive.isTablet(context)
              ? 2
              : Responsive.isMobile(context)
                  ? 1
                  : 4,
          childAspectRatio: 3 / 1.5,
          mainAxisSpacing: defaultPadding,
          crossAxisSpacing: defaultPadding),
      shrinkWrap: true,
      children: [
        ItemStatisticItem(
          colors: [Color(0xffEB4886), Color(0xffB855A4)],
          child: StatisticItem1(),
        ),
        ItemStatisticItem(
          colors: [Color(0xff875EC0), Color(0xff5547B9)],
          child: StatisticItem2(),
          isStatistic2: true,
        ),
        ItemStatisticItem(
          colors: [Color(0xff49C5F3), Color(0xff6792DA)],
          child: StatisticItem3(items: items),
        ),
        ItemStatisticItem(
          colors: [Color(0xffF7CA69), Color(0xffF5805A)],
          child: StatisticItem4(),
        ),
      ],
    );
  }
}

class ItemStatisticItem extends StatelessWidget {
  const ItemStatisticItem({
    Key? key,
    required this.colors,
    required this.child,
    this.isStatistic2 = false,
  }) : super(key: key);

  final List<Color> colors;
  final Widget child;
  final bool isStatistic2;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          isStatistic2 ? EdgeInsets.zero : EdgeInsets.all(defaultPadding + 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              colors: colors,
              begin: Alignment.topCenter,
              end: Alignment.bottomRight)),
      // margin: EdgeInsets.all(defaultPadding),
      child: child,
    );
  }
}

class StatisticItem4 extends StatelessWidget {
  const StatisticItem4({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Revenue Status',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            )),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 100, width: 100, child: BarChartSample2()),
              Column(
                children: [
                  Text(
                    '\$432',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Jan 01 - Jan 10',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class StatisticItem3 extends StatelessWidget {
  const StatisticItem3({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 100,
          child: Stack(
            children: [
              ListView(
                children: [
                  Text(
                    'Bounce Rate',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    '\$432',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SizedBox(
                  child: BlocBuilder<DropdownCubit, String>(
                    builder: (context, selectedValue) {
                      return DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,
                          hint: Row(
                            children: const [
                              Expanded(
                                child: Text(
                                  'Monthly',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black87,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          items: items
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.black87,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ))
                              .toList(),
                          value: selectedValue,
                          onChanged: (value) {
                            context.read<DropdownCubit>().changeValue(value!);
                          },
                          icon: RotatedBox(
                            quarterTurns: -1,
                            child: const Icon(
                              Icons.arrow_back_ios_new_outlined,
                            ),
                          ),
                          iconSize: 14,
                          iconEnabledColor: Colors.black87,
                          iconDisabledColor: Colors.black87,
                          buttonHeight: 40,
                          buttonWidth: 100,
                          buttonPadding:
                              const EdgeInsets.only(left: 14, right: 14),
                          buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          buttonElevation: 0,
                          itemHeight: 40,
                          itemPadding:
                              const EdgeInsets.only(left: 14, right: 14),
                          dropdownMaxHeight: 200,
                          dropdownWidth: 200,
                          dropdownPadding: null,
                          dropdownElevation: 8,
                          scrollbarRadius: const Radius.circular(40),
                          scrollbarThickness: 6,
                          scrollbarAlwaysShow: true,
                          offset: const Offset(-20, 0),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: SizedBox(
              height: 100,
              width: MediaQuery.of(context).size.width * 0.07,
              child: LineChartStatisticItem2()),
        ),
      ],
    );
  }
}

class StatisticItem2 extends StatelessWidget {
  const StatisticItem2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(defaultPadding + 10),
          child: ListView(
            children: [
              Text(
                'Page View',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                '\$432',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              child: LineChartStatisticItem1()),
        ),
      ],
    );
  }
}

class StatisticItem1 extends StatelessWidget {
  const StatisticItem1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Revenue Status',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            )),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 100, width: 100, child: BarChartSample2()),
              Column(
                children: [
                  Text(
                    '\$432',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Jan 01 - Jan 10',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
