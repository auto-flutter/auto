///
//  Generated code. Do not modify.
//  source: app_info.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'app_info.pbenum.dart';

export 'app_info.pbenum.dart';

class AppInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AppInfo', createEmptyInstance: create)
    ..e<Platform>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'platform', $pb.PbFieldType.OE, defaultOrMaker: Platform.unknown, valueOf: Platform.valueOf, enumValues: Platform.values)
    ..e<Mode>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mode', $pb.PbFieldType.OE, defaultOrMaker: Mode.undefined, valueOf: Mode.valueOf, enumValues: Mode.values)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deviceName', protoName: 'deviceName')
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'autoApiVersion', $pb.PbFieldType.O3, protoName: 'autoApiVersion')
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'devicePixelRatio', $pb.PbFieldType.OD, protoName: 'devicePixelRatio')
    ..a<$core.double>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'textScaleFactor', $pb.PbFieldType.OD, protoName: 'textScaleFactor')
    ..a<$core.double>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'physicalHeight', $pb.PbFieldType.OD, protoName: 'physicalHeight')
    ..a<$core.double>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'physicalWidth', $pb.PbFieldType.OD, protoName: 'physicalWidth')
    ..hasRequiredFields = false
  ;

  AppInfo._() : super();
  factory AppInfo({
    Platform platform,
    Mode mode,
    $core.String deviceName,
    $core.int autoApiVersion,
    $core.double devicePixelRatio,
    $core.double textScaleFactor,
    $core.double physicalHeight,
    $core.double physicalWidth,
  }) {
    final _result = create();
    if (platform != null) {
      _result.platform = platform;
    }
    if (mode != null) {
      _result.mode = mode;
    }
    if (deviceName != null) {
      _result.deviceName = deviceName;
    }
    if (autoApiVersion != null) {
      _result.autoApiVersion = autoApiVersion;
    }
    if (devicePixelRatio != null) {
      _result.devicePixelRatio = devicePixelRatio;
    }
    if (textScaleFactor != null) {
      _result.textScaleFactor = textScaleFactor;
    }
    if (physicalHeight != null) {
      _result.physicalHeight = physicalHeight;
    }
    if (physicalWidth != null) {
      _result.physicalWidth = physicalWidth;
    }
    return _result;
  }
  factory AppInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AppInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AppInfo clone() => AppInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AppInfo copyWith(void Function(AppInfo) updates) => super.copyWith((message) => updates(message as AppInfo)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AppInfo create() => AppInfo._();
  AppInfo createEmptyInstance() => create();
  static $pb.PbList<AppInfo> createRepeated() => $pb.PbList<AppInfo>();
  @$core.pragma('dart2js:noInline')
  static AppInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AppInfo>(create);
  static AppInfo _defaultInstance;

  @$pb.TagNumber(1)
  Platform get platform => $_getN(0);
  @$pb.TagNumber(1)
  set platform(Platform v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPlatform() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlatform() => clearField(1);

  @$pb.TagNumber(2)
  Mode get mode => $_getN(1);
  @$pb.TagNumber(2)
  set mode(Mode v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasMode() => $_has(1);
  @$pb.TagNumber(2)
  void clearMode() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get deviceName => $_getSZ(2);
  @$pb.TagNumber(3)
  set deviceName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDeviceName() => $_has(2);
  @$pb.TagNumber(3)
  void clearDeviceName() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get autoApiVersion => $_getIZ(3);
  @$pb.TagNumber(4)
  set autoApiVersion($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAutoApiVersion() => $_has(3);
  @$pb.TagNumber(4)
  void clearAutoApiVersion() => clearField(4);

  @$pb.TagNumber(6)
  $core.double get devicePixelRatio => $_getN(4);
  @$pb.TagNumber(6)
  set devicePixelRatio($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasDevicePixelRatio() => $_has(4);
  @$pb.TagNumber(6)
  void clearDevicePixelRatio() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get textScaleFactor => $_getN(5);
  @$pb.TagNumber(7)
  set textScaleFactor($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(7)
  $core.bool hasTextScaleFactor() => $_has(5);
  @$pb.TagNumber(7)
  void clearTextScaleFactor() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get physicalHeight => $_getN(6);
  @$pb.TagNumber(8)
  set physicalHeight($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(8)
  $core.bool hasPhysicalHeight() => $_has(6);
  @$pb.TagNumber(8)
  void clearPhysicalHeight() => clearField(8);

  @$pb.TagNumber(9)
  $core.double get physicalWidth => $_getN(7);
  @$pb.TagNumber(9)
  set physicalWidth($core.double v) { $_setDouble(7, v); }
  @$pb.TagNumber(9)
  $core.bool hasPhysicalWidth() => $_has(7);
  @$pb.TagNumber(9)
  void clearPhysicalWidth() => clearField(9);
}

