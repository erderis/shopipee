import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:portfolio/core/usecases/usecase.dart';
import 'package:portfolio/features/overview/domain/entities/traffic.dart';
import 'package:portfolio/features/overview/domain/repositories/traffic_repository.dart';
import 'package:portfolio/features/overview/domain/usecases/get_traffic.dart';

import 'get_traffic_test.mocks.dart';

@GenerateMocks([TrafficRepository])
void main() {
  late GetTraffic usecase;
  late MockTrafficRepository mockTrafficRepository;

  setUp(() {
    mockTrafficRepository = MockTrafficRepository();
    usecase = GetTraffic(mockTrafficRepository);
  });

  final tTraffic = Traffic(facebook: 150, instagram: 300, direct: 450);

  test('should get trafic from the repository', () async {
    when(mockTrafficRepository.getTraffic())
        .thenAnswer((_) async => Right(tTraffic));
    final result = await usecase(NoParams());
    expect(result, Right(tTraffic));
    verify(mockTrafficRepository.getTraffic());
    verifyNoMoreInteractions(mockTrafficRepository);
  });
}
