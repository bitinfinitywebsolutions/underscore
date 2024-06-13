/// Creates a slice of [array] with [n] elements dropped from the end.
///
/// [array]: The array to query.
/// [n]: The number of elements to drop. Defaults to 1 if not provided.
///
/// Returns the slice of [array].
///
/// Example:
/// ```dart
/// dropRight([1, 2, 3]); // => [1, 2]
///
/// dropRight([1, 2, 3], 2); // => [1]
///
/// dropRight([1, 2, 3], 5); // => []
///
/// dropRight([1, 2, 3], 0); // => [1, 2, 3]
/// ```
List<T> dropRight<T>(List<T> array, [int n = 1]) {
  if (n < 0) {
    throw ArgumentError('n cannot be negative');
  }
  if (n >= array.length) {
    return [];
  }
  return array.sublist(0, array.length - n);
}
