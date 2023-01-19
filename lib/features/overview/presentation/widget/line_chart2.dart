import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartStatisticItem1 extends StatefulWidget {
  const LineChartStatisticItem1({super.key});

  @override
  State<LineChartStatisticItem1> createState() =>
      _LineChartStatisticItem1State();
}

class _LineChartStatisticItem1State extends State<LineChartStatisticItem1> {
  @override
  Widget build(BuildContext context) {
    return LineChart(
      mainData(),
    );
  }

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.black,
        ),
      );

  LineChartData mainData() {
    return LineChartData(
      lineTouchData: lineTouchData1,
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        show: false,
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 10,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          color: Colors.white.withOpacity(0.3),
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            color: Colors.white.withOpacity(0.3),
          ),
        ),
      ],
    );
  }
}
