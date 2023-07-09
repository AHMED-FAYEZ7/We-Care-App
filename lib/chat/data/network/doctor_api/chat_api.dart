import 'package:dio/dio.dart';
import 'package:health_care/chat/data/response/chat_response/chat_response.dart';
import 'package:health_care/core/network/api_constance.dart';
import 'package:health_care/doctor/data/response/time_block/time_block_response.dart';
import 'package:retrofit/retrofit.dart';

part 'chat_api.g.dart';

@RestApi(baseUrl: AppConstance.baseUrl)
abstract class ChatServiceClient {
  factory ChatServiceClient(Dio dio, {String baseUrl}) = _ChatServiceClient;

  @POST("api/v1/chats/{receiverId}")
  Future<BaseChatResponse> createChatRoom(
    @Path("receiverId") String receiverId,
  );
}
