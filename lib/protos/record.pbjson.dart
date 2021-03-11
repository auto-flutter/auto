///
//  Generated code. Do not modify.
//  source: record.proto
//
// @dart = 2.7
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

const RecordType$json = const {
  '1': 'RecordType',
  '2': const [
    const {'1': 'unknown', '2': 0},
    const {'1': 'pointer', '2': 1},
    const {'1': 'softKeyboard', '2': 2},
    const {'1': 'delay', '2': 3},
    const {'1': 'snapshot', '2': 4},
    const {'1': 'disableKeyboard', '2': 5},
    const {'1': 'enableKeyboard', '2': 6},
  ],
};

const RecordPacket$json = const {
  '1': 'RecordPacket',
  '2': const [
    const {'1': 'data', '3': 1, '4': 3, '5': 11, '6': '.Record', '10': 'data'},
  ],
};

const Record$json = const {
  '1': 'Record',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.RecordType', '10': 'type'},
    const {'1': 'delay', '3': 2, '4': 1, '5': 3, '10': 'delay'},
    const {'1': 'pointer', '3': 3, '4': 3, '5': 11, '6': '.PointerRecord', '10': 'pointer'},
    const {'1': 'softKeyboard', '3': 4, '4': 1, '5': 12, '10': 'softKeyboard'},
  ],
};

const PointerRecord$json = const {
  '1': 'PointerRecord',
  '2': const [
    const {'1': 'embedderId', '3': 1, '4': 1, '5': 3, '10': 'embedderId'},
    const {'1': 'timeStamp', '3': 2, '4': 1, '5': 3, '10': 'timeStamp'},
    const {'1': 'change', '3': 3, '4': 1, '5': 3, '10': 'change'},
    const {'1': 'kind', '3': 4, '4': 1, '5': 3, '10': 'kind'},
    const {'1': 'signalKind', '3': 5, '4': 1, '5': 3, '10': 'signalKind'},
    const {'1': 'device', '3': 6, '4': 1, '5': 3, '10': 'device'},
    const {'1': 'pointerIdentifier', '3': 7, '4': 1, '5': 3, '10': 'pointerIdentifier'},
    const {'1': 'physicalX', '3': 8, '4': 1, '5': 1, '10': 'physicalX'},
    const {'1': 'physicalY', '3': 9, '4': 1, '5': 1, '10': 'physicalY'},
    const {'1': 'physicalDeltaX', '3': 10, '4': 1, '5': 1, '10': 'physicalDeltaX'},
    const {'1': 'physicalDeltaY', '3': 11, '4': 1, '5': 1, '10': 'physicalDeltaY'},
    const {'1': 'buttons', '3': 12, '4': 1, '5': 3, '10': 'buttons'},
    const {'1': 'obscured', '3': 13, '4': 1, '5': 8, '10': 'obscured'},
    const {'1': 'synthesized', '3': 14, '4': 1, '5': 8, '10': 'synthesized'},
    const {'1': 'pressure', '3': 15, '4': 1, '5': 1, '10': 'pressure'},
    const {'1': 'pressureMin', '3': 16, '4': 1, '5': 1, '10': 'pressureMin'},
    const {'1': 'pressureMax', '3': 17, '4': 1, '5': 1, '10': 'pressureMax'},
    const {'1': 'distance', '3': 18, '4': 1, '5': 1, '10': 'distance'},
    const {'1': 'distanceMax', '3': 19, '4': 1, '5': 1, '10': 'distanceMax'},
    const {'1': 'size', '3': 20, '4': 1, '5': 1, '10': 'size'},
    const {'1': 'radiusMajor', '3': 21, '4': 1, '5': 1, '10': 'radiusMajor'},
    const {'1': 'radiusMinor', '3': 22, '4': 1, '5': 1, '10': 'radiusMinor'},
    const {'1': 'radiusMin', '3': 23, '4': 1, '5': 1, '10': 'radiusMin'},
    const {'1': 'radiusMax', '3': 24, '4': 1, '5': 1, '10': 'radiusMax'},
    const {'1': 'orientation', '3': 25, '4': 1, '5': 1, '10': 'orientation'},
    const {'1': 'tilt', '3': 26, '4': 1, '5': 1, '10': 'tilt'},
    const {'1': 'scrollDeltaX', '3': 27, '4': 1, '5': 1, '10': 'scrollDeltaX'},
    const {'1': 'scrollDeltaY', '3': 28, '4': 1, '5': 1, '10': 'scrollDeltaY'},
    const {'1': 'platformData', '3': 29, '4': 1, '5': 3, '10': 'platformData'},
  ],
};

