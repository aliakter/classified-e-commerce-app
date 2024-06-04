import 'package:classified_apps/apps/data/error/failure.dart';
import 'package:classified_apps/apps/views/price_planing/model/price_planing_model.dart';
import 'package:dartz/dartz.dart';

import '../../../data/data_source/remote_data_source.dart';
import '../../../data/error/exception.dart';

abstract class PricePlaningRepository {
  Future<Either<Failure, PricePlaningModel>> getPlanData(String token);
}

class PricePlaningRepositoryImpl extends PricePlaningRepository {
  final RemoteDataSource remoteDataSource;

  PricePlaningRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, PricePlaningModel>> getPlanData(String token) async {
    try {
      final result = await remoteDataSource.getPlanData(token);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
