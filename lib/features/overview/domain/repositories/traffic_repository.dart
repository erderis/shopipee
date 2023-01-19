import 'package:dartz/dartz.dart';
import 'package:portfolio/core/error/failures.dart';
import 'package:portfolio/features/overview/domain/entities/traffic.dart';

abstract class TrafficRepository {
  Future<Either<Failure, Traffic>> getTraffic();
}
