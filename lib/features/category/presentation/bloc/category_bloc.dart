import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:portfolio/core/usecases/usecase.dart';
import 'package:portfolio/features/category/data/models/category_model.dart';
import 'package:portfolio/features/category/domain/entities/category.dart';
import 'package:portfolio/features/category/domain/usecases/add_category.dart';
import 'package:portfolio/features/category/domain/usecases/delete_category.dart';
import 'package:portfolio/features/category/domain/usecases/get_category.dart';
import 'package:portfolio/features/category/domain/usecases/update_category.dart';
import 'package:portfolio/utils/helpers/map_failure_to_message.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetCategory getCategory;
  final AddCategory addCategory;
  final UpdateCategory updateCategory;
  final DeleteCategory deleteCategory;
  CategoryBloc(
      {required this.getCategory,
      required this.addCategory,
      required this.updateCategory,
      required this.deleteCategory})
      : super(Empty()) {
    on<CategoryEvent>((event, emit) async {
      if (event is GetCategoryEvent) {
        emit(Loading());
        final failureOrListCategory = await getCategory(NoParams());
        failureOrListCategory.fold(
            (failure) => emit(Error(message: mapFailureToMessage(failure))),
            (category) => emit(Loaded(category: category)));
      }
      if (event is AddCategoryEvent) {
        emit(Loading());
        final failureOrVoid = await addCategory(
            AddCategoryParams(dataCategory: event.dataCategory));
        failureOrVoid.fold(
            (failure) => emit(Error(message: mapFailureToMessage(failure))),
            (_) => emit(Sucess()));
      }
      if (event is UpdateCategoryEvent) {
        emit(Loading());
        final failureOrVoid = await updateCategory(
            UpdateCategoryParams(dataCategory: event.dataCategory));
        failureOrVoid.fold(
            (failure) => emit(Error(message: mapFailureToMessage(failure))),
            (_) => emit(Sucess()));
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
