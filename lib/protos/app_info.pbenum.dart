///
//  Generated code. Do not modify.
//  source: app_info.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Platform extends $pb.ProtobufEnum {
  static const Platform unknown = Platform._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'unknown');
  static const Platform android = Platform._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'android');
  static const Platform ios = Platform._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ios');
  static const Platform windows = Platform._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'windows');
  static const Platform macos = Platform._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'macos');
  static const Platform linux = Platform._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'linux');
  static const Platform web = Platform._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'web');

  static const $core.List<Platform> values = <Platform> [
    unknown,
    android,
    ios,
    windows,
    macos,
    linux,
    web,
  ];

  static final $core.Map<$core.int, Platform> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Platform valueOf($core.int value) => _byValue[value];

  const Platform._($core.int v, $core.String n) : super(v, n);
}

class Mode extends $pb.ProtobufEnum {
  static const Mode undefined = Mode._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'undefined');
  static const Mode debug = Mode._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'debug');
  static const Mode profile = Mode._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'profile');
  static const Mode release = Mode._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'release');

  static const $core.List<Mode> values = <Mode> [
    undefined,
    debug,
    profile,
    release,
  ];

  static final $core.Map<$core.int, Mode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Mode valueOf($core.int value) => _byValue[value];

  const Mode._($core.int v, $core.String n) : super(v, n);
}

