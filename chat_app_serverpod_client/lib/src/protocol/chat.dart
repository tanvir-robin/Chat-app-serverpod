/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Chat implements _i1.SerializableModel {
  Chat._({
    this.id,
    required this.text,
    required this.sender,
    this.sent,
  });

  factory Chat({
    int? id,
    required String text,
    required String sender,
    DateTime? sent,
  }) = _ChatImpl;

  factory Chat.fromJson(Map<String, dynamic> jsonSerialization) {
    return Chat(
      id: jsonSerialization['id'] as int?,
      text: jsonSerialization['text'] as String,
      sender: jsonSerialization['sender'] as String,
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

  DateTime? sent;

  Chat copyWith({
    int? id,
    String? text,
    String? sender,
    DateTime? sent,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'text': text,
      'sender': sender,
      if (sent != null) 'sent': sent?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ChatImpl extends Chat {
  _ChatImpl({
    int? id,
    required String text,
    required String sender,
    DateTime? sent,
  }) : super._(
          id: id,
          text: text,
          sender: sender,
          sent: sent,
        );

  @override
  Chat copyWith({
    Object? id = _Undefined,
    String? text,
    String? sender,
    Object? sent = _Undefined,
  }) {
    return Chat(
      id: id is int? ? id : this.id,
      text: text ?? this.text,
      sender: sender ?? this.sender,
      sent: sent is DateTime? ? sent : this.sent,
    );
  }
}
