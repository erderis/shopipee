import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:portfolio/core/error/exception.dart';
import 'package:portfolio/features/overview/data/datasources/traffic_local.dart';
import 'package:portfolio/features/overview/data/models/traffic_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'traffic_local_test.mocks.dart';

@GenerateNiceMocks([MockSpec<SharedPreferences>()])
void main() {
  late TrafficLocalImpl dataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = TrafficLocalImpl(sharedPreferences: mockSharedPreferences);
  });

  group('getLastTraffic', () {
    final tTrafficModel =
        TrafficModel.fromJson(json.decode(fixture('traffic_cached.json')));

    test(
        'Should return Traffic from SharedPreferences when there is one in the cache',
        () async {
      when(mockSharedPreferences.getString(any))
          .thenReturn((fixture('traffic_cached.json')));
      final result = await dataSource.getLastTraffic();
      verify(mockSharedPreferences.getString(CACHED_TRAFFIC));
      expect(result, equals(tTrafficModel));
    });

    test('Should throw a CacheException when there is no a cached value', () {
      when(mockSharedPreferences.getString(any)).thenReturn(null);
      final call = dataSource.getLastTraffic;

      expect(() => call(), throwsA(TypeMatcher<CacheException>()));
    });
  });

  group('CacheTraffic', () {
    final tTrafficModel = TrafficModel(percent: 4, total: 150);

    test('Should call sharedPreferences to cache the data', () {
      dataSource.cacheTraffic(tTrafficModel);
      final expectedJsonString = json.encode(tTrafficModel.toJson());
      verify(
          mockSharedPreferences.setString(CACHED_TRAFFIC, expectedJsonString));
    });
  });
}
