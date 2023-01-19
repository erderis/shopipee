import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/constants/colors/palette.dart';
import 'package:portfolio/constants/fonts/fonts.dart';
import 'package:portfolio/utils/helpers/responsive.dart';

import '../../../../../constants/assets/assets.dart';

class OrderStatus extends StatelessWidget {
  const OrderStatus({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController search = TextEditingController();
    return Container(
        color: Colors.white,
        margin: EdgeInsets.only(right: defaultPadding),
        padding: EdgeInsets.all(defaultPadding + 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order Status',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  'Overview of Latest Month',
                  style: TextStyle(color: Palette.greyColor),
                ),
              ],
            ),
            SizedBox(
              height: 36,
            ),
            OrderButtonHandler(search: search),
            if (!Responsive.isDesktop(context))
              SizedBox(
                height: 30,
              ),
            if (!Responsive.isDesktop(context)) SearchAndPrint(search: search),
            SizedBox(
              height: 30,
            ),
            OrderList(),
            SizedBox(
              height: 30,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text('Showing 1 to 20 of 20 entries'),
            //     Icon(Icons.chevron_left)
            //   ],
            // )
          ],
        ));
  }
}

class OrderList extends StatelessWidget {
  const OrderList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: DataTable2(
            columnSpacing: 12,
            horizontalMargin: 12,
            minWidth: 600,
            dataRowHeight: 70,
            dividerThickness: 0.3,
            dataTextStyle: TextStyle(
                fontFamily: AppFontStyle.poppins,
                color: Colors.black,
                fontWeight: FontWeight.w300),
            headingRowColor: MaterialStateColor.resolveWith(
              (states) => Palette.secondaryColor,
            ),
            headingTextStyle: TextStyle(color: Colors.white),
            columns: [
              DataColumn2(
                label: Text('INVOICE'),
                size: ColumnSize.L,
              ),
              DataColumn(
                label: Text('CUSTOMERS'),
              ),
              DataColumn(
                label: Text('FROM'),
              ),
              DataColumn(
                label: Text('PRICE'),
              ),
              DataColumn(
                label: Text('STATUS'),
                numeric: true,
              ),
            ],
            rows: List<DataRow>.generate(
                100,
                (index) => DataRow(cells: [
                      DataCell(Text('12366')),
                      DataCell(Text('Ervan Herdiansyah')),
                      DataCell(Text('Bandung')),
                      DataCell(Text('\$10.2')),
                      DataCell(Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                            color: Palette.primaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'Dikirim',
                          style: TextStyle(color: Colors.white),
                        ),
                      ))
                    ]))),
      ),
    );
  }
}

class OrderButtonHandler extends StatelessWidget {
  const OrderButtonHandler({
    Key? key,
    required this.search,
  }) : super(key: key);

  final TextEditingController search;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ListButtonOrder(),
        if (Responsive.isDesktop(context)) SearchAndPrint(search: search)
      ],
    );
  }
}

class ListButtonOrder extends StatelessWidget {
  const ListButtonOrder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Palette.primaryColor,
              elevation: 0,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  SvgPicture.asset(Assets.plusCircle),
                  SizedBox(
                    width: 12,
                  ),
                  Text('Add')
                ],
              ),
            )),
        SizedBox(
          width: 10,
        ),
        ItemButtonOrder(
          icon: Assets.alertCircle,
          onTap: () {},
        ),
        SizedBox(
          width: 10,
        ),
        ItemButtonOrder(
          icon: Assets.trash,
          onTap: () {},
        ),
        SizedBox(
          width: 10,
        ),
        if (!Responsive.isMobile(context))
          ItemButtonOrder(
            icon: Assets.printer,
            onTap: () {},
          ),
      ],
    );
  }
}

class SearchAndPrint extends StatelessWidget {
  const SearchAndPrint({
    Key? key,
    required this.search,
  }) : super(key: key);

  final TextEditingController search;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 150,
          height: 40,
          child: TextField(
            cursorColor: Palette.primaryColor,
            controller: search,
            style: TextStyle(
                fontFamily: AppFontStyle.poppins,
                fontSize: 12,
                fontWeight: FontWeight.normal),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 12),
              // fillColor: Color(0xffF4F6F8),
              // focusColor: Color(0xffF4F6F8),
              hintText: 'Search',
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffF4F6F8))),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffF4F6F8))),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        ItemButtonOrder(
          icon: Assets.printer,
          onTap: () {},
        ),
      ],
    );
  }
}

class ItemButtonOrder extends StatelessWidget {
  const ItemButtonOrder({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Ink(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 11.5),
            color: Color(0xffF4F6F8),
            child: SvgPicture.asset(icon),
          ),
        ),
      ),
    );
  }
}
