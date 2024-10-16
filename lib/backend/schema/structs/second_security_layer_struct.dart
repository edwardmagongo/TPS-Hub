// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SecondSecurityLayerStruct extends FFFirebaseStruct {
  SecondSecurityLayerStruct({
    bool? enable,
    bool? userEnabled,
    bool? pinCodeIsEnabled,
    bool? biometricIsEnabled,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _enable = enable,
        _userEnabled = userEnabled,
        _pinCodeIsEnabled = pinCodeIsEnabled,
        _biometricIsEnabled = biometricIsEnabled,
        super(firestoreUtilData);

  // "enable" field.
  bool? _enable;
  bool get enable => _enable ?? false;
  set enable(bool? val) => _enable = val;

  bool hasEnable() => _enable != null;

  // "userEnabled" field.
  bool? _userEnabled;
  bool get userEnabled => _userEnabled ?? false;
  set userEnabled(bool? val) => _userEnabled = val;

  bool hasUserEnabled() => _userEnabled != null;

  // "pinCodeIsEnabled" field.
  bool? _pinCodeIsEnabled;
  bool get pinCodeIsEnabled => _pinCodeIsEnabled ?? false;
  set pinCodeIsEnabled(bool? val) => _pinCodeIsEnabled = val;

  bool hasPinCodeIsEnabled() => _pinCodeIsEnabled != null;

  // "BiometricIsEnabled" field.
  bool? _biometricIsEnabled;
  bool get biometricIsEnabled => _biometricIsEnabled ?? false;
  set biometricIsEnabled(bool? val) => _biometricIsEnabled = val;

  bool hasBiometricIsEnabled() => _biometricIsEnabled != null;

  static SecondSecurityLayerStruct fromMap(Map<String, dynamic> data) =>
      SecondSecurityLayerStruct(
        enable: data['enable'] as bool?,
        userEnabled: data['userEnabled'] as bool?,
        pinCodeIsEnabled: data['pinCodeIsEnabled'] as bool?,
        biometricIsEnabled: data['BiometricIsEnabled'] as bool?,
      );

  static SecondSecurityLayerStruct? maybeFromMap(dynamic data) => data is Map
      ? SecondSecurityLayerStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'enable': _enable,
        'userEnabled': _userEnabled,
        'pinCodeIsEnabled': _pinCodeIsEnabled,
        'BiometricIsEnabled': _biometricIsEnabled,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'enable': serializeParam(
          _enable,
          ParamType.bool,
        ),
        'userEnabled': serializeParam(
          _userEnabled,
          ParamType.bool,
        ),
        'pinCodeIsEnabled': serializeParam(
          _pinCodeIsEnabled,
          ParamType.bool,
        ),
        'BiometricIsEnabled': serializeParam(
          _biometricIsEnabled,
          ParamType.bool,
        ),
      }.withoutNulls;

  static SecondSecurityLayerStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SecondSecurityLayerStruct(
        enable: deserializeParam(
          data['enable'],
          ParamType.bool,
          false,
        ),
        userEnabled: deserializeParam(
          data['userEnabled'],
          ParamType.bool,
          false,
        ),
        pinCodeIsEnabled: deserializeParam(
          data['pinCodeIsEnabled'],
          ParamType.bool,
          false,
        ),
        biometricIsEnabled: deserializeParam(
          data['BiometricIsEnabled'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'SecondSecurityLayerStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SecondSecurityLayerStruct &&
        enable == other.enable &&
        userEnabled == other.userEnabled &&
        pinCodeIsEnabled == other.pinCodeIsEnabled &&
        biometricIsEnabled == other.biometricIsEnabled;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([enable, userEnabled, pinCodeIsEnabled, biometricIsEnabled]);
}

SecondSecurityLayerStruct createSecondSecurityLayerStruct({
  bool? enable,
  bool? userEnabled,
  bool? pinCodeIsEnabled,
  bool? biometricIsEnabled,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SecondSecurityLayerStruct(
      enable: enable,
      userEnabled: userEnabled,
      pinCodeIsEnabled: pinCodeIsEnabled,
      biometricIsEnabled: biometricIsEnabled,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SecondSecurityLayerStruct? updateSecondSecurityLayerStruct(
  SecondSecurityLayerStruct? secondSecurityLayer, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    secondSecurityLayer
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSecondSecurityLayerStructData(
  Map<String, dynamic> firestoreData,
  SecondSecurityLayerStruct? secondSecurityLayer,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (secondSecurityLayer == null) {
    return;
  }
  if (secondSecurityLayer.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && secondSecurityLayer.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final secondSecurityLayerData =
      getSecondSecurityLayerFirestoreData(secondSecurityLayer, forFieldValue);
  final nestedData =
      secondSecurityLayerData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      secondSecurityLayer.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSecondSecurityLayerFirestoreData(
  SecondSecurityLayerStruct? secondSecurityLayer, [
  bool forFieldValue = false,
]) {
  if (secondSecurityLayer == null) {
    return {};
  }
  final firestoreData = mapToFirestore(secondSecurityLayer.toMap());

  // Add any Firestore field values
  secondSecurityLayer.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSecondSecurityLayerListFirestoreData(
  List<SecondSecurityLayerStruct>? secondSecurityLayers,
) =>
    secondSecurityLayers
        ?.map((e) => getSecondSecurityLayerFirestoreData(e, true))
        .toList() ??
    [];
