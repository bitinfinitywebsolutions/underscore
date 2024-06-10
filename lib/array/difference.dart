/// Returns a new list containing the elements from the original list [array] that are not present in the optional [values] list.
///
/// The [array] parameter is the original list of type `List<T>` from which elements will be selected.
/// The [values] parameter is an optional list of type `List<T>` representing elements to exclude from the result. If not provided or empty, returns a copy of the original list.
///
/// Returns a new list of type `List<T>` containing elements from the original list [array] that are not present in the [values] list.
///
/// Example:
/// ```dart
/// var originalList = [1, 2, 3, 4, 5];
/// var valuesToExclude = [3, 5];
/// var differenceList = difference<int>(originalList, valuesToExclude);
/// print(differenceList); // Output: [1, 2, 4]
/// ```
List<T> difference<T>(List<T> array, [List<T>? values]) {
  if (values == null || values.isEmpty) {
    return List.from(array);
  }

  final Set<T> exclusionSet = values.toSet();
  return array.where((element) => !exclusionSet.contains(element)).toList();
}
