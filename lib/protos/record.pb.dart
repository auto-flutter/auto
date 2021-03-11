///
//  Generated code. Do not modify.
//  source: record.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'record.pbenum.dart';

export 'record.pbenum.dart';

class RecordPacket extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RecordPacket', createEmptyInstance: create)
    ..pc<Record>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', $pb.PbFieldType.PM, subBuilder: Record.create)
    ..hasRequiredFields = false
  ;

  RecordPacket._() : super();
  factory RecordPacket({
    $core.Iterable<Record> data,
  }) {
    final _result = create();
    if (data != null) {
      _result.data.addAll(data);
    }
    return _result;
  }
  factory RecordPacket.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RecordPacket.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RecordPacket clone() => RecordPacket()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RecordPacket copyWith(void Function(RecordPacket) updates) => super.copyWith((message) => updates(message as RecordPacket)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RecordPacket create() => RecordPacket._();
  RecordPacket createEmptyInstance() => create();
  static $pb.PbList<RecordPacket> createRepeated() => $pb.PbList<RecordPacket>();
  @$core.pragma('dart2js:noInline')
  static RecordPacket getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RecordPacket>(create);
  static RecordPacket _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Record> get data => $_getList(0);
}

class Record extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Record', createEmptyInstance: create)
    ..e<RecordType>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: RecordType.unknown, valueOf: RecordType.valueOf, enumValues: RecordType.values)
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'delay')
    ..pc<PointerRecord>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pointer', $pb.PbFieldType.PM, subBuilder: PointerRecord.create)
    ..a<$core.List<$core.int>>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'softKeyboard', $pb.PbFieldType.OY, protoName: 'softKeyboard')
    ..hasRequiredFields = false
  ;

  Record._() : super();
  factory Record({
    RecordType type,
    $fixnum.Int64 delay,
    $core.Iterable<PointerRecord> pointer,
    $core.List<$core.int> softKeyboard,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (delay != null) {
      _result.delay = delay;
    }
    if (pointer != null) {
      _result.pointer.addAll(pointer);
    }
    if (softKeyboard != null) {
      _result.softKeyboard = softKeyboard;
    }
    return _result;
  }
  factory Record.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Record.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Record clone() => Record()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Record copyWith(void Function(Record) updates) => super.copyWith((message) => updates(message as Record)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Record create() => Record._();
  Record createEmptyInstance() => create();
  static $pb.PbList<Record> createRepeated() => $pb.PbList<Record>();
  @$core.pragma('dart2js:noInline')
  static Record getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Record>(create);
  static Record _defaultInstance;

  @$pb.TagNumber(1)
  RecordType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(RecordType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get delay => $_getI64(1);
  @$pb.TagNumber(2)
  set delay($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDelay() => $_has(1);
  @$pb.TagNumber(2)
  void clearDelay() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<PointerRecord> get pointer => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<$core.int> get softKeyboard => $_getN(3);
  @$pb.TagNumber(4)
  set softKeyboard($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSoftKeyboard() => $_has(3);
  @$pb.TagNumber(4)
  void clearSoftKeyboard() => clearField(4);
}

class PointerRecord extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PointerRecord', createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'embedderId', protoName: 'embedderId')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'timeStamp', protoName: 'timeStamp')
    ..aInt64(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'change')
    ..aInt64(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'kind')
    ..aInt64(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'signalKind', protoName: 'signalKind')
    ..aInt64(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'device')
    ..aInt64(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pointerIdentifier', protoName: 'pointerIdentifier')
    ..a<$core.double>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'physicalX', $pb.PbFieldType.OD, protoName: 'physicalX')
    ..a<$core.double>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'physicalY', $pb.PbFieldType.OD, protoName: 'physicalY')
    ..a<$core.double>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'physicalDeltaX', $pb.PbFieldType.OD, protoName: 'physicalDeltaX')
    ..a<$core.double>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'physicalDeltaY', $pb.PbFieldType.OD, protoName: 'physicalDeltaY')
    ..aInt64(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'buttons')
    ..aOB(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'obscured')
    ..aOB(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'synthesized')
    ..a<$core.double>(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pressure', $pb.PbFieldType.OD)
    ..a<$core.double>(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pressureMin', $pb.PbFieldType.OD, protoName: 'pressureMin')
    ..a<$core.double>(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pressureMax', $pb.PbFieldType.OD, protoName: 'pressureMax')
    ..a<$core.double>(18, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'distance', $pb.PbFieldType.OD)
    ..a<$core.double>(19, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'distanceMax', $pb.PbFieldType.OD, protoName: 'distanceMax')
    ..a<$core.double>(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'size', $pb.PbFieldType.OD)
    ..a<$core.double>(21, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'radiusMajor', $pb.PbFieldType.OD, protoName: 'radiusMajor')
    ..a<$core.double>(22, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'radiusMinor', $pb.PbFieldType.OD, protoName: 'radiusMinor')
    ..a<$core.double>(23, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'radiusMin', $pb.PbFieldType.OD, protoName: 'radiusMin')
    ..a<$core.double>(24, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'radiusMax', $pb.PbFieldType.OD, protoName: 'radiusMax')
    ..a<$core.double>(25, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orientation', $pb.PbFieldType.OD)
    ..a<$core.double>(26, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tilt', $pb.PbFieldType.OD)
    ..a<$core.double>(27, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'scrollDeltaX', $pb.PbFieldType.OD, protoName: 'scrollDeltaX')
    ..a<$core.double>(28, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'scrollDeltaY', $pb.PbFieldType.OD, protoName: 'scrollDeltaY')
    ..aInt64(29, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'platformData', protoName: 'platformData')
    ..hasRequiredFields = false
  ;

  PointerRecord._() : super();
  factory PointerRecord({
    $fixnum.Int64 embedderId,
    $fixnum.Int64 timeStamp,
    $fixnum.Int64 change,
    $fixnum.Int64 kind,
    $fixnum.Int64 signalKind,
    $fixnum.Int64 device,
    $fixnum.Int64 pointerIdentifier,
    $core.double physicalX,
    $core.double physicalY,
    $core.double physicalDeltaX,
    $core.double physicalDeltaY,
    $fixnum.Int64 buttons,
    $core.bool obscured,
    $core.bool synthesized,
    $core.double pressure,
    $core.double pressureMin,
    $core.double pressureMax,
    $core.double distance,
    $core.double distanceMax,
    $core.double size,
    $core.double radiusMajor,
    $core.double radiusMinor,
    $core.double radiusMin,
    $core.double radiusMax,
    $core.double orientation,
    $core.double tilt,
    $core.double scrollDeltaX,
    $core.double scrollDeltaY,
    $fixnum.Int64 platformData,
  }) {
    final _result = create();
    if (embedderId != null) {
      _result.embedderId = embedderId;
    }
    if (timeStamp != null) {
      _result.timeStamp = timeStamp;
    }
    if (change != null) {
      _result.change = change;
    }
    if (kind != null) {
      _result.kind = kind;
    }
    if (signalKind != null) {
      _result.signalKind = signalKind;
    }
    if (device != null) {
      _result.device = device;
    }
    if (pointerIdentifier != null) {
      _result.pointerIdentifier = pointerIdentifier;
    }
    if (physicalX != null) {
      _result.physicalX = physicalX;
    }
    if (physicalY != null) {
      _result.physicalY = physicalY;
    }
    if (physicalDeltaX != null) {
      _result.physicalDeltaX = physicalDeltaX;
    }
    if (physicalDeltaY != null) {
      _result.physicalDeltaY = physicalDeltaY;
    }
    if (buttons != null) {
      _result.buttons = buttons;
    }
    if (obscured != null) {
      _result.obscured = obscured;
    }
    if (synthesized != null) {
      _result.synthesized = synthesized;
    }
    if (pressure != null) {
      _result.pressure = pressure;
    }
    if (pressureMin != null) {
      _result.pressureMin = pressureMin;
    }
    if (pressureMax != null) {
      _result.pressureMax = pressureMax;
    }
    if (distance != null) {
      _result.distance = distance;
    }
    if (distanceMax != null) {
      _result.distanceMax = distanceMax;
    }
    if (size != null) {
      _result.size = size;
    }
    if (radiusMajor != null) {
      _result.radiusMajor = radiusMajor;
    }
    if (radiusMinor != null) {
      _result.radiusMinor = radiusMinor;
    }
    if (radiusMin != null) {
      _result.radiusMin = radiusMin;
    }
    if (radiusMax != null) {
      _result.radiusMax = radiusMax;
    }
    if (orientation != null) {
      _result.orientation = orientation;
    }
    if (tilt != null) {
      _result.tilt = tilt;
    }
    if (scrollDeltaX != null) {
      _result.scrollDeltaX = scrollDeltaX;
    }
    if (scrollDeltaY != null) {
      _result.scrollDeltaY = scrollDeltaY;
    }
    if (platformData != null) {
      _result.platformData = platformData;
    }
    return _result;
  }
  factory PointerRecord.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PointerRecord.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PointerRecord clone() => PointerRecord()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PointerRecord copyWith(void Function(PointerRecord) updates) => super.copyWith((message) => updates(message as PointerRecord)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PointerRecord create() => PointerRecord._();
  PointerRecord createEmptyInstance() => create();
  static $pb.PbList<PointerRecord> createRepeated() => $pb.PbList<PointerRecord>();
  @$core.pragma('dart2js:noInline')
  static PointerRecord getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PointerRecord>(create);
  static PointerRecord _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get embedderId => $_getI64(0);
  @$pb.TagNumber(1)
  set embedderId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmbedderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmbedderId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get timeStamp => $_getI64(1);
  @$pb.TagNumber(2)
  set timeStamp($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTimeStamp() => $_has(1);
  @$pb.TagNumber(2)
  void clearTimeStamp() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get change => $_getI64(2);
  @$pb.TagNumber(3)
  set change($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasChange() => $_has(2);
  @$pb.TagNumber(3)
  void clearChange() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get kind => $_getI64(3);
  @$pb.TagNumber(4)
  set kind($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasKind() => $_has(3);
  @$pb.TagNumber(4)
  void clearKind() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get signalKind => $_getI64(4);
  @$pb.TagNumber(5)
  set signalKind($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSignalKind() => $_has(4);
  @$pb.TagNumber(5)
  void clearSignalKind() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get device => $_getI64(5);
  @$pb.TagNumber(6)
  set device($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDevice() => $_has(5);
  @$pb.TagNumber(6)
  void clearDevice() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get pointerIdentifier => $_getI64(6);
  @$pb.TagNumber(7)
  set pointerIdentifier($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasPointerIdentifier() => $_has(6);
  @$pb.TagNumber(7)
  void clearPointerIdentifier() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get physicalX => $_getN(7);
  @$pb.TagNumber(8)
  set physicalX($core.double v) { $_setDouble(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasPhysicalX() => $_has(7);
  @$pb.TagNumber(8)
  void clearPhysicalX() => clearField(8);

  @$pb.TagNumber(9)
  $core.double get physicalY => $_getN(8);
  @$pb.TagNumber(9)
  set physicalY($core.double v) { $_setDouble(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasPhysicalY() => $_has(8);
  @$pb.TagNumber(9)
  void clearPhysicalY() => clearField(9);

  @$pb.TagNumber(10)
  $core.double get physicalDeltaX => $_getN(9);
  @$pb.TagNumber(10)
  set physicalDeltaX($core.double v) { $_setDouble(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasPhysicalDeltaX() => $_has(9);
  @$pb.TagNumber(10)
  void clearPhysicalDeltaX() => clearField(10);

  @$pb.TagNumber(11)
  $core.double get physicalDeltaY => $_getN(10);
  @$pb.TagNumber(11)
  set physicalDeltaY($core.double v) { $_setDouble(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasPhysicalDeltaY() => $_has(10);
  @$pb.TagNumber(11)
  void clearPhysicalDeltaY() => clearField(11);

  @$pb.TagNumber(12)
  $fixnum.Int64 get buttons => $_getI64(11);
  @$pb.TagNumber(12)
  set buttons($fixnum.Int64 v) { $_setInt64(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasButtons() => $_has(11);
  @$pb.TagNumber(12)
  void clearButtons() => clearField(12);

  @$pb.TagNumber(13)
  $core.bool get obscured => $_getBF(12);
  @$pb.TagNumber(13)
  set obscured($core.bool v) { $_setBool(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasObscured() => $_has(12);
  @$pb.TagNumber(13)
  void clearObscured() => clearField(13);

  @$pb.TagNumber(14)
  $core.bool get synthesized => $_getBF(13);
  @$pb.TagNumber(14)
  set synthesized($core.bool v) { $_setBool(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasSynthesized() => $_has(13);
  @$pb.TagNumber(14)
  void clearSynthesized() => clearField(14);

  @$pb.TagNumber(15)
  $core.double get pressure => $_getN(14);
  @$pb.TagNumber(15)
  set pressure($core.double v) { $_setDouble(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasPressure() => $_has(14);
  @$pb.TagNumber(15)
  void clearPressure() => clearField(15);

  @$pb.TagNumber(16)
  $core.double get pressureMin => $_getN(15);
  @$pb.TagNumber(16)
  set pressureMin($core.double v) { $_setDouble(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasPressureMin() => $_has(15);
  @$pb.TagNumber(16)
  void clearPressureMin() => clearField(16);

  @$pb.TagNumber(17)
  $core.double get pressureMax => $_getN(16);
  @$pb.TagNumber(17)
  set pressureMax($core.double v) { $_setDouble(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasPressureMax() => $_has(16);
  @$pb.TagNumber(17)
  void clearPressureMax() => clearField(17);

  @$pb.TagNumber(18)
  $core.double get distance => $_getN(17);
  @$pb.TagNumber(18)
  set distance($core.double v) { $_setDouble(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasDistance() => $_has(17);
  @$pb.TagNumber(18)
  void clearDistance() => clearField(18);

  @$pb.TagNumber(19)
  $core.double get distanceMax => $_getN(18);
  @$pb.TagNumber(19)
  set distanceMax($core.double v) { $_setDouble(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasDistanceMax() => $_has(18);
  @$pb.TagNumber(19)
  void clearDistanceMax() => clearField(19);

  @$pb.TagNumber(20)
  $core.double get size => $_getN(19);
  @$pb.TagNumber(20)
  set size($core.double v) { $_setDouble(19, v); }
  @$pb.TagNumber(20)
  $core.bool hasSize() => $_has(19);
  @$pb.TagNumber(20)
  void clearSize() => clearField(20);

  @$pb.TagNumber(21)
  $core.double get radiusMajor => $_getN(20);
  @$pb.TagNumber(21)
  set radiusMajor($core.double v) { $_setDouble(20, v); }
  @$pb.TagNumber(21)
  $core.bool hasRadiusMajor() => $_has(20);
  @$pb.TagNumber(21)
  void clearRadiusMajor() => clearField(21);

  @$pb.TagNumber(22)
  $core.double get radiusMinor => $_getN(21);
  @$pb.TagNumber(22)
  set radiusMinor($core.double v) { $_setDouble(21, v); }
  @$pb.TagNumber(22)
  $core.bool hasRadiusMinor() => $_has(21);
  @$pb.TagNumber(22)
  void clearRadiusMinor() => clearField(22);

  @$pb.TagNumber(23)
  $core.double get radiusMin => $_getN(22);
  @$pb.TagNumber(23)
  set radiusMin($core.double v) { $_setDouble(22, v); }
  @$pb.TagNumber(23)
  $core.bool hasRadiusMin() => $_has(22);
  @$pb.TagNumber(23)
  void clearRadiusMin() => clearField(23);

  @$pb.TagNumber(24)
  $core.double get radiusMax => $_getN(23);
  @$pb.TagNumber(24)
  set radiusMax($core.double v) { $_setDouble(23, v); }
  @$pb.TagNumber(24)
  $core.bool hasRadiusMax() => $_has(23);
  @$pb.TagNumber(24)
  void clearRadiusMax() => clearField(24);

  @$pb.TagNumber(25)
  $core.double get orientation => $_getN(24);
  @$pb.TagNumber(25)
  set orientation($core.double v) { $_setDouble(24, v); }
  @$pb.TagNumber(25)
  $core.bool hasOrientation() => $_has(24);
  @$pb.TagNumber(25)
  void clearOrientation() => clearField(25);

  @$pb.TagNumber(26)
  $core.double get tilt => $_getN(25);
  @$pb.TagNumber(26)
  set tilt($core.double v) { $_setDouble(25, v); }
  @$pb.TagNumber(26)
  $core.bool hasTilt() => $_has(25);
  @$pb.TagNumber(26)
  void clearTilt() => clearField(26);

  @$pb.TagNumber(27)
  $core.double get scrollDeltaX => $_getN(26);
  @$pb.TagNumber(27)
  set scrollDeltaX($core.double v) { $_setDouble(26, v); }
  @$pb.TagNumber(27)
  $core.bool hasScrollDeltaX() => $_has(26);
  @$pb.TagNumber(27)
  void clearScrollDeltaX() => clearField(27);

  @$pb.TagNumber(28)
  $core.double get scrollDeltaY => $_getN(27);
  @$pb.TagNumber(28)
  set scrollDeltaY($core.double v) { $_setDouble(27, v); }
  @$pb.TagNumber(28)
  $core.bool hasScrollDeltaY() => $_has(27);
  @$pb.TagNumber(28)
  void clearScrollDeltaY() => clearField(28);

  @$pb.TagNumber(29)
  $fixnum.Int64 get platformData => $_getI64(28);
  @$pb.TagNumber(29)
  set platformData($fixnum.Int64 v) { $_setInt64(28, v); }
  @$pb.TagNumber(29)
  $core.bool hasPlatformData() => $_has(28);
  @$pb.TagNumber(29)
  void clearPlatformData() => clearField(29);
}

