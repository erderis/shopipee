import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:portfolio/constants/assets/assets.dart';
import 'package:portfolio/constants/colors/palette.dart';

import '../bloc/traffic_bloc.dart';

class TrafficView extends StatelessWidget {
  const TrafficView({super.key});

  @override
  Widget build(BuildContext context) {
    final dataMap = <String, double>{
      "Facebook": 2,
      "Instagram": 4,
      "Direct Search": 6,
    };

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
            child: BlocBuilder<TrafficBloc, TrafficState>(
              builder: (context, state) {
                if (state is TrafficEmpty || state is TrafficError) {
                  return PieChartItem(
                    facebook: 1,
                    instagram: 1,
                    direct: 1,
                  );
                } else if (state is TrafficLoaded) {
                  return PieChartItem(
                    facebook: state.traffic.facebook,
                    instagram: state.traffic.facebook,
                    direct: state.traffic.facebook,
                  );
                } else {
                  return Text('Loading...');
                }
              },
            ),
          ),
          SizedBox(
            height: 80,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 350),
            child: BlocBuilder<TrafficBloc, TrafficState>(
              builder: (context, state) {
                if (state is TrafficEmpty || state is TrafficError) {
                  return ItemsTraffic(
                    facebook: 0,
                    instagram: 0,
                    direct: 0,
                  );
                } else if (state is TrafficLoaded) {
                  return ItemsTraffic(
                    facebook: state.traffic.facebook,
                    instagram: state.traffic.instagram,
                    direct: state.traffic.direct,
                  );
                } else {
                  return AspectRatio(
                      aspectRatio: 1.5, child: Lottie.asset(Assets.loading));
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class PieChartItem extends StatelessWidget {
  const PieChartItem(
      {super.key,
      required this.facebook,
      required this.instagram,
      required this.direct});

  final int facebook;
  final int instagram;
  final int direct;

  @override
  Widget build(BuildContext context) {
    return PieChart(
      dataMap: {
        "Facebook": facebook.toDouble(),
        "Instagram": instagram.toDouble(),
        "Direct Search": direct.toDouble(),
      },
      ringStrokeWidth: 30,
      legendOptions: LegendOptions(showLegends: false),
      chartValuesOptions: ChartValuesOptions(
          showChartValuesInPercentage: false, showChartValues: false),
      chartType: ChartType.ring,
      baseChartColor: Colors.grey[300]!,
      colorList: [
        Palette.mySin,
        Palette.fuchsiaBlue,
        Palette.primaryColor,
      ],
    );
  }
}

class ItemsTraffic extends StatelessWidget {
  const ItemsTraffic({
    Key? key,
    required this.facebook,
    required this.instagram,
    required this.direct,
  }) : super(key: key);

  final int facebook;
  final int instagram;
  final int direct;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ItemTraffic(
          number: facebook.toString(),
          name: 'Facebook',
          color: Palette.fuchsiaBlue,
        ),
        ItemTraffic(
          number: instagram.toString(),
          name: 'Instagram',
          color: Palette.primaryColor,
        ),
        ItemTraffic(
          number: direct.toString(),
          name: 'Direct Search',
          color: Palette.mySin,
        ),
      ],
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
