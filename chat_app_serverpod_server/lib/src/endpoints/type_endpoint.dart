import 'package:chat_app_serverpod_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class TypingIndicatorEndpoint extends Endpoint {
  @override
  Future<void> streamOpened(StreamingSession session) async {
    session.log('Typing Indicator Stream Opened');
    session.messages.addListener(
      'typing_indicator',
      (message) {
        session.log('New Person typing: ${message.toJson()}');
        sendStreamMessage(session, message);
      },
    );
    return super.streamOpened(session);
  }

  @override
  Future<void> handleStreamMessage(
    StreamingSession session,
    SerializableModel message,
  ) async {
    session.log('Received message in stream: ${message.toJson()}');
    if (message is TypingIndicator) {
      session.log('Received new typing indications: ${message.toJson()}');

      session.messages.postMessage('typing_indicator', message);
    }
  }
}
