/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/chat_endpoint.dart' as _i2;
import '../endpoints/example_endpoint.dart' as _i3;
import '../endpoints/type_endpoint.dart' as _i4;
import '../endpoints/user_endpoint.dart' as _i5;
import '../endpoints/usermessage_endpoint.dart' as _i6;
import 'package:chat_app_serverpod_server/src/generated/message.chat.dart'
    as _i7;
import 'package:chat_app_serverpod_server/src/generated/usermessage.chat.dart'
    as _i8;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i9;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'message': _i2.MessageEndpoint()
        ..initialize(
          server,
          'message',
          null,
        ),
      'example': _i3.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
      'typingIndicator': _i4.TypingIndicatorEndpoint()
        ..initialize(
          server,
          'typingIndicator',
          null,
        ),
      'user': _i5.UserEndpoint()
        ..initialize(
          server,
          'user',
          null,
        ),
      'usermessage': _i6.UsermessageEndpoint()
        ..initialize(
          server,
          'usermessage',
          null,
        ),
    };
    connectors['message'] = _i1.EndpointConnector(
      name: 'message',
      endpoint: endpoints['message']!,
      methodConnectors: {
        'sendMessage': _i1.MethodConnector(
          name: 'sendMessage',
          params: {
            'msg': _i1.ParameterDescription(
              name: 'msg',
              type: _i1.getType<_i7.Message>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['message'] as _i2.MessageEndpoint).sendMessage(
            session,
            params['msg'],
          ),
        )
      },
    );
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['example'] as _i3.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    connectors['typingIndicator'] = _i1.EndpointConnector(
      name: 'typingIndicator',
      endpoint: endpoints['typingIndicator']!,
      methodConnectors: {},
    );
    connectors['user'] = _i1.EndpointConnector(
      name: 'user',
      endpoint: endpoints['user']!,
      methodConnectors: {
        'getAllUsers': _i1.MethodConnector(
          name: 'getAllUsers',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i5.UserEndpoint).getAllUsers(session),
        )
      },
    );
    connectors['usermessage'] = _i1.EndpointConnector(
      name: 'usermessage',
      endpoint: endpoints['usermessage']!,
      methodConnectors: {
        'sendNewMessage': _i1.MethodConnector(
          name: 'sendNewMessage',
          params: {
            'message': _i1.ParameterDescription(
              name: 'message',
              type: _i1.getType<_i8.UserMessage>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['usermessage'] as _i6.UsermessageEndpoint)
                  .sendNewMessage(
            session,
            params['message'],
          ),
        ),
        'fetchAllMessages': _i1.MethodConnector(
          name: 'fetchAllMessages',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['usermessage'] as _i6.UsermessageEndpoint)
                  .fetchAllMessages(session),
        ),
      },
    );
    modules['serverpod_auth'] = _i9.Endpoints()..initializeEndpoints(server);
  }
}
