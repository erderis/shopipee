import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/constants/colors/palette.dart';
import 'package:portfolio/utils/helpers/responsive.dart';
import 'package:timeline_tile/timeline_tile.dart';

class RecentActivity extends StatelessWidget {
  const RecentActivity({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataTask = [
      {
        "time": "42 Min Ago",
        "icon": "task",
        "title": "Task Updated",
        "subtitle": "Updated a Task",
        "user": "Niko",
      },
      {
        "time": "4 Hours ago",
        "icon": "deal",
        "title": "Deal Added",
        "subtitle": "Created a Deal",
        "user": "Tasya",
      },
      {
        "time": "1 Day Ago",
        "icon": "publish",
        "title": "Article Published",
        "subtitle": "Published an Article",
        "user": "Rika",
      },
      {
        "time": "2 Day Ago",
        "icon": "comment",
        "title": "Replyed Comment",
        "subtitle": "Added a Comment",
        "user": "Andy",
      },
      {
        "time": "5 Day Ago",
        "icon": "publish",
        "title": "Article Published",
        "subtitle": "Published an Article",
        "user": "Minda",
      },
    ];
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
              height: 30,
            ),
            AspectRatio(
              aspectRatio: Responsive.isMobile(context)
                  ? 1.5
                  : Responsive.isTablet(context)
                      ? 1.7
                      : 0.94,
              child: ListView.builder(
                  itemCount: dataTask.length,
                  itemBuilder: (_, index) {
                    return _buildTimelineTile(
                      indicator: _IconIndicator(
                        icon: dataTask[index]['icon']!,
                      ),
                      isFirst: index == 0,
                      isLast: index == dataTask.length - 1,
                      hour: dataTask[index]['time']!,
                      title: dataTask[index]['title']!,
                      user: dataTask[index]['user']!,
                      subtitle: dataTask[index]['subtitle']!,
                    );
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
    required String user,
    bool isFirst = false,
    bool isLast = false,
  }) {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0.3,
      beforeLineStyle:
          LineStyle(color: Palette.timelineLine.withOpacity(0.2), thickness: 3),
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
            const EdgeInsets.only(left: 16, right: 10, top: 30, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 2),
            RichText(
                text: TextSpan(
                    text: '',
                    style: TextStyle(color: Palette.greyColor, fontSize: 12),
                    children: <TextSpan>[
                  TextSpan(
                    text: user + " ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  TextSpan(text: subtitle),
                ]))
          ],
        ),
      ),
    );
  }
}

class _IconIndicator extends StatelessWidget {
  const _IconIndicator({
    required this.icon,
  });

  final String icon;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/icons/$icon.svg');
  }
}
