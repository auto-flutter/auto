///
//  Generated code. Do not modify.
//  source: script_meta_data.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'app_info.pb.dart' as $0;

class ScriptMetaData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ScriptMetaData', createEmptyInstance: create)
    ..aOM<$0.AppInfo>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'appInfo', protoName: 'appInfo', subBuilder: $0.AppInfo.create)
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalTime', protoName: 'totalTime')
    ..hasRequiredFields = false
  ;

  ScriptMetaData._() : super();
  factory ScriptMetaData({
    $0.AppInfo appInfo,
    $fixnum.Int64 totalTime,
  }) {
    final _result = create();
    if (appInfo != null) {
      _result.appInfo = appInfo;
    }
    if (totalTime != null) {
      _result.totalTime = totalTime;
    }
    return _result;
  }
  factory ScriptMetaData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ScriptMetaData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ScriptMetaData clone() => ScriptMetaData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ScriptMetaData copyWith(void Function(ScriptMetaData) updates) => super.copyWith((message) => updates(message as ScriptMetaData)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ScriptMetaData create() => ScriptMetaData._();
  ScriptMetaData createEmptyInstance() => create();
  static $pb.PbList<ScriptMetaData> createRepeated() => $pb.PbList<ScriptMetaData>();
  @$core.pragma('dart2js:noInline')
  static ScriptMetaData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ScriptMetaData>(create);
  static ScriptMetaData _defaultInstance;

  @$pb.TagNumber(1)
  $0.AppInfo get appInfo => $_getN(0);
  @$pb.TagNumber(1)
  set appInfo($0.AppInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAppInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearAppInfo() => clearField(1);
  @$pb.TagNumber(1)
  $0.AppInfo ensureAppInfo() => $_ensure(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get totalTime => $_getI64(1);
  @$pb.TagNumber(2)
  set totalTime($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotalTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalTime() => clearField(2);
}

