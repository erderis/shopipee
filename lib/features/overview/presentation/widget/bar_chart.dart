import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartSample2 extends StatefulWidget {
  const BarChartSample2({super.key});

  @override
  State<StatefulWidget> createState() => BarChartSample2State();
}

class BarChartSample2State extends State<BarChartSample2> {
  final Color leftBarColor = Colors.white;
  final double width = 7;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 5, 12);
    final barGroup2 = makeGroupData(1, 16, 12);
    final barGroup3 = makeGroupData(2, 18, 5);
    final barGroup4 = makeGroupData(3, 20, 16);
    final barGroup5 = makeGroupData(4, 17, 6);
    final barGroup6 = makeGroupData(5, 19, 1.5);
    final barGroup7 = makeGroupData(6, 10, 1.5);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        maxY: 25,
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.grey,
            getTooltipItem: (a, b, c, d) => null,
          ),
          touchCallback: (FlTouchEvent event, response) {
            if (response == null || response.spot == null) {
              setState(() {
                touchedGroupIndex = -1;
                showingBarGroups = List.of(rawBarGroups);
              });
              return;
            }

            touchedGroupIndex = response.spot!.touchedBarGroupIndex;

            setState(() {
              if (!event.isInterestedForInteractions) {
                touchedGroupIndex = -1;
                showingBarGroups = List.of(rawBarGroups);
                return;
              }
              showingBarGroups = List.of(rawBarGroups);
              if (touchedGroupIndex != -1) {
                var sum = 0.0;
                for (final rod in showingBarGroups[touchedGroupIndex].barRods) {
                  sum += rod.toY;
                }
                final avg =
                    sum / showingBarGroups[touchedGroupIndex].barRods.length;

                showingBarGroups[touchedGroupIndex] =
                    showingBarGroups[touchedGroupIndex].copyWith(
                  barRods:
                      showingBarGroups[touchedGroupIndex].barRods.map((rod) {
                    return rod.copyWith(toY: avg);
                  }).toList(),
                );
              }
            });
          },
        ),
        titlesData: FlTitlesData(
          show: false,
        ),
        borderData: FlBorderData(
          show: false,
        ),
        barGroups: showingBarGroups,
        gridData: FlGridData(show: false),
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: leftBarColor,
          width: width,
        ),
      ],
    );
  }
}
