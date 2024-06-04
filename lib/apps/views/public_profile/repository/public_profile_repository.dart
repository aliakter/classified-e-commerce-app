import 'package:classified_apps/apps/data/data_source/remote_data_source.dart';
import 'package:classified_apps/apps/data/error/exception.dart';
import 'package:classified_apps/apps/data/error/failure.dart';
import 'package:classified_apps/apps/views/public_profile/model/public_profile_model.dart';
import 'package:classified_apps/apps/views/transection/model/transaction_model.dart';
import 'package:dartz/dartz.dart';

abstract class PublicProfileRepository {
  Future<Either<Failure, PublicProfileModel>> getPublicShop(
      String token, String username, String page);

  Future<Either<Failure, List<TransactionModel>>> getTransaction(String token);

  Future<Either<Failure, String>> setReview(
      String token, String username, dynamic data);
}

class PublicProfileRepositoryImpl extends PublicProfileRepository {
  final RemoteDataSource remoteDataSource;
  PublicProfileRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, PublicProfileModel>> getPublicShop(
      String token, String username, String page) async {
    try {
      final result = await remoteDataSource.getPublicShop(token, username, page);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, List<TransactionModel>>> getTransaction(
      String token) async {
    try {
      final result = await remoteDataSource.getTransaction(token);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, String>> setReview(
      String token, String username, dynamic data) async {
    try {
      final result = await remoteDataSource.setReview(token, username, data);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
