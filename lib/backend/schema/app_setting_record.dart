import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppSettingRecord extends FirestoreRecord {
  AppSettingRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_names" field.
  List<String>? _userNames;
  List<String> get userNames => _userNames ?? const [];
  bool hasUserNames() => _userNames != null;

  void _initializeFields() {
    _userNames = getDataList(snapshotData['user_names']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('appSetting');

  static Stream<AppSettingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppSettingRecord.fromSnapshot(s));

  static Future<AppSettingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppSettingRecord.fromSnapshot(s));

  static AppSettingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppSettingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppSettingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppSettingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppSettingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppSettingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppSettingRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class AppSettingRecordDocumentEquality implements Equality<AppSettingRecord> {
  const AppSettingRecordDocumentEquality();

  @override
  bool equals(AppSettingRecord? e1, AppSettingRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.userNames, e2?.userNames);
  }

  @override
  int hash(AppSettingRecord? e) => const ListEquality().hash([e?.userNames]);

  @override
  bool isValidKey(Object? o) => o is AppSettingRecord;
}
