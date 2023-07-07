import 'package:dartz/dartz.dart';
import 'package:health_care/chat/domain/repository/chat_repository.dart';
import 'package:health_care/core/usecase/base_usecase.dart';

class ConnectToSocketUseCase implements TestUseCase<NoParameters, void> {
  final BaseChatRepository _baseChatRepository;

  ConnectToSocketUseCase(this._baseChatRepository);

  @override
  Future<void> call(
    NoParameters input,
  ) async {
    return await _baseChatRepository.connectToSocket();
  }
}
