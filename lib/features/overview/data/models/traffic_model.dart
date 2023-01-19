import 'package:portfolio/features/overview/domain/entities/traffic.dart';

class TrafficModel extends Traffic {
  TrafficModel({required super.percent, required super.total});

  factory TrafficModel.fromJson(Map<String, dynamic> json) {
    return TrafficModel(
        percent: (json['percent'] as num).toInt(),
        total: (json['total'] as num).toInt());
  }

  Map<String, dynamic> toJson() {
    return {"percent": percent, "total": total};
  }
}
