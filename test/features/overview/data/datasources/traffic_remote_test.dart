import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
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
    final tTraffic = TrafficModel(facebook: 150, instagram: 300, direct: 450);
    test('Should return Traffic Model when the response is sucessful',
        () async {
      final jsonMap = {'facebook': 150, 'instagram': 300, 'direct': 450};
      await instance.collection(TRAFFIC_COLLECTION_NAME).add(jsonMap);
      final result = await dataSource.getTraffic();
      expect(result, equals(tTraffic));
    });

    test('Should throw a server exception when the response data is not proper',
        () async {
      // Arrange
      await instance.collection(TRAFFIC_COLLECTION_NAME).add({});
      // Act
      final call = dataSource.getTraffic;
      // Assert
      expect(() => call(), throwsA(const TypeMatcher<ServerException>()));
    });

    //what is firestore exception class?
    // test('Should throw a server exception when the response is error',
    //     () async {
    //   // Arrange
    // when(instance.collection(CATEGORY_COLLECTION_NAME).add(jsonMap))
    //     .thenThrow(FirebaseException); is that true???
    //   // Act
    //   final call = dataSource.getTraffic;
    //   // Assert
    //   expect(() => call(), throwsA(const TypeMatcher<ServerException>()));
    // });
  });
}
