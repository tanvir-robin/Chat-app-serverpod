import 'package:chat_app_serverpod_server/src/generated/message.chat.dart';
import 'package:serverpod/serverpod.dart';

class MessageEndpoint extends Endpoint {
  Future<Message> sendMessage(Session session, Message msg) async {
    session.log('Received message update: ${msg.toString()}');
    return await Message.db.insertRow(session, msg);
  }

  // @override
  // Future<void> streamOpened(StreamingSession session) async {
  //   final authenticationInfo = await session.authenticated;
  //   final userId = authenticationInfo?.userId;
  //   session.log('Opened an stram with user_$userId');
  //   session.messages.addListener(
  //     'user_$userId',
  //     (message) {
  //       session.log('Received message update in stream: ${message.toJson()}');
  //       sendStreamMessage(session, message);
  //     },
  //   );
  //   return super.streamOpened(session);
  // }

  // @override
  // Future<void> handleStreamMessage(
  //   StreamingSession session,
  //   SerializableModel message,
  // ) async {
  //   if (message is Message) {
  //     session
  //         .log('Received message for posting in stream: ${message.toJson()}');
  //     session.messages.postMessage(
  //       'user_${message.receiver}',
  //       message,
  //     );
  //   }
  // }
}
