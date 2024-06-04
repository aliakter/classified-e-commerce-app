import 'package:classified_apps/apps/data/data_source/remote_data_source.dart';
import 'package:dartz/dartz.dart';

import '../../../data/error/exception.dart';
import '../../../data/error/failure.dart';
import '../model/user_plan_model.dart';

abstract class UserPlanRepository {
  Future<Either<Failure, UserPlanModel>> getUserPlan(String token);
}

class UserPlanRepositoryImpl extends UserPlanRepository {
  final RemoteDataSource remoteDataSource;

  UserPlanRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, UserPlanModel>> getUserPlan(String token) async {
    try {
      final result = await remoteDataSource.getUserPlan(token);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
