import 'package:classified_apps/apps/data/data_source/local_data_source.dart';
import 'package:classified_apps/apps/data/data_source/remote_data_source.dart';
import 'package:classified_apps/apps/data/error/exception.dart';
import 'package:classified_apps/apps/data/error/failure.dart';
import 'package:classified_apps/apps/views/ad_details/model/ad_details_model.dart';
import 'package:classified_apps/apps/views/ads/model/adlist_response_model.dart';
import 'package:classified_apps/apps/views/home/models/ad_model.dart';
import 'package:classified_apps/apps/views/home/models/home_model.dart';
import 'package:dartz/dartz.dart';

abstract class AdRepository {

  Future<Either<Failure, AdListResponseModel>> getAdsListData(String token,
  String searchText,
  String selectedCity,
  String minPrice,
  String maxPrice,
  String sortingValue,
  String categoryValue,
      String page,
      );

  Future<Either<Failure, AdDetailsModel>> getAdDetails(String token, String slug);
  Future<Either<Failure, String>> postAds(String token, Map<String, dynamic> body);
  Future<Either<Failure, String>> postReport(String token, Map<String, dynamic> body);
  Future<Either<Failure, String>> updateAds(String token, Map<String, dynamic> body, String id);
  Future<Either<Failure, AdDetails>> getAdEditData(String token, String id);
}

class AdRepositoryImpl extends AdRepository {
  final RemoteDataSource remoteDataSource;
  AdRepositoryImpl({
    required this.remoteDataSource,
  });


  @override
  Future<Either<Failure, AdListResponseModel>> getAdsListData(String token,
      String searchText,
      String selectedCity,
      String minPrice,
      String maxPrice,
      String sortingValue,
      String categoryValue,
      String page,

      ) async {
    try {
      final result = await remoteDataSource.getAdsListData(token,
          searchText,
          selectedCity,
          minPrice,
          maxPrice,
          sortingValue,
        categoryValue,
        page,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, AdDetailsModel>> getAdDetails(String token, String slug) async {
    try {
      final result = await remoteDataSource.getAdDetails(token, slug);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, AdDetails>> getAdEditData(String token, String id) async {
    try {
      final result = await remoteDataSource.getAdEditData(token, id);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, String>> postAds(String token, Map<String, dynamic> body) async {
    try {
      final result = await remoteDataSource.postAds(token, body);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
  @override
  Future<Either<Failure, String>> postReport(String token, Map<String, dynamic> body) async {
    try {
      final result = await remoteDataSource.postReport(token, body);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, String>> updateAds(String token, Map<String, dynamic> body, String id) async {
    try {
      final result = await remoteDataSource.updateAds(token, body, id);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }



}
