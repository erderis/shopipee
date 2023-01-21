import 'package:portfolio/features/overview/domain/entities/traffic.dart';

class TrafficModel extends Traffic {
  TrafficModel(
      {required super.facebook,
      required super.instagram,
      required super.direct});

  factory TrafficModel.fromJson(Map<String, dynamic> json) {
    return TrafficModel(
        facebook: (json['facebook'] as num).toInt(),
        instagram: (json['instagram'] as num).toInt(),
        direct: (json['direct'] as num).toInt());
  }

  Map<String, dynamic> toJson() {
    return {"facebook": facebook, "instagram": instagram, "direct": direct};
  }
}
