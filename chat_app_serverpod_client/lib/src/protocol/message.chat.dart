/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Message implements _i1.SerializableModel {
  Message._({
    this.id,
    required this.text,
    required this.sender,
    required this.receiver,
    this.sent,
  });

  factory Message({
    int? id,
    required String text,
    required String sender,
    required String receiver,
    DateTime? sent,
  }) = _MessageImpl;

  factory Message.fromJson(Map<String, dynamic> jsonSerialization) {
    return Message(
      id: jsonSerialization['id'] as int?,
      text: jsonSerialization['text'] as String,
      sender: jsonSerialization['sender'] as String,
      receiver: jsonSerialization['receiver'] as String,
      sent: jsonSerialization['sent'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['sent']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String text;

  String sender;

  String receiver;

  DateTime? sent;

  Message copyWith({
    int? id,
    String? text,
    String? sender,
    String? receiver,
    DateTime? sent,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'text': text,
      'sender': sender,
      'receiver': receiver,
      if (sent != null) 'sent': sent?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MessageImpl extends Message {
  _MessageImpl({
    int? id,
    required String text,
    required String sender,
    required String receiver,
    DateTime? sent,
  }) : super._(
          id: id,
          text: text,
          sender: sender,
          receiver: receiver,
          sent: sent,
        );

  @override
  Message copyWith({
    Object? id = _Undefined,
    String? text,
    String? sender,
    String? receiver,
    Object? sent = _Undefined,
  }) {
    return Message(
      id: id is int? ? id : this.id,
      text: text ?? this.text,
      sender: sender ?? this.sender,
      receiver: receiver ?? this.receiver,
      sent: sent is DateTime? ? sent : this.sent,
    );
  }
}
