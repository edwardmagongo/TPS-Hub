import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SpecialOfferRecord extends FirestoreRecord {
  SpecialOfferRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "colour" field.
  Color? _colour;
  Color? get colour => _colour;
  bool hasColour() => _colour != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _image = snapshotData['image'] as String?;
    _colour = getSchemaColor(snapshotData['colour']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('specialOffer');

  static Stream<SpecialOfferRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SpecialOfferRecord.fromSnapshot(s));

  static Future<SpecialOfferRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SpecialOfferRecord.fromSnapshot(s));

  static SpecialOfferRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SpecialOfferRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SpecialOfferRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SpecialOfferRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SpecialOfferRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SpecialOfferRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSpecialOfferRecordData({
  String? title,
  String? description,
  String? image,
  Color? colour,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'image': image,
      'colour': colour,
    }.withoutNulls,
  );

  return firestoreData;
}

class SpecialOfferRecordDocumentEquality
    implements Equality<SpecialOfferRecord> {
  const SpecialOfferRecordDocumentEquality();

  @override
  bool equals(SpecialOfferRecord? e1, SpecialOfferRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.image == e2?.image &&
        e1?.colour == e2?.colour;
  }

  @override
  int hash(SpecialOfferRecord? e) => const ListEquality()
      .hash([e?.title, e?.description, e?.image, e?.colour]);

  @override
  bool isValidKey(Object? o) => o is SpecialOfferRecord;
}
