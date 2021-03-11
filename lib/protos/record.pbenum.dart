///
//  Generated code. Do not modify.
//  source: record.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class RecordType extends $pb.ProtobufEnum {
  static const RecordType unknown = RecordType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'unknown');
  static const RecordType pointer = RecordType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'pointer');
  static const RecordType softKeyboard = RecordType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'softKeyboard');
  static const RecordType delay = RecordType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'delay');
  static const RecordType snapshot = RecordType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'snapshot');
  static const RecordType disableKeyboard = RecordType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'disableKeyboard');
  static const RecordType enableKeyboard = RecordType._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'enableKeyboard');

  static const $core.List<RecordType> values = <RecordType> [
    unknown,
    pointer,
    softKeyboard,
    delay,
    snapshot,
    disableKeyboard,
    enableKeyboard,
  ];

  static final $core.Map<$core.int, RecordType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static RecordType valueOf($core.int value) => _byValue[value];

  const RecordType._($core.int v, $core.String n) : super(v, n);
}

