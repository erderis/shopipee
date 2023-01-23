import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String id;
  final String image;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  Category(
      {required this.id,
      required this.image,
      required this.name,
      required this.createdAt,
      required this.updatedAt});

  @override
  List<Object?> get props => [id, image, name, createdAt, updatedAt];
}
