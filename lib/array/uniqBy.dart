/// Returns a new array with unique elements, where uniqueness is determined
/// by the result of invoking the provided [iteratee] function on each element.
///
/// This function is similar to `_.uniq` except that it accepts an [iteratee] function
/// which is invoked for each element in the array to generate the criterion by which
/// uniqueness is computed. The order of result values is determined by the order
/// they occur in the array. The [iteratee] is invoked with one argument: (value).
///
/// - Parameters:
///   - array: The array to inspect.
///   - iteratee: The iteratee function invoked per element. Defaults to the identity function.
/// - Returns: A new array with duplicate elements removed.
///
/// Example:
/// ```dart
/// uniqBy([2.1, 1.2, 2.3], (num) => num.floor());
/// // => [2.1, 1.2]
///
/// uniqBy([{'x': 1}, {'x': 2}, {'x': 1}], (map) => map['x']);
/// // => [{'x': 1}, {'x': 2}]
List<T> uniqBy<T, V>(List<T> array, V Function(T) iteratee) {
  final seen = <V>{};
  final result = <T>[];

  for (var element in array) {
    final value = iteratee(element);
    if (seen.add(value)) {
      result.add(element);
    }
  }

  return result;
}
