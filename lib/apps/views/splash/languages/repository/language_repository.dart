import 'package:classified_apps/apps/data/data_source/local_data_source.dart';
import 'package:classified_apps/apps/data/data_source/remote_data_source.dart';
import 'package:classified_apps/apps/data/error/exception.dart';
import 'package:classified_apps/apps/data/error/failure.dart';
import 'package:classified_apps/apps/views/splash/languages/model/language_model.dart';
import 'package:dartz/dartz.dart';

abstract class LanguageRepository {
  Future<Either<Failure, List<LanguageModel>>> getLanguages();
  Either<Failure, List<LanguageModel>> getCachedLanguages();

  Either<Failure, bool> checkLanguage();
  Future<Either<Failure, bool>> cacheLanguage();
}

class LanguageRepositoryImp extends LanguageRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  LanguageRepositoryImp({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Either<Failure, bool> checkLanguage() {
    try {
      final result = localDataSource.checkLanguage();

      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> cacheLanguage() async {
    try {
      return Right(await localDataSource.cacheLanguage());
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<LanguageModel>>> getLanguages() async {
    try {
      final result = await remoteDataSource.getLanguages();
      localDataSource.cacheLanguages(result);
      localDataSource.cacheLanguage();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Either<Failure, List<LanguageModel>> getCachedLanguages() {
    try {
      final result = localDataSource.getCachedLanguages();
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }
}
