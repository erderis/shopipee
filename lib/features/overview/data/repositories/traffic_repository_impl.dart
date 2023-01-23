import 'package:portfolio/core/error/exception.dart';
import 'package:portfolio/core/network/network_info.dart';
import 'package:portfolio/features/overview/data/datasources/traffic_local.dart';
import 'package:portfolio/features/overview/data/datasources/traffic_remote.dart';
import 'package:portfolio/features/overview/domain/entities/traffic.dart';
import 'package:portfolio/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:portfolio/features/overview/domain/repositories/traffic_repository.dart';

class TrafficRepositoryImpl implements TrafficRepository {
  final TrafficRemote remote;
  final TrafficLocal local;
  final NetworkInfo networkInfo;

  TrafficRepositoryImpl(
      {required this.remote, required this.local, required this.networkInfo});
  @override
  Future<Either<Failure, Traffic>> getTraffic() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTraffic = await remote.getTraffic();
        local.cacheTraffic(remoteTraffic);

        return Right(remoteTraffic);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTraffic = await local.getLastTraffic();
        return Right(localTraffic);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
