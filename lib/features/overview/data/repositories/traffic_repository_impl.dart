import 'package:portfolio/core/error/exception.dart';
import 'package:portfolio/core/network/network_info.dart';
import 'package:portfolio/features/overview/data/datasources/traffic_local.dart';
import 'package:portfolio/features/overview/data/datasources/traffic_remote.dart';
import 'package:portfolio/features/overview/domain/entities/traffic.dart';
import 'package:portfolio/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:portfolio/features/overview/domain/repositories/traffic_repository.dart';

class TrafficRepositoryImpl implements TrafficRepository {
  final TrafficRemote remoteDataSource;
  final TrafficLocal localDataSource;
  final NetworkInfo networkInfo;

  TrafficRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});
  @override
  Future<Either<Failure, Traffic>> getTraffic() async {
    networkInfo.isConnected;
    try {
      print('repo called');
      final remoteTraffic = await remoteDataSource.getTraffic();
      localDataSource.cacheTraffic(remoteTraffic);
      return Right(remoteTraffic);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
