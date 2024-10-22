// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProjectStruct extends FFFirebaseStruct {
  ProjectStruct({
    String? name,
    String? description,
    String? projectCover,
    List<String>? projectImages,
    List<String>? heads,
    List<String>? members,
    int? numberOfReviews,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _description = description,
        _projectCover = projectCover,
        _projectImages = projectImages,
        _heads = heads,
        _members = members,
        _numberOfReviews = numberOfReviews,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "project_cover" field.
  String? _projectCover;
  String get projectCover => _projectCover ?? '';
  set projectCover(String? val) => _projectCover = val;

  bool hasProjectCover() => _projectCover != null;

  // "project_images" field.
  List<String>? _projectImages;
  List<String> get projectImages => _projectImages ?? const [];
  set projectImages(List<String>? val) => _projectImages = val;

  void updateProjectImages(Function(List<String>) updateFn) {
    updateFn(_projectImages ??= []);
  }

  bool hasProjectImages() => _projectImages != null;

  // "heads" field.
  List<String>? _heads;
  List<String> get heads => _heads ?? const [];
  set heads(List<String>? val) => _heads = val;

  void updateHeads(Function(List<String>) updateFn) {
    updateFn(_heads ??= []);
  }

  bool hasHeads() => _heads != null;

  // "members" field.
  List<String>? _members;
  List<String> get members => _members ?? const [];
  set members(List<String>? val) => _members = val;

  void updateMembers(Function(List<String>) updateFn) {
    updateFn(_members ??= []);
  }

  bool hasMembers() => _members != null;

  // "number_of_reviews" field.
  int? _numberOfReviews;
  int get numberOfReviews => _numberOfReviews ?? 0;
  set numberOfReviews(int? val) => _numberOfReviews = val;

  void incrementNumberOfReviews(int amount) =>
      numberOfReviews = numberOfReviews + amount;

  bool hasNumberOfReviews() => _numberOfReviews != null;

  static ProjectStruct fromMap(Map<String, dynamic> data) => ProjectStruct(
        name: data['name'] as String?,
        description: data['description'] as String?,
        projectCover: data['project_cover'] as String?,
        projectImages: getDataList(data['project_images']),
        heads: getDataList(data['heads']),
        members: getDataList(data['members']),
        numberOfReviews: castToType<int>(data['number_of_reviews']),
      );

  static ProjectStruct? maybeFromMap(dynamic data) =>
      data is Map ? ProjectStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'description': _description,
        'project_cover': _projectCover,
        'project_images': _projectImages,
        'heads': _heads,
        'members': _members,
        'number_of_reviews': _numberOfReviews,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'project_cover': serializeParam(
          _projectCover,
          ParamType.String,
        ),
        'project_images': serializeParam(
          _projectImages,
          ParamType.String,
          isList: true,
        ),
        'heads': serializeParam(
          _heads,
          ParamType.String,
          isList: true,
        ),
        'members': serializeParam(
          _members,
          ParamType.String,
          isList: true,
        ),
        'number_of_reviews': serializeParam(
          _numberOfReviews,
          ParamType.int,
        ),
      }.withoutNulls;

  static ProjectStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProjectStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        projectCover: deserializeParam(
          data['project_cover'],
          ParamType.String,
          false,
        ),
        projectImages: deserializeParam<String>(
          data['project_images'],
          ParamType.String,
          true,
        ),
        heads: deserializeParam<String>(
          data['heads'],
          ParamType.String,
          true,
        ),
        members: deserializeParam<String>(
          data['members'],
          ParamType.String,
          true,
        ),
        numberOfReviews: deserializeParam(
          data['number_of_reviews'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ProjectStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ProjectStruct &&
        name == other.name &&
        description == other.description &&
        projectCover == other.projectCover &&
        listEquality.equals(projectImages, other.projectImages) &&
        listEquality.equals(heads, other.heads) &&
        listEquality.equals(members, other.members) &&
        numberOfReviews == other.numberOfReviews;
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        description,
        projectCover,
        projectImages,
        heads,
        members,
        numberOfReviews
      ]);
}

ProjectStruct createProjectStruct({
  String? name,
  String? description,
  String? projectCover,
  int? numberOfReviews,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProjectStruct(
      name: name,
      description: description,
      projectCover: projectCover,
      numberOfReviews: numberOfReviews,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProjectStruct? updateProjectStruct(
  ProjectStruct? project, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    project
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProjectStructData(
  Map<String, dynamic> firestoreData,
  ProjectStruct? project,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (project == null) {
    return;
  }
  if (project.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && project.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final projectData = getProjectFirestoreData(project, forFieldValue);
  final nestedData = projectData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = project.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProjectFirestoreData(
  ProjectStruct? project, [
  bool forFieldValue = false,
]) {
  if (project == null) {
    return {};
  }
  final firestoreData = mapToFirestore(project.toMap());

  // Add any Firestore field values
  project.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProjectListFirestoreData(
  List<ProjectStruct>? projects,
) =>
    projects?.map((e) => getProjectFirestoreData(e, true)).toList() ?? [];
