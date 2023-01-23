import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors/palette.dart';
import 'package:portfolio/features/category/presentation/widgets/table_button_handler.dart';

import '../../../../widgets/global_table.dart';

class OrderStatus extends StatelessWidget {
  const OrderStatus({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController search = TextEditingController();
    final _formKey = GlobalKey<FormState>();

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
            SearchTable(
              search: search,
              formKey: _formKey,
            ),
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
            child: GlobalTable(
                columns: [
                  DataColumn2(
                    label: Text('INVOICE'),
                    // size: ColumnSize.L,
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
                    // numeric: true,
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            decoration: BoxDecoration(
                                color: Palette.primaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              'Dikirim',
                              style: TextStyle(color: Colors.white),
                            ),
                          ))
                        ])))));
  }
}
