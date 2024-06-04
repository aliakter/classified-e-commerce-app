import 'package:classified_apps/apps/data/data_source/local_data_source.dart';
import 'package:classified_apps/apps/data/data_source/remote_data_source.dart';
import 'package:classified_apps/apps/data/error/exception.dart';
import 'package:classified_apps/apps/data/error/failure.dart';
import 'package:classified_apps/apps/views/home/models/home_model.dart';
import 'package:dartz/dartz.dart';

import '../../auth/login/model/setting_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, HomeModel>> getHomeData(String token);

  Future<Either<Failure, SettingModel>> getSettingData();

  Future<Either<Failure, String>> setUnsetWishlist(String token, String id);
}

class HomeRepositoryImpl extends HomeRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  HomeRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, HomeModel>> getHomeData(String token) async {
    try {
      final result = await remoteDataSource.getHomeData(token);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, SettingModel>> getSettingData() async {
    try {
      final result = await remoteDataSource.getSettingData();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, String>> setUnsetWishlist(
      String token, String id) async {
    try {
      final result = await remoteDataSource.setUnsetWishlist(token, id);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
