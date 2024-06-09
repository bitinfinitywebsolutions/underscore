/// Returns a list containing all the values of the provided [object]'s own properties.
///
/// Given a map [object], this function retrieves all the values associated with its keys
/// and returns them as a list. The order of values in the returned list corresponds
/// to the order of keys in the [object].
///
/// Example:
/// ```dart
/// var object = {'one': 1, 'two': 2, 'three': 3};
/// var values = values_(object);
/// print(values); // Output: [1, 2, 3]
/// ```
///
/// If [object] is empty, an empty list is returned.
///
/// Note: This function only retrieves values from the provided [object]'s own properties,
/// not from its prototype chain.
///
/// Throws an [ArgumentError] if [object] is `null`.
List<dynamic> values(dynamic object) {
  if (object == null) {
    return [];
  }

  if (object is! Map<dynamic, dynamic>) {
    throw ArgumentError('Object must be a map.');
  }

  if (object.keys.any((key) => key is! String)) {
    throw ArgumentError('Map keys must be strings.');
  }

  return object.values.toList();
}
