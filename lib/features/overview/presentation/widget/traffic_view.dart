import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:portfolio/constants/colors/palette.dart';

import '../bloc/traffic_bloc.dart';

class TrafficView extends StatelessWidget {
  const TrafficView({super.key});

  @override
  Widget build(BuildContext context) {
    final dataMap = <String, double>{
      "Facebook": 200,
      "Instagram": 400,
      "Direct Search": 600,
    };

    final colorList = <Color>[
      Palette.mySin,
      Palette.fuchsiaBlue,
      Palette.primaryColor,
    ];
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(right: defaultPadding, top: defaultPadding),
      padding: EdgeInsets.all(defaultPadding + 10),
      child: BlocBuilder<TrafficBloc, TrafficState>(
        builder: (context, state) {
          return Column(
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
                      showChartValuesInPercentage: false,
                      showChartValues: false),
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
                child: BlocBuilder<TrafficBloc, TrafficState>(
                  builder: (context, state) {
                    if (state is TrafficEmpty) {
                      return Text('Empty');
                    } else if (state is TrafficError) {
                      return Text(state.message);
                    } else if (state is TrafficLoaded) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ItemTraffic(
                            number: state.traffic.facebook.toString(),
                            name: 'Facebook',
                            color: Palette.fuchsiaBlue,
                          ),
                          ItemTraffic(
                            number: '170',
                            name: 'Instagram',
                            color: Palette.primaryColor,
                          ),
                          ItemTraffic(
                            number: '600',
                            name: 'Direct Search',
                            color: Palette.mySin,
                          ),
                        ],
                      );
                    } else {
                      return Text('Loading');
                    }
                  },
                ),
              )
            ],
          );
        },
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
