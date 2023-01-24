import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/usecases/usecase.dart';
import 'package:portfolio/features/category/data/models/category_model.dart';
import 'package:portfolio/features/category/domain/entities/category.dart';
import 'package:portfolio/features/category/domain/usecases/add_category.dart';
import 'package:portfolio/features/category/domain/usecases/delete_category.dart';
import 'package:portfolio/features/category/domain/usecases/get_category.dart';
import 'package:portfolio/features/category/domain/usecases/update_category.dart';
import 'package:portfolio/features/category/domain/usecases/upload_category_image.dart';
import 'package:portfolio/utils/helpers/map_failure_to_message.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetCategory getCategory;
  final AddCategory addCategory;
  final UpdateCategory updateCategory;
  final DeleteCategory deleteCategory;
  final UploadCategoryImage uploadCategoryImage;

  CategoryBloc({
    required this.getCategory,
    required this.addCategory,
    required this.updateCategory,
    required this.deleteCategory,
    required this.uploadCategoryImage,
  }) : super(Empty()) {
    on<CategoryEvent>((event, emit) async {
      if (event is GetCategoryEvent) {
        emit(Loading());
        final failureOrListCategory = await getCategory(NoParams());
        failureOrListCategory.fold(
            (failure) => emit(Error(message: mapFailureToMessage(failure))),
            (listCategory) {
          emit(Loaded(listCategory: listCategory));
        });
      }
      if (event is AddCategoryEvent) {
        emit(Loading());
        late String imageURL;
        final failureOrImageURL = await uploadCategoryImage(
            UploadCategoriImageParams(filePath: event.dataCategory.image));
        failureOrImageURL.fold(
            (failure) => emit(Error(message: mapFailureToMessage(failure))),
            (newImageURL) {
          imageURL = newImageURL;
        });
        final data = event.dataCategory;
        CategoryModel newData = CategoryModel(
            id: data.id,
            image: imageURL,
            name: data.name,
            createdAt: data.createdAt,
            updatedAt: data.updatedAt);
        final failureOrVoid =
            await addCategory(AddCategoryParams(dataCategory: newData));
        failureOrVoid.fold((failure) {
          emit(Error(message: mapFailureToMessage(failure)));
        }, (_) {
          emit(Sucess());
        });
      }
      if (event is UpdateCategoryEvent) {
        emit(Loading());
        if (event.withNewImage) {
          late String imageURL;

          final failureOrImageURL = await uploadCategoryImage(
              UploadCategoriImageParams(filePath: event.dataCategory.image));
          failureOrImageURL.fold(
              (failure) => emit(Error(message: mapFailureToMessage(failure))),
              (newImageURL) {
            imageURL = newImageURL;
          });
          final data = event.dataCategory;
          CategoryModel newData = CategoryModel(
              id: data.id,
              image: imageURL,
              name: data.name,
              createdAt: data.createdAt,
              updatedAt: data.updatedAt);
          final failureOrVoid =
              await addCategory(AddCategoryParams(dataCategory: newData));
          failureOrVoid.fold((failure) {
            emit(Error(message: mapFailureToMessage(failure)));
          }, (_) {
            emit(Sucess());
          });
        } else {
          final failureOrVoid = await updateCategory(
              UpdateCategoryParams(dataCategory: event.dataCategory));
          failureOrVoid.fold(
              (failure) => emit(Error(message: mapFailureToMessage(failure))),
              (_) => emit(Sucess()));
        }
      }
      if (event is DeleteCategoryEvent) {
        emit(Loading());
        final failureOrVoid =
            await deleteCategory(DeleteCategoryParams(id: event.id));
        failureOrVoid.fold(
            (failure) => emit(Error(message: mapFailureToMessage(failure))),
            (_) => emit(Sucess()));
      }
    });
  }
}
