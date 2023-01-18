import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/constants/colors/palette.dart';
import 'package:portfolio/modules/homepage/cubit/dropdown_cubit.dart';
import 'package:portfolio/utils/helpers/responsive.dart';
import 'package:portfolio/widgets/bar_chart.dart';
import 'package:portfolio/widgets/line_chart3.dart';

import '../../../../widgets/line_chart2.dart';

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
      shrinkWrap: true,
      // padding: EdgeInsets.zero,
      padding: EdgeInsets.all(defaultPadding),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: defaultPadding,
          mainAxisSpacing: defaultPadding,
          crossAxisCount: Responsive.isDesktop(context)
              ? 4
              : Responsive.isTablet(context)
                  ? 2
                  : 1,
          childAspectRatio: Responsive.isMobile(context) ? 3 / 2 : 3 / 1.4),
      children: [
        Expanded(
            child: Container(
          padding: EdgeInsets.all(defaultPadding + 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                  colors: [Color(0xffEB4886), Color(0xffB855A4)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight)),
          // margin: EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Revenue Status',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  )),
              Spacer(),
              Row(
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
              )
            ],
          ),
        )),
        Expanded(
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        colors: [Color(0xff875EC0), Color(0xff5547B9)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomRight)),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(defaultPadding + 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                          child: LineChartSample2()),
                    ),
                  ],
                ))),
        Expanded(
            child: Container(
                padding: EdgeInsets.all(defaultPadding + 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        colors: [Color(0xff49C5F3), Color(0xff6792DA)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomRight)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                        BlocBuilder<DropdownCubit, String>(
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
                                  context
                                      .read<DropdownCubit>()
                                      .changeValue(value!);
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
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: SizedBox(
                          height: 100, width: 150, child: LineChartSample3()),
                    ),
                  ],
                ))),
        Expanded(
            child: Container(
          padding: EdgeInsets.all(defaultPadding + 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                  colors: [Color(0xffF7CA69), Color(0xffF5805A)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight)),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Revenue Status',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  )),
              Spacer(),
              Row(
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
              )
            ],
          ),
        )),
      ],
    );
  }
}
