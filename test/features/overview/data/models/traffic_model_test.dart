import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/features/overview/data/models/traffic_model.dart';
import 'package:portfolio/features/overview/domain/entities/traffic.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tTrafficModel =
      TrafficModel(facebook: 150, instagram: 300, direct: 450);

  test('should be a subclass of Traffic entity', () {
    expect(tTrafficModel, isA<Traffic>());
  });

  group('fromJson', () {
    test('Should return a valid model when the Json number is an integer',
        () async {
      final Map<String, dynamic> jsonMap = json.decode(fixture('traffic.json'));
      print(jsonMap);
      final result = TrafficModel.fromJson(jsonMap);
      expect(result, equals(tTrafficModel));
    });

    test(
        "Should return a valid model when the JSON number is regarded as a double",
        () async {
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('traffic_double.json'));
      final result = TrafficModel.fromJson(jsonMap);
      expect(result, equals(tTrafficModel));
    });
  });

  group('toJson', () {
    test('Should return a JSON map containing the proper data', () async {
      final result = tTrafficModel.toJson();

      final expectedJsonMap = {
        "facebook": 150,
        "instagram": 300,
        "direct": 450
      };
      expect(result, equals(expectedJsonMap));
    });
  });
}
