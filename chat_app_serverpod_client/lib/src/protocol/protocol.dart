/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'chat.dart' as _i2;
import 'example.dart' as _i3;
import 'message.chat.dart' as _i4;
import 'typing.chat.dart' as _i5;
import 'usermessage.chat.dart' as _i6;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i7;
import 'package:chat_app_serverpod_client/src/protocol/usermessage.chat.dart'
    as _i8;
export 'chat.dart';
export 'example.dart';
export 'message.chat.dart';
export 'typing.chat.dart';
export 'usermessage.chat.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Chat) {
      return _i2.Chat.fromJson(data) as T;
    }
    if (t == _i3.Example) {
      return _i3.Example.fromJson(data) as T;
    }
    if (t == _i4.Message) {
      return _i4.Message.fromJson(data) as T;
    }
    if (t == _i5.TypingIndicator) {
      return _i5.TypingIndicator.fromJson(data) as T;
    }
    if (t == _i6.UserMessage) {
      return _i6.UserMessage.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Chat?>()) {
      return (data != null ? _i2.Chat.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Example?>()) {
      return (data != null ? _i3.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Message?>()) {
      return (data != null ? _i4.Message.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.TypingIndicator?>()) {
      return (data != null ? _i5.TypingIndicator.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.UserMessage?>()) {
      return (data != null ? _i6.UserMessage.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<Map<String, String>?>()) {
      return (data != null
          ? (data as Map).map((k, v) =>
              MapEntry(deserialize<String>(k), deserialize<String>(v)))
          : null) as dynamic;
    }
    if (t == List<_i7.UserInfo>) {
      return (data as List).map((e) => deserialize<_i7.UserInfo>(e)).toList()
          as dynamic;
    }
    if (t == List<_i8.UserMessage>) {
      return (data as List).map((e) => deserialize<_i8.UserMessage>(e)).toList()
          as dynamic;
    }
    try {
      return _i7.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i7.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i2.Chat) {
      return 'Chat';
    }
    if (data is _i3.Example) {
      return 'Example';
    }
    if (data is _i4.Message) {
      return 'Message';
    }
    if (data is _i5.TypingIndicator) {
      return 'TypingIndicator';
    }
    if (data is _i6.UserMessage) {
      return 'UserMessage';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i7.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'Chat') {
      return deserialize<_i2.Chat>(data['data']);
    }
    if (data['className'] == 'Example') {
      return deserialize<_i3.Example>(data['data']);
    }
    if (data['className'] == 'Message') {
      return deserialize<_i4.Message>(data['data']);
    }
    if (data['className'] == 'TypingIndicator') {
      return deserialize<_i5.TypingIndicator>(data['data']);
    }
    if (data['className'] == 'UserMessage') {
      return deserialize<_i6.UserMessage>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
