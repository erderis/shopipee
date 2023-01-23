import 'package:flutter/material.dart';
import 'package:portfolio/widgets/global_table.dart';

import '../../../../constants/colors/palette.dart';
import '../../../../utils/helpers/responsive.dart';
import '../../../overview/presentation/widget/order_status.dart';
import '../widgets/global_little_button.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController search = TextEditingController();
    return Container(
        color: Colors.white,
        margin: EdgeInsets.all(defaultPadding),
        padding: EdgeInsets.all(defaultPadding + 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Daftar Kategori',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                // Text(
                //   '',
                //   style: TextStyle(color: Palette.greyColor),
                // ),
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
            CategoryList(),
            SizedBox(
              height: 30,
            ),
          ],
        ));
  }
}

class CategoryList extends StatelessWidget {
  const CategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GlobalTable(
              columns: [
                DataColumn(
                  label: Text('Foto'),
                ),
                DataColumn(
                  label: Text('Nama Kategori'),
                ),
                DataColumn(
                  label: Text('Aksi'),
                  // numeric: true,
                ),
              ],
              rows: List<DataRow>.generate(
                  5,
                  (index) => DataRow(
                          // selected: true,
                          onSelectChanged: (value) {},
                          cells: [
                            DataCell(Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: defaultPadding / 2),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )),
                            DataCell(Text('Sweater')),
                            DataCell(Row(
                              children: [
                                GlobalLittleButton(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                // GlobalLittleButton(
                                //   onTap: () {},
                                //   secondary: true,
                                //   child: Icon(Icons.delete,
                                //       color: Palette.primaryColor),
                                // ),
                              ],
                            ))
                          ])))),
    );
  }
}
