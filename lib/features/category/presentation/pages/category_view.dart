import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/features/category/domain/entities/category.dart';
import 'package:portfolio/widgets/global_table.dart';

import '../../../../constants/assets/assets.dart';
import '../../../../constants/colors/palette.dart';
import '../../../../utils/helpers/responsive.dart';
import '../../../overview/presentation/widget/order_status.dart';
import '../bloc/category_bloc.dart';
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
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is Loading)
                  return AspectRatio(
                      aspectRatio: 1.5, child: Lottie.asset(Assets.loading));
                else if (state is Loaded)
                  return CategoryList(listCategory: state.listCategory);
                else if (state is Error)
                  return Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(state.message),
                    ),
                  );
                else
                  return Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('Data is Empty'),
                    ),
                  );
              },
            ),
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
    required this.listCategory,
  }) : super(key: key);

  final List<Category> listCategory;

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
                  listCategory.length,
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
                                  listCategory[index].image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )),
                            DataCell(Text(
                              listCategory[index].name,
                            )),
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
