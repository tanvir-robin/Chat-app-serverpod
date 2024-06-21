/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:chat_app_serverpod_client/src/protocol/message.chat.dart'
    as _i3;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i4;
import 'package:chat_app_serverpod_client/src/protocol/usermessage.chat.dart'
    as _i5;
import 'protocol.dart' as _i6;

/// {@category Endpoint}
class EndpointMessage extends _i1.EndpointRef {
  EndpointMessage(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'message';

  _i2.Future<_i3.Message> sendMessage(_i3.Message msg) =>
      caller.callServerEndpoint<_i3.Message>(
        'message',
        'sendMessage',
        {'msg': msg},
      );
}

/// {@category Endpoint}
class EndpointExample extends _i1.EndpointRef {
  EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

/// {@category Endpoint}
class EndpointTypingIndicator extends _i1.EndpointRef {
  EndpointTypingIndicator(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'typingIndicator';
}

/// {@category Endpoint}
class EndpointUser extends _i1.EndpointRef {
  EndpointUser(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'user';

  _i2.Future<List<_i4.UserInfo>> getAllUsers() =>
      caller.callServerEndpoint<List<_i4.UserInfo>>(
        'user',
        'getAllUsers',
        {},
      );
}

/// {@category Endpoint}
class EndpointUsermessage extends _i1.EndpointRef {
  EndpointUsermessage(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'usermessage';

  _i2.Future<_i5.UserMessage> sendNewMessage(_i5.UserMessage message) =>
      caller.callServerEndpoint<_i5.UserMessage>(
        'usermessage',
        'sendNewMessage',
        {'message': message},
      );

  _i2.Future<List<_i5.UserMessage>> fetchAllMessages() =>
      caller.callServerEndpoint<List<_i5.UserMessage>>(
        'usermessage',
        'fetchAllMessages',
        {},
      );
}

class _Modules {
  _Modules(Client client) {
    auth = _i4.Caller(client);
  }

  late final _i4.Caller auth;
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
  }) : super(
          host,
          _i6.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
        ) {
    message = EndpointMessage(this);
    example = EndpointExample(this);
    typingIndicator = EndpointTypingIndicator(this);
    user = EndpointUser(this);
    usermessage = EndpointUsermessage(this);
    modules = _Modules(this);
  }

  late final EndpointMessage message;

  late final EndpointExample example;

  late final EndpointTypingIndicator typingIndicator;

  late final EndpointUser user;

  late final EndpointUsermessage usermessage;

  late final _Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'message': message,
        'example': example,
        'typingIndicator': typingIndicator,
        'user': user,
        'usermessage': usermessage,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
