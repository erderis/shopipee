import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:portfolio/core/error/exception.dart';
import 'package:portfolio/features/overview/data/datasources/traffic_remote.dart';
import 'package:portfolio/features/overview/data/models/traffic_model.dart';

void main() async {
  late TrafficRemoteImpl dataSource;
  final instance = FakeFirebaseFirestore();

  setUp(() async {
    dataSource = TrafficRemoteImpl(db: instance);
  });

  group('getTraffic', () {
    final tTraffic = TrafficModel(percent: 4, total: 150);
    test('Should return Traffic Model when the response is sucessful',
        () async {
      await instance.collection('traffic').add({
        'facebook': {'percent': 4, 'total': 150}
      });
      final result = await dataSource.getTraffic();
      expect(result, equals(tTraffic));
    });

    test('Should throw a server exception when the response data is not proper',
        () async {
      // Arrange
      await instance.collection('traffic').add({});
      // Act
      final call = dataSource.getTraffic;
      // Assert
      expect(() => call(), throwsA(const TypeMatcher<ServerException>()));
    });
    test('Should throw a server exception when the response is error',
        () async {
      // Arrange
      // setUpMockFirebaseFailure();
      // Act
      // final call = dataSource.getTraffic;
      // Assert
      // expect(() => call(), throwsA(const TypeMatcher<ServerException>()));
    });
  });
}
