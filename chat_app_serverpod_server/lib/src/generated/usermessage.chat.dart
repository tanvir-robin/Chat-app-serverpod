/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class UserMessage extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  UserMessage._({
    int? id,
    required this.message,
    required this.sender,
    this.sent,
    required this.status,
    this.reactions,
    this.reactionsUsers,
    this.replyMessages,
  }) : super(id);

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

  static final t = UserMessageTable();

  static const db = UserMessageRepository._();

  String message;

  String sender;

  DateTime? sent;

  String status;

  List<String>? reactions;

  List<String>? reactionsUsers;

  Map<String, String>? replyMessages;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

  static UserMessageInclude include() {
    return UserMessageInclude._();
  }

  static UserMessageIncludeList includeList({
    _i1.WhereExpressionBuilder<UserMessageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserMessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserMessageTable>? orderByList,
    UserMessageInclude? include,
  }) {
    return UserMessageIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(UserMessage.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(UserMessage.t),
      include: include,
    );
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

class UserMessageTable extends _i1.Table {
  UserMessageTable({super.tableRelation}) : super(tableName: 'usermessage') {
    message = _i1.ColumnString(
      'message',
      this,
    );
    sender = _i1.ColumnString(
      'sender',
      this,
    );
    sent = _i1.ColumnDateTime(
      'sent',
      this,
    );
    status = _i1.ColumnString(
      'status',
      this,
    );
    reactions = _i1.ColumnSerializable(
      'reactions',
      this,
    );
    reactionsUsers = _i1.ColumnSerializable(
      'reactionsUsers',
      this,
    );
    replyMessages = _i1.ColumnSerializable(
      'replyMessages',
      this,
    );
  }

  late final _i1.ColumnString message;

  late final _i1.ColumnString sender;

  late final _i1.ColumnDateTime sent;

  late final _i1.ColumnString status;

  late final _i1.ColumnSerializable reactions;

  late final _i1.ColumnSerializable reactionsUsers;

  late final _i1.ColumnSerializable replyMessages;

  @override
  List<_i1.Column> get columns => [
        id,
        message,
        sender,
        sent,
        status,
        reactions,
        reactionsUsers,
        replyMessages,
      ];
}

class UserMessageInclude extends _i1.IncludeObject {
  UserMessageInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => UserMessage.t;
}

class UserMessageIncludeList extends _i1.IncludeList {
  UserMessageIncludeList._({
    _i1.WhereExpressionBuilder<UserMessageTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(UserMessage.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => UserMessage.t;
}

class UserMessageRepository {
  const UserMessageRepository._();

  Future<List<UserMessage>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserMessageTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserMessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserMessageTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<UserMessage>(
      where: where?.call(UserMessage.t),
      orderBy: orderBy?.call(UserMessage.t),
      orderByList: orderByList?.call(UserMessage.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<UserMessage?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserMessageTable>? where,
    int? offset,
    _i1.OrderByBuilder<UserMessageTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserMessageTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<UserMessage>(
      where: where?.call(UserMessage.t),
      orderBy: orderBy?.call(UserMessage.t),
      orderByList: orderByList?.call(UserMessage.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<UserMessage?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<UserMessage>(
      id,
      transaction: transaction,
    );
  }

  Future<List<UserMessage>> insert(
    _i1.Session session,
    List<UserMessage> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<UserMessage>(
      rows,
      transaction: transaction,
    );
  }

  Future<UserMessage> insertRow(
    _i1.Session session,
    UserMessage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<UserMessage>(
      row,
      transaction: transaction,
    );
  }

  Future<List<UserMessage>> update(
    _i1.Session session,
    List<UserMessage> rows, {
    _i1.ColumnSelections<UserMessageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<UserMessage>(
      rows,
      columns: columns?.call(UserMessage.t),
      transaction: transaction,
    );
  }

  Future<UserMessage> updateRow(
    _i1.Session session,
    UserMessage row, {
    _i1.ColumnSelections<UserMessageTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<UserMessage>(
      row,
      columns: columns?.call(UserMessage.t),
      transaction: transaction,
    );
  }

  Future<List<UserMessage>> delete(
    _i1.Session session,
    List<UserMessage> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<UserMessage>(
      rows,
      transaction: transaction,
    );
  }

  Future<UserMessage> deleteRow(
    _i1.Session session,
    UserMessage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<UserMessage>(
      row,
      transaction: transaction,
    );
  }

  Future<List<UserMessage>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UserMessageTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<UserMessage>(
      where: where(UserMessage.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserMessageTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<UserMessage>(
      where: where?.call(UserMessage.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
