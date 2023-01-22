import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:portfolio/core/error/exception.dart';
import 'package:portfolio/core/error/failures.dart';
import 'package:portfolio/core/network/network_info.dart';
import 'package:portfolio/features/overview/data/datasources/traffic_local.dart';
import 'package:portfolio/features/overview/data/datasources/traffic_remote.dart';
import 'package:portfolio/features/overview/data/models/traffic_model.dart';
import 'package:portfolio/features/overview/data/repositories/traffic_repository_impl.dart';

import 'traffic_repository_impl_test.mocks.dart';

@GenerateMocks([TrafficLocal, NetworkInfo])
@GenerateNiceMocks([MockSpec<TrafficRemote>()])
void main() {
  late TrafficRepositoryImpl repository;
  late MockTrafficLocal mockTrafficLocal;
  late MockTrafficRemote mockTrafficRemote;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockTrafficRemote = MockTrafficRemote();
    mockTrafficLocal = MockTrafficLocal();
    mockNetworkInfo = MockNetworkInfo();
    repository = TrafficRepositoryImpl(
        remoteDataSource: mockTrafficRemote,
        localDataSource: mockTrafficLocal,
        networkInfo: mockNetworkInfo);
  });

  group('getTraffic', () {
    final tTrafficModel =
        TrafficModel(facebook: 150, instagram: 300, direct: 450);
    // final Traffic tTraffic = tTrafficModel;

    test('Should check if the device is online', () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      repository.getTraffic();
      verify(mockNetworkInfo.isConnected);
    });
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      test(
          'Should return remote data when the call to remote data source is succesfull',
          () async {
        when(mockTrafficRemote.getTraffic())
            .thenAnswer((_) async => tTrafficModel);
        final result = await repository.getTraffic();
        expect(result, equals(Right(tTrafficModel)));
      });

      test(
          'Should cache the data locally when the call to remote data source is successful',
          () async {
        when(mockTrafficRemote.getTraffic())
            .thenAnswer((_) async => tTrafficModel);
        await repository.getTraffic();
        verify(mockTrafficRemote.getTraffic());
        verify(mockTrafficLocal.cacheTraffic(tTrafficModel));
      });

      test(
          'Should return serverfailure when the call to remote data source is unsuccesful',
          () async {
        when(mockTrafficRemote.getTraffic()).thenThrow(ServerException());
        final result = await repository.getTraffic();
        verify(mockTrafficRemote.getTraffic());
        verifyZeroInteractions(mockTrafficLocal);
        expect(result, equals(Left(ServerFailure())));
      });
    });

    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });
      test('Should return last locally data when the cached data is present',
          () async {
        //arrange
        when(mockTrafficLocal.getLastTraffic())
            .thenAnswer((_) async => tTrafficModel);
        //act
        final result = await repository.getTraffic();
        //assert
        verifyZeroInteractions(mockTrafficRemote);
        verify(mockTrafficLocal.getLastTraffic());
        expect(result, equals(Right(tTrafficModel)));
      });
      test('Should throw cache failure when the cached data is not present',
          () async {
        //arrange
        when(mockTrafficLocal.getLastTraffic()).thenThrow(CacheException());
        //act
        final result = await repository.getTraffic();
        //assert
        verifyZeroInteractions(mockTrafficRemote);
        verify(mockTrafficLocal.getLastTraffic());
        expect(result, equals(Left(CacheFailure())));
      });
    });
  });
}
