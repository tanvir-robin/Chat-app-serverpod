/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class TypingIndicator implements _i1.SerializableModel {
  TypingIndicator._({
    required this.typerID,
    required this.status,
  });

  factory TypingIndicator({
    required int typerID,
    required bool status,
  }) = _TypingIndicatorImpl;

  factory TypingIndicator.fromJson(Map<String, dynamic> jsonSerialization) {
    return TypingIndicator(
      typerID: jsonSerialization['typerID'] as int,
      status: jsonSerialization['status'] as bool,
    );
  }

  int typerID;

  bool status;

  TypingIndicator copyWith({
    int? typerID,
    bool? status,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'typerID': typerID,
      'status': status,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _TypingIndicatorImpl extends TypingIndicator {
  _TypingIndicatorImpl({
    required int typerID,
    required bool status,
  }) : super._(
          typerID: typerID,
          status: status,
        );

  @override
  TypingIndicator copyWith({
    int? typerID,
    bool? status,
  }) {
    return TypingIndicator(
      typerID: typerID ?? this.typerID,
      status: status ?? this.status,
    );
  }
}
