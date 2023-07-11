import 'package:dio/dio.dart';
import 'package:health_care/chat/data/response/chat_response/chat_response.dart';
import 'package:health_care/core/network/api_constance.dart';
import 'package:retrofit/retrofit.dart';

part 'chat_api.g.dart';

@RestApi(baseUrl: AppConstance.baseUrl)
abstract class ChatServiceClient {
  factory ChatServiceClient(Dio dio, {String baseUrl}) = _ChatServiceClient;

  @POST("api/v1/chats/{receiverId}")
  Future<BaseChatResponse> createChatRoom(
    @Path("receiverId") String receiverId,
  );

  @GET("api/v1/chats/all")
  Future<ChatsInfoResponse> getAllChats();

  @POST("api/v1/message/{roomId}")
  Future<MessageResponse> sendMessage(
    @Path("roomId") String roomId,
    @Field("msg") String messageContent,
  );

  @GET("api/v1/message/{roomId}")
  Stream<AllMessagesResponse> getAllMessages(
    @Path("roomId") String roomId,
  );
}
