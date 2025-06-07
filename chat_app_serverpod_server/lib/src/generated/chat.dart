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

abstract class Chat implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = ChatTable();

  static const db = ChatRepository._();

  @override
  int? id;

  String text;

  String sender;

  DateTime? sent;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Chat]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'text': text,
      'sender': sender,
      if (sent != null) 'sent': sent?.toJson(),
    };
  }

  static ChatInclude include() {
    return ChatInclude._();
  }

  static ChatIncludeList includeList({
    _i1.WhereExpressionBuilder<ChatTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ChatTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ChatTable>? orderByList,
    ChatInclude? include,
  }) {
    return ChatIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Chat.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Chat.t),
      include: include,
    );
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

  /// Returns a shallow copy of this [Chat]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
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

class ChatTable extends _i1.Table<int?> {
  ChatTable({super.tableRelation}) : super(tableName: 'chat') {
    text = _i1.ColumnString(
      'text',
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
  }

  late final _i1.ColumnString text;

  late final _i1.ColumnString sender;

  late final _i1.ColumnDateTime sent;

  @override
  List<_i1.Column> get columns => [
        id,
        text,
        sender,
        sent,
      ];
}

class ChatInclude extends _i1.IncludeObject {
  ChatInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Chat.t;
}

class ChatIncludeList extends _i1.IncludeList {
  ChatIncludeList._({
    _i1.WhereExpressionBuilder<ChatTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Chat.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Chat.t;
}

class ChatRepository {
  const ChatRepository._();

  /// Returns a list of [Chat]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<Chat>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ChatTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ChatTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ChatTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Chat>(
      where: where?.call(Chat.t),
      orderBy: orderBy?.call(Chat.t),
      orderByList: orderByList?.call(Chat.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Chat] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<Chat?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ChatTable>? where,
    int? offset,
    _i1.OrderByBuilder<ChatTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ChatTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Chat>(
      where: where?.call(Chat.t),
      orderBy: orderBy?.call(Chat.t),
      orderByList: orderByList?.call(Chat.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Chat] by its [id] or null if no such row exists.
  Future<Chat?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Chat>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Chat]s in the list and returns the inserted rows.
  ///
  /// The returned [Chat]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Chat>> insert(
    _i1.Session session,
    List<Chat> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Chat>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Chat] and returns the inserted row.
  ///
  /// The returned [Chat] will have its `id` field set.
  Future<Chat> insertRow(
    _i1.Session session,
    Chat row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Chat>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Chat]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Chat>> update(
    _i1.Session session,
    List<Chat> rows, {
    _i1.ColumnSelections<ChatTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Chat>(
      rows,
      columns: columns?.call(Chat.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Chat]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Chat> updateRow(
    _i1.Session session,
    Chat row, {
    _i1.ColumnSelections<ChatTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Chat>(
      row,
      columns: columns?.call(Chat.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Chat]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Chat>> delete(
    _i1.Session session,
    List<Chat> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Chat>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Chat].
  Future<Chat> deleteRow(
    _i1.Session session,
    Chat row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Chat>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Chat>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ChatTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Chat>(
      where: where(Chat.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ChatTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Chat>(
      where: where?.call(Chat.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
