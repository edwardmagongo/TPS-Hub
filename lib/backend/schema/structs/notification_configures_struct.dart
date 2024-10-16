// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationConfiguresStruct extends FFFirebaseStruct {
  NotificationConfiguresStruct({
    bool? enableNotification,
    bool? sound,
    bool? vibrate,
    bool? newProject,
    bool? appUpdates,
    bool? newPosts,
    bool? newTips,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _enableNotification = enableNotification,
        _sound = sound,
        _vibrate = vibrate,
        _newProject = newProject,
        _appUpdates = appUpdates,
        _newPosts = newPosts,
        _newTips = newTips,
        super(firestoreUtilData);

  // "EnableNotification" field.
  bool? _enableNotification;
  bool get enableNotification => _enableNotification ?? false;
  set enableNotification(bool? val) => _enableNotification = val;

  bool hasEnableNotification() => _enableNotification != null;

  // "Sound" field.
  bool? _sound;
  bool get sound => _sound ?? false;
  set sound(bool? val) => _sound = val;

  bool hasSound() => _sound != null;

  // "Vibrate" field.
  bool? _vibrate;
  bool get vibrate => _vibrate ?? false;
  set vibrate(bool? val) => _vibrate = val;

  bool hasVibrate() => _vibrate != null;

  // "NewProject" field.
  bool? _newProject;
  bool get newProject => _newProject ?? false;
  set newProject(bool? val) => _newProject = val;

  bool hasNewProject() => _newProject != null;

  // "AppUpdates" field.
  bool? _appUpdates;
  bool get appUpdates => _appUpdates ?? false;
  set appUpdates(bool? val) => _appUpdates = val;

  bool hasAppUpdates() => _appUpdates != null;

  // "NewPosts" field.
  bool? _newPosts;
  bool get newPosts => _newPosts ?? false;
  set newPosts(bool? val) => _newPosts = val;

  bool hasNewPosts() => _newPosts != null;

  // "NewTips" field.
  bool? _newTips;
  bool get newTips => _newTips ?? false;
  set newTips(bool? val) => _newTips = val;

  bool hasNewTips() => _newTips != null;

  static NotificationConfiguresStruct fromMap(Map<String, dynamic> data) =>
      NotificationConfiguresStruct(
        enableNotification: data['EnableNotification'] as bool?,
        sound: data['Sound'] as bool?,
        vibrate: data['Vibrate'] as bool?,
        newProject: data['NewProject'] as bool?,
        appUpdates: data['AppUpdates'] as bool?,
        newPosts: data['NewPosts'] as bool?,
        newTips: data['NewTips'] as bool?,
      );

  static NotificationConfiguresStruct? maybeFromMap(dynamic data) => data is Map
      ? NotificationConfiguresStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'EnableNotification': _enableNotification,
        'Sound': _sound,
        'Vibrate': _vibrate,
        'NewProject': _newProject,
        'AppUpdates': _appUpdates,
        'NewPosts': _newPosts,
        'NewTips': _newTips,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'EnableNotification': serializeParam(
          _enableNotification,
          ParamType.bool,
        ),
        'Sound': serializeParam(
          _sound,
          ParamType.bool,
        ),
        'Vibrate': serializeParam(
          _vibrate,
          ParamType.bool,
        ),
        'NewProject': serializeParam(
          _newProject,
          ParamType.bool,
        ),
        'AppUpdates': serializeParam(
          _appUpdates,
          ParamType.bool,
        ),
        'NewPosts': serializeParam(
          _newPosts,
          ParamType.bool,
        ),
        'NewTips': serializeParam(
          _newTips,
          ParamType.bool,
        ),
      }.withoutNulls;

  static NotificationConfiguresStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      NotificationConfiguresStruct(
        enableNotification: deserializeParam(
          data['EnableNotification'],
          ParamType.bool,
          false,
        ),
        sound: deserializeParam(
          data['Sound'],
          ParamType.bool,
          false,
        ),
        vibrate: deserializeParam(
          data['Vibrate'],
          ParamType.bool,
          false,
        ),
        newProject: deserializeParam(
          data['NewProject'],
          ParamType.bool,
          false,
        ),
        appUpdates: deserializeParam(
          data['AppUpdates'],
          ParamType.bool,
          false,
        ),
        newPosts: deserializeParam(
          data['NewPosts'],
          ParamType.bool,
          false,
        ),
        newTips: deserializeParam(
          data['NewTips'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'NotificationConfiguresStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NotificationConfiguresStruct &&
        enableNotification == other.enableNotification &&
        sound == other.sound &&
        vibrate == other.vibrate &&
        newProject == other.newProject &&
        appUpdates == other.appUpdates &&
        newPosts == other.newPosts &&
        newTips == other.newTips;
  }

  @override
  int get hashCode => const ListEquality().hash([
        enableNotification,
        sound,
        vibrate,
        newProject,
        appUpdates,
        newPosts,
        newTips
      ]);
}

NotificationConfiguresStruct createNotificationConfiguresStruct({
  bool? enableNotification,
  bool? sound,
  bool? vibrate,
  bool? newProject,
  bool? appUpdates,
  bool? newPosts,
  bool? newTips,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NotificationConfiguresStruct(
      enableNotification: enableNotification,
      sound: sound,
      vibrate: vibrate,
      newProject: newProject,
      appUpdates: appUpdates,
      newPosts: newPosts,
      newTips: newTips,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NotificationConfiguresStruct? updateNotificationConfiguresStruct(
  NotificationConfiguresStruct? notificationConfigures, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    notificationConfigures
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNotificationConfiguresStructData(
  Map<String, dynamic> firestoreData,
  NotificationConfiguresStruct? notificationConfigures,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (notificationConfigures == null) {
    return;
  }
  if (notificationConfigures.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      notificationConfigures.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final notificationConfiguresData = getNotificationConfiguresFirestoreData(
      notificationConfigures, forFieldValue);
  final nestedData =
      notificationConfiguresData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      notificationConfigures.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNotificationConfiguresFirestoreData(
  NotificationConfiguresStruct? notificationConfigures, [
  bool forFieldValue = false,
]) {
  if (notificationConfigures == null) {
    return {};
  }
  final firestoreData = mapToFirestore(notificationConfigures.toMap());

  // Add any Firestore field values
  notificationConfigures.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNotificationConfiguresListFirestoreData(
  List<NotificationConfiguresStruct>? notificationConfiguress,
) =>
    notificationConfiguress
        ?.map((e) => getNotificationConfiguresFirestoreData(e, true))
        .toList() ??
    [];
