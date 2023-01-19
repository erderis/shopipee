import 'package:dartz/dartz.dart';
import 'package:portfolio/core/error/failures.dart';
import 'package:portfolio/core/usecases/usecase.dart';
import 'package:portfolio/features/overview/domain/entities/traffic.dart';
import 'package:portfolio/features/overview/domain/repositories/traffic_repository.dart';

class GetTraffic extends UseCase<Traffic, NoParams> {
  final TrafficRepository repository;

  GetTraffic(this.repository);

  Future<Either<Failure, Traffic>> call(NoParams noParams) async {
    return await repository.getTraffic();
  }
}
