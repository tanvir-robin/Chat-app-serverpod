import 'package:chat_app_serverpod_server/src/generated/message.chat.dart';
import 'package:serverpod/serverpod.dart';

class MessageEndpoint extends Endpoint {
  Future<Message> sendMessage(Session session, Message msg) async {
    session.log('Received message update: ${msg.toString()}');
    return await Message.db.insertRow(session, msg);
  }
}
