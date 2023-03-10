import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/features/category/domain/entities/category.dart';
import 'package:portfolio/widgets/global_table.dart';

import '../../../../constants/assets/assets.dart';
import '../../../../constants/colors/palette.dart';
import '../../../../core/homepage/cubit/navbar_cubit.dart';
import '../bloc/category_bloc.dart';
import '../cubit/update_params_cubit.dart';
import '../widgets/global_little_button.dart';
import '../widgets/table_button_handler.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController search = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return Container(
        color: Colors.white,
        margin: EdgeInsets.all(defaultPadding),
        padding: EdgeInsets.all(defaultPadding + 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'List of Product Category',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 30,
            ),
            TableButtonHandler(
              search: search,
              formKey: _formKey,
            ),
            // if (!Responsive.isDesktop(context))
            //   SizedBox(
            //     height: 30,
            //   ),
            // if (!Responsive.isDesktop(context))
            //   SearchTable(
            //     search: search,
            //     formKey: _formKey,
            //   ),
            SizedBox(
              height: 30,
            ),
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is Loading)
                  return AspectRatio(
                      aspectRatio: 5, child: Lottie.asset(Assets.loading));
                else if (state is Loaded) {
                  if (state.listCategory.isNotEmpty) {
                    return CategoryList(
                      listCategory: state.listCategory,
                    );
                  } else {
                    return Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text('Data is Empty'),
                      ),
                    );
                  }
                } else if (state is Error)
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
                  label: Text('Image'),
                ),
                DataColumn(
                  label: Text('Category Name'),
                ),
                DataColumn(
                  label: Text('Action'),
                  // numeric: true,
                ),
              ],
              rows: List<DataRow>.generate(
                  listCategory.length,
                  (index) => DataRow(
                          // selected: true,
                          // onSelectChanged: (value) {},
                          cells: [
                            DataCell(SizedBox(
                              width: 50,
                              height: 50,
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
                                  onTap: () {
                                    RepositoryProvider.of<UpdateParamsCubit>(
                                            context)
                                        .setData(listCategory[index]);
                                    RepositoryProvider.of<NavbarCubit>(context)
                                        .changePage(5);
                                  },
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
