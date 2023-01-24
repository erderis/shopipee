import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:portfolio/features/category/domain/entities/category.dart';

part 'update_params_state.dart';

class UpdateParamsCubit extends Cubit<UpdateParamsState> {
  UpdateParamsCubit() : super(UpdateParamsInitial());

  late Category? category;

  void setData(Category? newCategory) {
    category = newCategory;
  }

  Category? get getData => category;
}
