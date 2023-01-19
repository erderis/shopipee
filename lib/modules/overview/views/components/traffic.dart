import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:portfolio/constants/colors/palette.dart';

class Traffic extends StatelessWidget {
  const Traffic({super.key});

  @override
  Widget build(BuildContext context) {
    final dataMap = <String, double>{
      "Facebook": 2,
      "Instagram": 4,
      "Direct Search": 6,
    };

    final colorList = <Color>[
      Color(0xffFFB92D),
      Color(0xff875EC0),
      Color(0xffEB4886),
    ];
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(right: defaultPadding, top: defaultPadding),
      padding: EdgeInsets.all(defaultPadding + 10),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Traffic',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          AspectRatio(
            aspectRatio: 2,
            child: PieChart(
              dataMap: dataMap,
              ringStrokeWidth: 30,
              legendOptions: LegendOptions(showLegends: false),
              chartValuesOptions: ChartValuesOptions(
                  showChartValuesInPercentage: false, showChartValues: false),
              chartType: ChartType.ring,
              baseChartColor: Colors.grey[300]!,
              colorList: colorList,
            ),
          ),
          SizedBox(
            height: 80,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 350),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ItemTraffic(
                  number: '140',
                  name: 'Facebook',
                  color: Color(0xff875EC0),
                ),
                ItemTraffic(
                  number: '170',
                  name: 'Instagram',
                  color: Color(0xffEB4886),
                ),
                ItemTraffic(
                  number: '600',
                  name: 'Direct Search',
                  color: Color(0xffFFB92D),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ItemTraffic extends StatelessWidget {
  const ItemTraffic({
    Key? key,
    required this.number,
    required this.name,
    required this.color,
  }) : super(key: key);

  final String number;
  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
            SizedBox(
              width: 5,
            ),
            Text(name),
          ],
        )
      ],
    );
  }
}
