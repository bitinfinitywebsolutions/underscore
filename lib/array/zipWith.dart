/// Combines elements from multiple lists using a provided [iteratee] function.
/// This function is similar to `zip` but accepts an [iteratee] to specify how grouped
/// values should be combined. The [iteratee] is invoked with the elements of each group: (...group).
///
/// - Parameters:
///   - arrays: The lists to process.
///   - iteratee: The function to combine grouped values. Defaults to the identity function.
/// - Returns: A new list of combined elements.
///
/// Example:
/// ```dart
/// zipWith([1, 2], [10, 20], [100, 200], (a, b, c) => a + b + c);
/// // => [111, 222]
///
List<R> zipWith<R>(List<List> arrays, R Function(List<dynamic>) iteratee) {
  if (arrays.isEmpty) return [];

  final int length = arrays.map((arr) => arr.length).reduce((a, b) => a < b ? a : b);
  final List<R> result = List<R>.generate(length, (index) {
    final group = arrays.map((arr) => arr[index]).toList();
    return iteratee(group);
  });

  return result;
}