/// Returns a new list with all null, empty, false, or NaN elements removed from the input list.
///
/// The `compact` function takes a list of elements of type `T` as input and returns a new list
/// containing only the elements that are not null, not empty (for strings), not false (for booleans),
/// not zero and not NaN (for numbers).
///
/// Example:
///
/// ```dart
/// List<int> numbers = [1, 0, 3, null, 5, 6];
/// List<int> compactedNumbers = compact(numbers);
/// print(compactedNumbers); // Output: [1, 3, 5, 6]
/// ```
///
/// Parameters:
///   - `array`: The list to compact.
///
/// Returns:
///   A new list containing only the non-null, non-empty, non-false, and non-NaN elements from the input list.
///
/// Throws:
///   - `Error`: If the input list is null.
///
/// Note:
///   - For booleans, only `true` elements are included.
///   - For numbers, only non-zero and non-NaN elements are included.
///   - For strings, only non-empty elements are included.
///
List<T> compact<T>(List<T> array) {
  return array.where((element) {
    if (element is bool) {
      return element;
    } else if (element is num) {
      return element != 0 && !element.isNaN;
    } else if (element == null) {
      return false;
    } else if (element is String) {
      return element.isNotEmpty;
    } else {
      return true;
    }
  }).toList();
}
