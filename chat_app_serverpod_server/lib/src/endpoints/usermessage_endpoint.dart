import 'package:chat_app_serverpod_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class UsermessageEndpoint extends Endpoint {
  Future<UserMessage> sendNewMessage(
      Session session, UserMessage message) async {
    return await UserMessage.db.insertRow(session, message);
  }

  Future<List<UserMessage>> fetchAllMessages(Session session) async {
    return await UserMessage.db.find(session);
  }

  @override
  Future<void> streamOpened(StreamingSession session) async {
    session.log('Chat user common stream opened');
    session.messages.addListener(
      'chat_room_serverpod',
      (message) {
        session.log('Received message update in stream: ${message.toJson()}');
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
    if (message is UserMessage) {
      session
          .log('Received message for posting in stream: ${message.toJson()}');

      var existingMessages = await UserMessage.db.find(
        session,
        where: (t) => t.id.equals(message.id),
      );

      if (existingMessages.isNotEmpty) {
        UserMessage updated = await UserMessage.db.updateRow(session, message);
        session.log('Updated existing message: ${message.toJson()}');
        session.messages.postMessage('chat_room_serverpod', updated);
      } else {
        session.log('Trying to insert with ID: ${message.id}');
        UserMessage inserted = await UserMessage.db.insertRow(session, message);
        session.log('Inserted new message: ${message.toJson()}');
        session.messages.postMessage('chat_room_serverpod', inserted);
      }
    }
  }
}
