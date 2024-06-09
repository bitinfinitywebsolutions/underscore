/// Creates a slice of [array] with [n] elements dropped from the beginning.
///
/// [array]: The list to query.
/// [n]: The number of elements to drop. Defaults to 1.
///
/// Returns a new list with the first [n] elements removed.
///
/// Example:
/// ```dart
/// final result1 = _drop([1, 2, 3]); // => [2, 3]
/// final result2 = _drop([1, 2, 3], 2); // => [3]
/// final result3 = _drop([1, 2, 3], 5); // => []
/// final result4 = _drop([1, 2, 3], 0); // => [1, 2, 3]
/// ```
List<T> _drop<T>(List<T> array, [int n = 1]) {
  if (n < 0) {
    throw ArgumentError('n cannot be negative');
  }
  if (n >= array.length) {
    return [];
  }
  return array.sublist(n);
}
