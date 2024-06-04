import 'package:classified_apps/apps/data/error/exception.dart';
import 'package:classified_apps/apps/data/error/failure.dart';
import 'package:classified_apps/apps/views/profile_update/models/user_profile_models.dart';
import 'package:dartz/dartz.dart';

import '../../../data/data_source/remote_data_source.dart';

abstract class ProfileUpdateRepository {
  Future<Either<Failure, String>> editProfile(String token, Map<String, dynamic> body);

  Future<Either<Failure, String>> changePassword(String token, dynamic data);

  Future<Either<Failure, String>> deleteAccount(String token);

  Future<Either<Failure, UserProfileModel>> getUserProfile(String token);
}

class ProfileUpdateRepositoryImpl extends ProfileUpdateRepository {
  final RemoteDataSource remoteDataSource;

  ProfileUpdateRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, UserProfileModel>> getUserProfile(String token) async {
    try {
      final result = await remoteDataSource.getUserProfile(token);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, String>> editProfile(
      String token, Map<String, dynamic> body) async {
    try {
      final result = await remoteDataSource.updateProfile(token, body);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, String>> changePassword(String token, data) async {
    try {
      final result = await remoteDataSource.changePassword(token, data);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, String>> deleteAccount(String token) async {
    try {
      final result = await remoteDataSource.deleteAccount(token);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
