import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors/palette.dart';
import 'package:portfolio/constants/fonts/fonts.dart';

class GlobalTable extends StatelessWidget {
  const GlobalTable({
    Key? key,
    required this.columns,
    required this.rows,
  }) : super(key: key);

  final List<DataColumn> columns;
  final List<DataRow> rows;

  @override
  Widget build(BuildContext context) {
    return DataTable2(
        showCheckboxColumn: true,
        onSelectAll: (value) {},
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
        columns: columns,
        rows: rows);
  }
}
