///
//  Generated code. Do not modify.
//  source: protos/replay_data.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ReplayData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ReplayData', createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', $pb.PbFieldType.OY)
    ..p<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dependencies', $pb.PbFieldType.PY)
    ..hasRequiredFields = false
  ;

  ReplayData._() : super();
  factory ReplayData({
    $core.List<$core.int> data,
    $core.Iterable<$core.List<$core.int>> dependencies,
  }) {
    final _result = create();
    if (data != null) {
      _result.data = data;
    }
    if (dependencies != null) {
      _result.dependencies.addAll(dependencies);
    }
    return _result;
  }
  factory ReplayData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReplayData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReplayData clone() => ReplayData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReplayData copyWith(void Function(ReplayData) updates) => super.copyWith((message) => updates(message as ReplayData)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ReplayData create() => ReplayData._();
  ReplayData createEmptyInstance() => create();
  static $pb.PbList<ReplayData> createRepeated() => $pb.PbList<ReplayData>();
  @$core.pragma('dart2js:noInline')
  static ReplayData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReplayData>(create);
  static ReplayData _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get data => $_getN(0);
  @$pb.TagNumber(1)
  set data($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.List<$core.int>> get dependencies => $_getList(1);
}

