import 'package:portfolio/features/overview/data/models/traffic_model.dart';

abstract class TrafficLocal {
  Future<TrafficModel> getLastTraffic();
  Future<void> cacheTraffic(TrafficModel trafficToCache);
}
