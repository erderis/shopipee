import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/features/category/domain/entities/category.dart';

class CategoryModel extends Category {
  CategoryModel(
      {required super.id,
      required super.image,
      required super.name,
      required super.createdAt,
      required super.updatedAt});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
        id: json['id'],
        image: json['image'],
        name: json['name'],
        createdAt: (json['createdAt'] as Timestamp).toDate(),
        updatedAt: (json['updatedAt'] as Timestamp).toDate());
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "image": image,
      "name": name,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
    };
  }
}
