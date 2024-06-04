import 'package:classified_apps/apps/data/data_source/remote_data_source.dart';
import 'package:classified_apps/apps/data/error/failure.dart';
import 'package:classified_apps/apps/views/compare/model/compare_list_model.dart';
import 'package:dartz/dartz.dart';

import '../../../data/error/exception.dart';

abstract class CompareRepository {
  Future<Either<Failure, CompareListModel>> getCompareList(Map<String, dynamic> data);
}

class CompareRepositoryImpl extends CompareRepository {
  final RemoteDataSource remoteDataSource;
  CompareRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, CompareListModel>> getCompareList(Map<String, dynamic>  data) async {
    try {
      final result = await remoteDataSource.getCompareListData(data);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
