/// Creates a duplicate-free version of an array, using SameValueZero for equality
/// comparisons, in which only the first occurrence of each element is kept.
/// The order of result values is determined by the order they occur in the array.
///
/// - Parameters:
///   - array: The array to inspect.
/// - Returns: A new duplicate-free array.
///
/// Example:
/// ```dart
/// uniq([2, 1, 2]);
/// // => [2, 1]
///
/// uniq(['a', 'b', 'a']);
/// // => ['a', 'b']
/// ```
List<T> uniq<T>(List<T> array) {
  final seen = <T>{};
  final result = <T>[];

  for (var element in array) {
    if (seen.add(element)) {
      result.add(element);
    }
  }

  return result;
}