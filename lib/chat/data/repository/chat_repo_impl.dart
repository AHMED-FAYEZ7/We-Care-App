import 'package:health_care/chat/data/data_source/chat_remote_data_source.dart';
import 'package:health_care/chat/data/mapper/chat_mapper.dart';
import 'package:health_care/chat/domain/model/chat_model.dart';
import 'package:health_care/chat/domain/repository/chat_repository.dart';
import 'package:health_care/core/error/error_handler.dart';
import 'package:health_care/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:health_care/core/network/network_info.dart';

class ChatRepoImpl implements BaseChatRepository {
  final BaseChatRemoteDataSource _baseChatRemoteDataSource;
  final NetworkInfo _networkInfo;

  ChatRepoImpl(
    this._baseChatRemoteDataSource,
    this._networkInfo,
  );

  // @override
  // Future<void> connectToSocket() async {
  //   _baseChatRemoteDataSource.connectToSocket();
  // }

  // @override
  // Future<void> disconnectSocket() {
  //   // TODO: implement disconnectSocket
  //   throw UnimplementedError();
  // }

  @override
  Future<Either<Failure, BaseChat>> userCreateChat({
    required String receiverId,
  }) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _baseChatRemoteDataSource.userCreateChat(
          receiverId: receiverId,
        );

        return Right(response.toDomain());
      } catch (error) {
        print("catch error ${error.toString()}");
        return Left((ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Stream<Either<Failure, ChatsInfo>> userReceiveMessage() {
    // TODO: implement userReceiveMessage
    throw UnimplementedError();
  }

  @override
  Future<void> userSendMessage(String message) {
    // TODO: implement userSendMessage
    throw UnimplementedError();
  }
}
