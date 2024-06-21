/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class UserMessage implements _i1.SerializableModel {
  UserMessage._({
    this.id,
    required this.message,
    required this.sender,
    this.sent,
    required this.status,
    this.reactions,
    this.reactionsUsers,
    this.replyMessages,
  });

  factory UserMessage({
    int? id,
    required String message,
    required String sender,
    DateTime? sent,
    required String status,
    List<String>? reactions,
    List<String>? reactionsUsers,
    Map<String, String>? replyMessages,
  }) = _UserMessageImpl;

  factory UserMessage.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserMessage(
      id: jsonSerialization['id'] as int?,
      message: jsonSerialization['message'] as String,
      sender: jsonSerialization['sender'] as String,
      sent: jsonSerialization['sent'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['sent']),
      status: jsonSerialization['status'] as String,
      reactions: (jsonSerialization['reactions'] as List?)
          ?.map((e) => e as String)
          .toList(),
      reactionsUsers: (jsonSerialization['reactionsUsers'] as List?)
          ?.map((e) => e as String)
          .toList(),
      replyMessages:
          (jsonSerialization['replyMessages'] as Map?)?.map((k, v) => MapEntry(
                k as String,
                v as String,
              )),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String message;

  String sender;

  DateTime? sent;

  String status;

  List<String>? reactions;

  List<String>? reactionsUsers;

  Map<String, String>? replyMessages;

  UserMessage copyWith({
    int? id,
    String? message,
    String? sender,
    DateTime? sent,
    String? status,
    List<String>? reactions,
    List<String>? reactionsUsers,
    Map<String, String>? replyMessages,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'message': message,
      'sender': sender,
      if (sent != null) 'sent': sent?.toJson(),
      'status': status,
      if (reactions != null) 'reactions': reactions?.toJson(),
      if (reactionsUsers != null) 'reactionsUsers': reactionsUsers?.toJson(),
      if (replyMessages != null) 'replyMessages': replyMessages?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserMessageImpl extends UserMessage {
  _UserMessageImpl({
    int? id,
    required String message,
    required String sender,
    DateTime? sent,
    required String status,
    List<String>? reactions,
    List<String>? reactionsUsers,
    Map<String, String>? replyMessages,
  }) : super._(
          id: id,
          message: message,
          sender: sender,
          sent: sent,
          status: status,
          reactions: reactions,
          reactionsUsers: reactionsUsers,
          replyMessages: replyMessages,
        );

  @override
  UserMessage copyWith({
    Object? id = _Undefined,
    String? message,
    String? sender,
    Object? sent = _Undefined,
    String? status,
    Object? reactions = _Undefined,
    Object? reactionsUsers = _Undefined,
    Object? replyMessages = _Undefined,
  }) {
    return UserMessage(
      id: id is int? ? id : this.id,
      message: message ?? this.message,
      sender: sender ?? this.sender,
      sent: sent is DateTime? ? sent : this.sent,
      status: status ?? this.status,
      reactions:
          reactions is List<String>? ? reactions : this.reactions?.clone(),
      reactionsUsers: reactionsUsers is List<String>?
          ? reactionsUsers
          : this.reactionsUsers?.clone(),
      replyMessages: replyMessages is Map<String, String>?
          ? replyMessages
          : this.replyMessages?.clone(),
    );
  }
}
