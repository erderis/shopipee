part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class Empty extends CategoryState {}

class Loading extends CategoryState {}

//for get
class Loaded extends CategoryState {
  final List<Category> category;

  Loaded({required this.category});
}

//for add, update, delete
class Sucess extends CategoryState {}

class Error extends CategoryState {
  final String message;

  Error({required this.message});
}
