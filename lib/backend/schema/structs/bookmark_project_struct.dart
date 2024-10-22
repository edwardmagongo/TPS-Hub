// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookmarkProjectStruct extends FFFirebaseStruct {
  BookmarkProjectStruct({
    DocumentReference? projectRef,
    String? name,
    String? image,
    String? heads,
    String? members,
    int? count,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _projectRef = projectRef,
        _name = name,
        _image = image,
        _heads = heads,
        _members = members,
        _count = count,
        super(firestoreUtilData);

  // "project_ref" field.
  DocumentReference? _projectRef;
  DocumentReference? get projectRef => _projectRef;
  set projectRef(DocumentReference? val) => _projectRef = val;

  bool hasProjectRef() => _projectRef != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "heads" field.
  String? _heads;
  String get heads => _heads ?? '';
  set heads(String? val) => _heads = val;

  bool hasHeads() => _heads != null;

  // "members" field.
  String? _members;
  String get members => _members ?? '';
  set members(String? val) => _members = val;

  bool hasMembers() => _members != null;

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  set count(int? val) => _count = val;

  void incrementCount(int amount) => count = count + amount;

  bool hasCount() => _count != null;

  static BookmarkProjectStruct fromMap(Map<String, dynamic> data) =>
      BookmarkProjectStruct(
        projectRef: data['project_ref'] as DocumentReference?,
        name: data['name'] as String?,
        image: data['image'] as String?,
        heads: data['heads'] as String?,
        members: data['members'] as String?,
        count: castToType<int>(data['count']),
      );

  static BookmarkProjectStruct? maybeFromMap(dynamic data) => data is Map
      ? BookmarkProjectStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'project_ref': _projectRef,
        'name': _name,
        'image': _image,
        'heads': _heads,
        'members': _members,
        'count': _count,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'project_ref': serializeParam(
          _projectRef,
          ParamType.DocumentReference,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'heads': serializeParam(
          _heads,
          ParamType.String,
        ),
        'members': serializeParam(
          _members,
          ParamType.String,
        ),
        'count': serializeParam(
          _count,
          ParamType.int,
        ),
      }.withoutNulls;

  static BookmarkProjectStruct fromSerializableMap(Map<String, dynamic> data) =>
      BookmarkProjectStruct(
        projectRef: deserializeParam(
          data['project_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['product'],
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        heads: deserializeParam(
          data['heads'],
          ParamType.String,
          false,
        ),
        members: deserializeParam(
          data['members'],
          ParamType.String,
          false,
        ),
        count: deserializeParam(
          data['count'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'BookmarkProjectStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BookmarkProjectStruct &&
        projectRef == other.projectRef &&
        name == other.name &&
        image == other.image &&
        heads == other.heads &&
        members == other.members &&
        count == other.count;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([projectRef, name, image, heads, members, count]);
}

BookmarkProjectStruct createBookmarkProjectStruct({
  DocumentReference? projectRef,
  String? name,
  String? image,
  String? heads,
  String? members,
  int? count,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BookmarkProjectStruct(
      projectRef: projectRef,
      name: name,
      image: image,
      heads: heads,
      members: members,
      count: count,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BookmarkProjectStruct? updateBookmarkProjectStruct(
  BookmarkProjectStruct? bookmarkProject, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    bookmarkProject
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBookmarkProjectStructData(
  Map<String, dynamic> firestoreData,
  BookmarkProjectStruct? bookmarkProject,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (bookmarkProject == null) {
    return;
  }
  if (bookmarkProject.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && bookmarkProject.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final bookmarkProjectData =
      getBookmarkProjectFirestoreData(bookmarkProject, forFieldValue);
  final nestedData =
      bookmarkProjectData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = bookmarkProject.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBookmarkProjectFirestoreData(
  BookmarkProjectStruct? bookmarkProject, [
  bool forFieldValue = false,
]) {
  if (bookmarkProject == null) {
    return {};
  }
  final firestoreData = mapToFirestore(bookmarkProject.toMap());

  // Add any Firestore field values
  bookmarkProject.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBookmarkProjectListFirestoreData(
  List<BookmarkProjectStruct>? bookmarkProjects,
) =>
    bookmarkProjects
        ?.map((e) => getBookmarkProjectFirestoreData(e, true))
        .toList() ??
    [];
