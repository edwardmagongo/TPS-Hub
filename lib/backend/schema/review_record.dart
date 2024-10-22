import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReviewRecord extends FirestoreRecord {
  ReviewRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "product_ref" field.
  DocumentReference? _productRef;
  DocumentReference? get productRef => _productRef;
  bool hasProductRef() => _productRef != null;

  // "review_information" field.
  ReviewStruct? _reviewInformation;
  ReviewStruct get reviewInformation => _reviewInformation ?? ReviewStruct();
  bool hasReviewInformation() => _reviewInformation != null;

  void _initializeFields() {
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _productRef = snapshotData['product_ref'] as DocumentReference?;
    _reviewInformation =
        ReviewStruct.maybeFromMap(snapshotData['review_information']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('review');

  static Stream<ReviewRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReviewRecord.fromSnapshot(s));

  static Future<ReviewRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReviewRecord.fromSnapshot(s));

  static ReviewRecord fromSnapshot(DocumentSnapshot snapshot) => ReviewRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReviewRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReviewRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReviewRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReviewRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReviewRecordData({
  DocumentReference? userRef,
  DocumentReference? productRef,
  ReviewStruct? reviewInformation,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_ref': userRef,
      'product_ref': productRef,
      'review_information': ReviewStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "review_information" field.
  addReviewStructData(firestoreData, reviewInformation, 'review_information');

  return firestoreData;
}

class ReviewRecordDocumentEquality implements Equality<ReviewRecord> {
  const ReviewRecordDocumentEquality();

  @override
  bool equals(ReviewRecord? e1, ReviewRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.productRef == e2?.productRef &&
        e1?.reviewInformation == e2?.reviewInformation;
  }

  @override
  int hash(ReviewRecord? e) => const ListEquality()
      .hash([e?.userRef, e?.productRef, e?.reviewInformation]);

  @override
  bool isValidKey(Object? o) => o is ReviewRecord;
}
