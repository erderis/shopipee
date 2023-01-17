import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors/palette.dart';
import 'package:timeline_tile/timeline_tile.dart';

class RecentActivity extends StatelessWidget {
  const RecentActivity({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.all(defaultPadding + 10),
        margin: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Recent Activities',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 65,
            ),
            AspectRatio(
              aspectRatio: 1,
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (_, index) {
                    return _buildTimelineTile(
                        indicator: const _IconIndicator(
                          iconData: Icons.edit,
                          size: 20,
                        ),
                        isFirst: index == 0,
                        isLast: index == 2,
                        hour: '32 Min Ago',
                        title: 'Task Updated',
                        subtitle: 'A beautiful afternoon to take a walk');
                  }),
            )
          ],
        ));
  }

  TimelineTile _buildTimelineTile({
    required _IconIndicator indicator,
    required String hour,
    required String title,
    required String subtitle,
    bool isFirst = false,
    bool isLast = false,
  }) {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0.3,
      beforeLineStyle: LineStyle(color: Color(0xffCECECE), thickness: 1),
      indicatorStyle:
          IndicatorStyle(width: 46, height: 46, indicator: indicator),
      isFirst: isFirst,
      isLast: isLast,
      startChild: Center(
        child: Container(
          // alignment: const Alignment(0.0, -0.50),
          child: Text(
            hour,
            style: TextStyle(color: Palette.greyColor, fontSize: 12),
          ),
        ),
      ),
      endChild: Padding(
        padding:
            const EdgeInsets.only(left: 16, right: 10, top: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: TextStyle(color: Palette.greyColor, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

class _IconIndicator extends StatelessWidget {
  const _IconIndicator({
    required this.iconData,
    required this.size,
  });

  final IconData iconData;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Palette.primaryColor,
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 30,
              width: 30,
              child: Icon(
                iconData,
                size: size,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
