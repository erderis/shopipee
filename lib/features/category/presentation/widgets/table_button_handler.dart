import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/core/homepage/cubit/navbar_cubit.dart';
import 'package:portfolio/features/category/presentation/cubit/update_params_cubit.dart';
import '../../../../constants/assets/assets.dart';
import '../../../../constants/colors/palette.dart';
import '../../../../widgets/global_text_field.dart';
import 'global_little_button.dart';

class TableButtonHandler extends StatelessWidget {
  const TableButtonHandler({
    Key? key,
    required this.search,
    required this.formKey,
  }) : super(key: key);

  final TextEditingController search;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ListButtonTable(),
        // if (Responsive.isDesktop(context))
        Row(
          children: [
            SearchTable(
              search: search,
              formKey: formKey,
            ),
            // SizedBox(
            //   width: 10,
            // ),
            // ItemButtonOrder(
            //   icon: Assets.printer,
            //   onTap: () {},
            // ),
          ],
        )
      ],
    );
  }
}

class ListButtonTable extends StatelessWidget {
  const ListButtonTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GlobalLittleButton(
            child: Row(
              children: [
                SvgPicture.asset(Assets.plusCircle),
                SizedBox(
                  width: 10,
                ),
                Text('Add')
              ],
            ),
            onTap: () {
              RepositoryProvider.of<UpdateParamsCubit>(context).setData(null);
              RepositoryProvider.of<NavbarCubit>(context).changePage(5);
            }),
        // SizedBox(
        //   width: 10,
        // ),
        // ItemButtonOrder(
        //   icon: Assets.alertCircle,
        //   onTap: () {},
        // ),
        // SizedBox(
        //   width: 10,
        // ),
        // ItemButtonOrder(
        //   icon: Assets.trash,
        //   onTap: () {},
        // ),
        // SizedBox(
        //   width: 10,
        // ),
        // // if (!Responsive.isMobile(context))
        // ItemButtonOrder(
        //   icon: Assets.printer,
        //   onTap: () {},
        // ),
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
            color: Palette.athensGray,
            child: SvgPicture.asset(icon),
          ),
        ),
      ),
    );
  }
}

class SearchTable extends StatelessWidget {
  const SearchTable({
    Key? key,
    required this.search,
    required this.formKey,
  }) : super(key: key);

  final TextEditingController search;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 40,
      child: TextFieldGlobal(
        controller: search,
        hintText: 'Search',
        formKey: formKey,
      ),
    );
  }
}
