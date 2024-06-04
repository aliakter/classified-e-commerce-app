import 'package:classified_apps/apps/data/data_source/local_data_source.dart';
import 'package:classified_apps/apps/data/data_source/remote_data_source.dart';
import 'package:classified_apps/apps/data/error/exception.dart';
import 'package:classified_apps/apps/data/error/failure.dart';
import 'package:classified_apps/apps/views/auth/login/model/login_model.dart';
import 'package:dartz/dartz.dart';

import '../login/model/setting_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserLoginResponseModel>> login(Map<String, dynamic> body);

  Future<Either<Failure, SettingModel>> getSettingData();

  Future<Either<Failure, UserLoginResponseModel>> userRegister(Map<String, dynamic> body);
  Future<Either<Failure, String>> forgotPassWord(Map<String, dynamic> body);
  Future<Either<Failure, UserLoginResponseModel>> socialLogin(Map<String, dynamic> body);

  // Future<Either<Failure, String>> forgotPassword(Map<String, dynamic> body, String token);
  // Future<Either<Failure, UserProfileModel>> getOnlyUserData(String token);

  Either<Failure, UserLoginResponseModel> getCashedUserInfo();
  Either<Failure, bool> saveCashedUserInfo(UserLoginResponseModel userRegisterModel);
}

class AuthRepositoryImpl extends AuthRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, UserLoginResponseModel>> login(
      Map<String, dynamic> body) async {
    try {
      final result = await remoteDataSource.signIn(body);
      localDataSource.cacheUserResponse(result);
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
  Future<Either<Failure, UserLoginResponseModel>> userRegister(Map<String, dynamic> body) async {
    try {
      final result = await remoteDataSource.userRegister(body);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }


  @override
  Future<Either<Failure, UserLoginResponseModel>> socialLogin(Map<String, dynamic> body) async {
    try {
      final result = await remoteDataSource.socialLogin(body);
      localDataSource.cacheUserResponse(result);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }


  @override
  Future<Either<Failure, String>> forgotPassWord(
      Map<String, dynamic> body) async {
    try {
      final result = await remoteDataSource.forgotPassWord(body);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  // @override
  // Future<Either<Failure, UserProfileModel>> getOnlyUserData(String token) async {
  //   try {
  //     final result = await remoteDataSource.getOnlyUserData(token);
  //     return Right(result);
  //   } on ServerException catch (e) {
  //     return Left(ServerFailure(e.message, e.statusCode));
  //   }
  // }

  @override
  Either<Failure, UserLoginResponseModel> getCashedUserInfo() {
    try {
      final result = localDataSource.getUserResponseModel();
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Either<Failure, bool> saveCashedUserInfo(
      UserLoginResponseModel userRegisterModel) {
    try {
      localDataSource.cacheUserResponse(userRegisterModel);
      return const Right(true);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }
}
