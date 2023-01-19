import 'package:portfolio/features/overview/data/models/traffic_model.dart';

abstract class TrafficRemote {
  Future<TrafficModel> getTraffic();
}
