import 'package:classified_apps/apps/data/data_source/remote_data_source.dart';
import 'package:classified_apps/apps/data/error/failure.dart';
import 'package:classified_apps/apps/views/dashboard/model/dashboard_model.dart';
import 'package:dartz/dartz.dart';

import '../../../data/error/exception.dart';

abstract class DashboardRepository {
  Future<Either<Failure, DashboardModel>> getDashboardData(String token);
}

class DashboardRepositoryImpl extends DashboardRepository {
  final RemoteDataSource remoteDataSource;

  DashboardRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, DashboardModel>> getDashboardData(String token) async {
    try {
      final result = await remoteDataSource.getDashboardData(token);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
