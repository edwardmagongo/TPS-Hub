import 'package:collection/collection.dart';

enum OrderStatuses {
  Created,
  Approved,
  Paid,
  Shipped,
  Completed,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (OrderStatuses):
      return OrderStatuses.values.deserialize(value) as T?;
    default:
      return null;
  }
}
