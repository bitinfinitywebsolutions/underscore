/// Removes all elements from the [array] for which the [predicate] returns true and returns
/// a new list containing the removed elements.
///
/// The [predicate] function is invoked with three arguments: (value, index, array).
///
/// If no [predicate] is provided, it defaults to [null], removing all elements that are
/// equivalent to `true`.
///
/// Example:
/// ```dart
/// var array = [1, 2, 3, 4];
/// var evens = _remove(array, (n) => n % 2 == 0);
///
/// print(array); // => [1, 3]
/// print(evens); // => [2, 4]
/// ```
List<T> _remove<T>(List<T> array, [bool Function(T)? predicate]) {
  List<T> removed = [];
  int i = 0;
  while (i < array.length) {
    if (predicate == null || predicate(array[i])) {
      removed.add(array.removeAt(i));
    } else {
      i++;
    }
  }
  return removed;
}
