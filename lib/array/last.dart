/// Gets the last element of a list.
///
/// Returns the last element of the given list.
///
/// Arguments:
/// - `list` (List): The list to query.
///
/// Returns:
/// - `dynamic`: Returns the last element of the list.
///
/// Example:
/// ```dart
/// last([1, 2, 3]); // => 3
/// ```
dynamic last(List list) {
  if (list.isEmpty) {
    return null; // or you can throw an exception based on your use case
  }
  return list.last;
}
