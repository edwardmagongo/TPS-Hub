// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DefaultsStruct extends FFFirebaseStruct {
  DefaultsStruct({
    String? brandName,
    String? brandTagline,
    String? logo,
    String? avatarDefaultImage,
    String? imagesDefaultImage,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _brandName = brandName,
        _brandTagline = brandTagline,
        _logo = logo,
        _avatarDefaultImage = avatarDefaultImage,
        _imagesDefaultImage = imagesDefaultImage,
        super(firestoreUtilData);

  // "brandName" field.
  String? _brandName;
  String get brandName => _brandName ?? '';
  set brandName(String? val) => _brandName = val;

  bool hasBrandName() => _brandName != null;

  // "brandTagline" field.
  String? _brandTagline;
  String get brandTagline => _brandTagline ?? '';
  set brandTagline(String? val) => _brandTagline = val;

  bool hasBrandTagline() => _brandTagline != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  set logo(String? val) => _logo = val;

  bool hasLogo() => _logo != null;

  // "avatarDefaultImage" field.
  String? _avatarDefaultImage;
  String get avatarDefaultImage => _avatarDefaultImage ?? '';
  set avatarDefaultImage(String? val) => _avatarDefaultImage = val;

  bool hasAvatarDefaultImage() => _avatarDefaultImage != null;

  // "imagesDefaultImage" field.
  String? _imagesDefaultImage;
  String get imagesDefaultImage => _imagesDefaultImage ?? '';
  set imagesDefaultImage(String? val) => _imagesDefaultImage = val;

  bool hasImagesDefaultImage() => _imagesDefaultImage != null;

  static DefaultsStruct fromMap(Map<String, dynamic> data) => DefaultsStruct(
        brandName: data['brandName'] as String?,
        brandTagline: data['brandTagline'] as String?,
        logo: data['logo'] as String?,
        avatarDefaultImage: data['avatarDefaultImage'] as String?,
        imagesDefaultImage: data['imagesDefaultImage'] as String?,
      );

  static DefaultsStruct? maybeFromMap(dynamic data) =>
      data is Map ? DefaultsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'brandName': _brandName,
        'brandTagline': _brandTagline,
        'logo': _logo,
        'avatarDefaultImage': _avatarDefaultImage,
        'imagesDefaultImage': _imagesDefaultImage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'brandName': serializeParam(
          _brandName,
          ParamType.String,
        ),
        'brandTagline': serializeParam(
          _brandTagline,
          ParamType.String,
        ),
        'logo': serializeParam(
          _logo,
          ParamType.String,
        ),
        'avatarDefaultImage': serializeParam(
          _avatarDefaultImage,
          ParamType.String,
        ),
        'imagesDefaultImage': serializeParam(
          _imagesDefaultImage,
          ParamType.String,
        ),
      }.withoutNulls;

  static DefaultsStruct fromSerializableMap(Map<String, dynamic> data) =>
      DefaultsStruct(
        brandName: deserializeParam(
          data['brandName'],
          ParamType.String,
          false,
        ),
        brandTagline: deserializeParam(
          data['brandTagline'],
          ParamType.String,
          false,
        ),
        logo: deserializeParam(
          data['logo'],
          ParamType.String,
          false,
        ),
        avatarDefaultImage: deserializeParam(
          data['avatarDefaultImage'],
          ParamType.String,
          false,
        ),
        imagesDefaultImage: deserializeParam(
          data['imagesDefaultImage'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DefaultsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DefaultsStruct &&
        brandName == other.brandName &&
        brandTagline == other.brandTagline &&
        logo == other.logo &&
        avatarDefaultImage == other.avatarDefaultImage &&
        imagesDefaultImage == other.imagesDefaultImage;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [brandName, brandTagline, logo, avatarDefaultImage, imagesDefaultImage]);
}

DefaultsStruct createDefaultsStruct({
  String? brandName,
  String? brandTagline,
  String? logo,
  String? avatarDefaultImage,
  String? imagesDefaultImage,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DefaultsStruct(
      brandName: brandName,
      brandTagline: brandTagline,
      logo: logo,
      avatarDefaultImage: avatarDefaultImage,
      imagesDefaultImage: imagesDefaultImage,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DefaultsStruct? updateDefaultsStruct(
  DefaultsStruct? defaults, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    defaults
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDefaultsStructData(
  Map<String, dynamic> firestoreData,
  DefaultsStruct? defaults,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (defaults == null) {
    return;
  }
  if (defaults.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && defaults.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final defaultsData = getDefaultsFirestoreData(defaults, forFieldValue);
  final nestedData = defaultsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = defaults.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDefaultsFirestoreData(
  DefaultsStruct? defaults, [
  bool forFieldValue = false,
]) {
  if (defaults == null) {
    return {};
  }
  final firestoreData = mapToFirestore(defaults.toMap());

  // Add any Firestore field values
  defaults.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDefaultsListFirestoreData(
  List<DefaultsStruct>? defaultss,
) =>
    defaultss?.map((e) => getDefaultsFirestoreData(e, true)).toList() ?? [];
