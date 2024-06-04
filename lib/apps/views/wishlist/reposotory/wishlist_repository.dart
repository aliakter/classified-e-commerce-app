import 'package:classified_apps/apps/data/data_source/remote_data_source.dart';
import 'package:classified_apps/apps/data/error/failure.dart';
import 'package:classified_apps/apps/views/wishlist/model/wish_list_model.dart';
import 'package:dartz/dartz.dart';

import '../../../data/error/exception.dart';

abstract class WishlistRepository {
  Future<Either<Failure, WishlistModel>> getWishlistData(String token);
  Future<Either<Failure, String>> unsetWishlist(String token, String id);
}

class WishlistRepositoryImpl extends WishlistRepository {
  RemoteDataSource remoteDataSource;

  WishlistRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, WishlistModel>> getWishlistData(String token) async {
    try {
      final result = await remoteDataSource.getWishlistData(token);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<Failure, String>> unsetWishlist(String token, String id) async {
    try {
      final result = await remoteDataSource.setUnsetWishlist(token, id);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
