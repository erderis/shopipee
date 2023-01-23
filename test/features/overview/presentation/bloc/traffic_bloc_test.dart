import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:portfolio/core/error/failures.dart';
import 'package:portfolio/core/usecases/usecase.dart';
import 'package:portfolio/features/overview/domain/entities/traffic.dart';
import 'package:portfolio/features/overview/domain/usecases/get_traffic.dart';
import 'package:portfolio/features/overview/presentation/bloc/traffic_bloc.dart';

import 'traffic_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetTraffic>()])
void main() {
  late TrafficBloc trafficBloc;
  late MockGetTraffic mockGetTraffic;

  setUp(() {
    mockGetTraffic = MockGetTraffic();
    trafficBloc = TrafficBloc(getTraffic: mockGetTraffic);
  });

  final tTraffic = Traffic(facebook: 150, instagram: 300, direct: 450);

  test('initial Should be Empty', () {
    //assert
    expect(trafficBloc.initialState, equals(TrafficEmpty()));
  });

  blocTest<TrafficBloc, TrafficState>(
      'Should get data from the traffic use case',
      build: () => trafficBloc,
      setUp: () =>
          when(mockGetTraffic(any)).thenAnswer((_) async => Right(tTraffic)),
      act: (bloc) => bloc.add(GetTrafficEvent()),
      verify: (bloc) => mockGetTraffic(NoParams()));

  blocTest<TrafficBloc, TrafficState>(
      'Should emit [Loading, Loaded] when data is gotten sucessfully',
      build: () => trafficBloc,
      setUp: () =>
          when(mockGetTraffic(any)).thenAnswer((_) async => Right(tTraffic)),
      act: (bloc) => bloc.add(GetTrafficEvent()),
      expect: () => <TrafficState>[
            TrafficLoading(),
            TrafficLoaded(traffic: tTraffic),
          ]);
  blocTest<TrafficBloc, TrafficState>(
      'Should emit [Loading, Loaded] when data is gotten sucessfully',
      build: () => trafficBloc,
      setUp: () =>
          when(mockGetTraffic(any)).thenAnswer((_) async => Right(tTraffic)),
      act: (bloc) => bloc.add(GetTrafficEvent()),
      expect: () => <TrafficState>[
            TrafficLoading(),
            TrafficLoaded(traffic: tTraffic),
          ]);
  blocTest<TrafficBloc, TrafficState>(
      'Should emit [Loading, Error] when getting data fails',
      build: () => trafficBloc,
      setUp: () => when(mockGetTraffic(any))
          .thenAnswer((_) async => Left(ServerFailure())),
      act: (bloc) => bloc.add(GetTrafficEvent()),
      expect: () => <TrafficState>[
            TrafficLoading(),
            TrafficError(message: SERVER_FAILURE_MESSAGE)
          ]);
  blocTest<TrafficBloc, TrafficState>(
      'Should emit [Loading, Error]  with a proper message for the error when getting data fails',
      build: () => trafficBloc,
      setUp: () => when(mockGetTraffic(any))
          .thenAnswer((_) async => Left(CacheFailure())),
      act: (bloc) => bloc.add(GetTrafficEvent()),
      expect: () => <TrafficState>[
            TrafficLoading(),
            TrafficError(message: CACHE_FAILURE_MESSAGE)
          ]);
}
