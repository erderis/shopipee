import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/features/category/data/models/category_model.dart';
import 'package:portfolio/features/category/presentation/bloc/category_bloc.dart';
import 'package:portfolio/features/category/presentation/cubit/image_validator_cubit.dart';
import 'package:portfolio/utils/helpers/random_string.dart';
import 'package:portfolio/utils/helpers/responsive.dart';
import 'package:portfolio/widgets/global_button.dart';
import 'package:portfolio/widgets/global_text_field.dart';

import '../../../../constants/assets/assets.dart';
import '../../../../constants/colors/palette.dart';
import '../../../../core/homepage/cubit/navbar_cubit.dart';
import '../../../../utils/helpers/show_toast.dart';
import '../cubit/category_image_picker_cubit.dart';

class AddCategoryView extends StatelessWidget {
  const AddCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController categoryNameController =
        TextEditingController();
    return Container(
      width: double.infinity,
      color: Colors.white,
      margin: EdgeInsets.all(defaultPadding),
      padding: EdgeInsets.all(defaultPadding + 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: (Responsive.isMobile(context)
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start),
          children: [
            Text(
              'Tambah Kategori',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 30,
            ),
            Text('Foto Kategori'),
            SizedBox(
              height: 10,
            ),
            BlocBuilder<CategoryImagePickerCubit, String>(
              builder: (context, imagePath) {
                return imagePath.isNotEmpty
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: SizedBox(
                            width: 100,
                            height: 100,
                            child: kIsWeb
                                ? Image.network(imagePath)
                                : Image.file(File(imagePath))),
                      )
                    : InkWell(
                        onTap: (() =>
                            RepositoryProvider.of<CategoryImagePickerCubit>(
                                    context)
                                .pickImage()),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Palette.divider)),
                          child: Center(
                            child: Icon(Icons.add),
                          ),
                        ),
                      );
              },
            ),
            BlocBuilder<ImageValidatorCubit, bool>(
              builder: (context, visible) {
                return Visibility(
                  visible: visible,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Divider(
                        color: Color.fromARGB(255, 192, 42, 31),
                      ),
                      Text(
                        'Please add an image',
                        style: TextStyle(
                            color: Color.fromARGB(255, 192, 42, 31),
                            fontSize: 12),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(
              height: 30,
            ),
            Align(
                alignment: Alignment.centerLeft, child: Text('Nama Kategori')),
            SizedBox(
              height: 10,
            ),
            TextFieldGlobal(
              controller: categoryNameController,
              hintText: 'Sweater',
              formKey: _formKey,
            ),
            SizedBox(
              height: 30,
            ),
            BlocConsumer<CategoryBloc, CategoryState>(
                listener: (context, state) {
              if (state is Sucess) {
                RepositoryProvider.of<NavbarCubit>(context).changePage(2);
                context.read<CategoryBloc>().add(GetCategoryEvent());
              } else {
                showToast("Add Category is failed");
              }
            }, builder: (context, state) {
              if (state is Loading)
                return SizedBox(
                    width: 50, height: 50, child: Lottie.asset(Assets.loading));
              else
                return GlobalButton(
                    title: 'Tambah Kategori',
                    onTap: () {
                      final imagePath =
                          RepositoryProvider.of<CategoryImagePickerCubit>(
                                  context)
                              .getPath();
                      RepositoryProvider.of<ImageValidatorCubit>(context)
                          .showErrorImage(imagePath);
                      if (_formKey.currentState!.validate() &&
                          imagePath.isNotEmpty) {
                        CategoryModel categoryModel = CategoryModel(
                            id: getRandomString(10),
                            image: imagePath,
                            name: categoryNameController.text,
                            createdAt: DateTime.now(),
                            updatedAt: DateTime.now());
                        context
                            .read<CategoryBloc>()
                            .add(AddCategoryEvent(dataCategory: categoryModel));
                      }
                    });
            })
          ],
        ),
      ),
    );
  }
}
