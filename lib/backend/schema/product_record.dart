import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductRecord extends FirestoreRecord {
  ProductRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "product_information" field.
  ProjectStruct? _productInformation;
  ProjectStruct get productInformation =>
      _productInformation ?? ProjectStruct();
  bool hasProductInformation() => _productInformation != null;

  // "product_id" field.
  String? _productId;
  String get productId => _productId ?? '';
  bool hasProductId() => _productId != null;

  // "special_offer" field.
  bool? _specialOffer;
  bool get specialOffer => _specialOffer ?? false;
  bool hasSpecialOffer() => _specialOffer != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "special_offer_ref" field.
  DocumentReference? _specialOfferRef;
  DocumentReference? get specialOfferRef => _specialOfferRef;
  bool hasSpecialOfferRef() => _specialOfferRef != null;

  // "users_liked" field.
  List<DocumentReference>? _usersLiked;
  List<DocumentReference> get usersLiked => _usersLiked ?? const [];
  bool hasUsersLiked() => _usersLiked != null;

  // "usersReviewed" field.
  List<DocumentReference>? _usersReviewed;
  List<DocumentReference> get usersReviewed => _usersReviewed ?? const [];
  bool hasUsersReviewed() => _usersReviewed != null;

  // "userBought" field.
  List<DocumentReference>? _userBought;
  List<DocumentReference> get userBought => _userBought ?? const [];
  bool hasUserBought() => _userBought != null;

  // "recent" field.
  bool? _recent;
  bool get recent => _recent ?? false;
  bool hasRecent() => _recent != null;

  // "folder" field.
  String? _folder;
  String get folder => _folder ?? '';
  bool hasFolder() => _folder != null;

  void _initializeFields() {
    _productInformation =
        ProjectStruct.maybeFromMap(snapshotData['product_information']);
    _productId = snapshotData['product_id'] as String?;
    _specialOffer = snapshotData['special_offer'] as bool?;
    _category = snapshotData['category'] as String?;
    _specialOfferRef = snapshotData['special_offer_ref'] as DocumentReference?;
    _usersLiked = getDataList(snapshotData['users_liked']);
    _usersReviewed = getDataList(snapshotData['usersReviewed']);
    _userBought = getDataList(snapshotData['userBought']);
    _recent = snapshotData['recent'] as bool?;
    _folder = snapshotData['folder'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('product');

  static Stream<ProductRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductRecord.fromSnapshot(s));

  static Future<ProductRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductRecord.fromSnapshot(s));

  static ProductRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductRecordData({
  ProjectStruct? productInformation,
  String? productId,
  bool? specialOffer,
  String? category,
  DocumentReference? specialOfferRef,
  bool? recent,
  String? folder,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'product_information': ProjectStruct().toMap(),
      'product_id': productId,
      'special_offer': specialOffer,
      'category': category,
      'special_offer_ref': specialOfferRef,
      'recent': recent,
      'folder': folder,
    }.withoutNulls,
  );

  // Handle nested data for "product_information" field.
  addProjectStructData(
      firestoreData, productInformation, 'product_information');

  return firestoreData;
}

class ProductRecordDocumentEquality implements Equality<ProductRecord> {
  const ProductRecordDocumentEquality();

  @override
  bool equals(ProductRecord? e1, ProductRecord? e2) {
    const listEquality = ListEquality();
    return e1?.productInformation == e2?.productInformation &&
        e1?.productId == e2?.productId &&
        e1?.specialOffer == e2?.specialOffer &&
        e1?.category == e2?.category &&
        e1?.specialOfferRef == e2?.specialOfferRef &&
        listEquality.equals(e1?.usersLiked, e2?.usersLiked) &&
        listEquality.equals(e1?.usersReviewed, e2?.usersReviewed) &&
        listEquality.equals(e1?.userBought, e2?.userBought) &&
        e1?.recent == e2?.recent &&
        e1?.folder == e2?.folder;
  }

  @override
  int hash(ProductRecord? e) => const ListEquality().hash([
        e?.productInformation,
        e?.productId,
        e?.specialOffer,
        e?.category,
        e?.specialOfferRef,
        e?.usersLiked,
        e?.usersReviewed,
        e?.userBought,
        e?.recent,
        e?.folder
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductRecord;
}
