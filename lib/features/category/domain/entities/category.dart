import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String image;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  Category(
      {required this.image,
      required this.name,
      required this.createdAt,
      required this.updatedAt});

  @override
  List<Object?> get props => [image, name, createdAt, updatedAt];
}
