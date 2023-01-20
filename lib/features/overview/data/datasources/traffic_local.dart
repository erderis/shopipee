import 'dart:convert';

import 'package:portfolio/core/error/exception.dart';
import 'package:portfolio/features/overview/data/models/traffic_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class TrafficLocal {
  Future<TrafficModel> getLastTraffic();
  Future<void> cacheTraffic(TrafficModel trafficToCache);
}

const CACHED_TRAFFIC = 'CACHED_TRAFFIC';

class TrafficLocalImpl implements TrafficLocal {
  final SharedPreferences sharedPreferences;

  TrafficLocalImpl({required this.sharedPreferences});
  @override
  Future<void> cacheTraffic(TrafficModel trafficToCache) {
    return sharedPreferences.setString(
        CACHED_TRAFFIC, json.encode(trafficToCache.toJson()));
  }

  @override
  Future<TrafficModel> getLastTraffic() {
    final jsonString = sharedPreferences.getString(CACHED_TRAFFIC);
    if (jsonString != null) {
      return Future.value(TrafficModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }
}
