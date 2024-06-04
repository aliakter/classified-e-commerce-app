import 'package:classified_apps/apps/data/data_source/remote_data_source.dart';
import 'package:classified_apps/apps/data/error/failure.dart';
import 'package:classified_apps/apps/views/chat/model/chat_list_model.dart';
import 'package:dartz/dartz.dart';

import '../../../data/error/exception.dart';

abstract class ChatRepository {
  Future<Either<Failure, ChatListModel>> getChatList(String token);
}

class ChatRepositoryImpl extends ChatRepository {
  final RemoteDataSource remoteDataSource;
  ChatRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, ChatListModel>> getChatList(String token) async {
    try {
      final result = await remoteDataSource.getChatList(token);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
