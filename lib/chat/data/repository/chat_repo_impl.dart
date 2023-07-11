import 'package:health_care/chat/data/data_source/chat_remote_data_source.dart';
import 'package:health_care/chat/data/mapper/chat_mapper.dart';
import 'package:health_care/chat/data/response/chat_response/chat_response.dart';
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
  Future<Either<Failure, ChatsInfo>> getAllChats() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _baseChatRemoteDataSource.getAllChats();

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
  Future<Either<Failure, MessageModel>> userSendMessage({
    required String roomId,
    required String messageContent,
  }) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _baseChatRemoteDataSource.sendMessage(
          roomId: roomId,
          messageContent: messageContent,
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
  Stream<AllMessagesResponse> userReceiveMessage({
    required String roomId,
  }) {
    final response = _baseChatRemoteDataSource.getAllMessages(
      roomId: roomId,
    );

    return response;
  }
}
