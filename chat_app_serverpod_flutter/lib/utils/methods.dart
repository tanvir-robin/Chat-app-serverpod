import 'package:chatview/chatview.dart';

ReplyMessage toFormat(Map<String, String> json) {
  return ReplyMessage(
      messageId: json['id'] ?? '',
      message: json['message'] ?? '',
      replyBy: json['replyBy'] ?? '',
      replyTo: json['replyTo'] ?? '',
      messageType: MessageType.text,
      voiceMessageDuration: null);
}

Map<String, String> toDeFormat(ReplyMessage json) {
  return {
    'message': json.message,
    'replyBy': json.replyBy,
    'replyTo': json.replyTo,
    'id': json.messageId,
  };
}
