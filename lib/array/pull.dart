/// Removes all given values from the array using equality comparisons.
///
/// This method mutates the original array.
///
/// Usage:
/// ```dart
/// var array = ['a', 'b', 'c', 'a', 'b', 'c'];
/// pull(array, 'a', 'c');
/// print(array); // => ['b', 'b']
/// ```
///
/// - `array` (List): The list to modify.
/// - `values` (...*): The values to remove.
///
/// Returns:
/// - (List): Returns the modified list.
List<T> pull<T>(List<T> array, List<T> values) {
  array.removeWhere((element) => values.contains(element));
  return array;
}
