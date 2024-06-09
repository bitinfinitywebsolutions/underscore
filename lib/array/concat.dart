/// Concatenates a given list [array] with one or more dynamic [values].
///
/// The [array] parameter is the original list of type `List<T>` to which the values will be concatenated.
/// The [values] parameter is a list of dynamic values to concatenate to the [array].
///
/// If any of the values in [values] are also lists of type `List<T>`, their elements will be added individually to the result.
/// Otherwise, the value itself will be added to the result list.
///
/// Returns a new list of type `List<T>` containing the elements of the original list [array] and the concatenated dynamic [values].
///
/// Example:
/// ```dart
/// var originalList = [1, 2, 3];
/// var valuesToAdd = [4, [5, 6], 7];
/// var concatenatedList = _concat<int>(originalList, valuesToAdd);
/// print(concatenatedList); // Output: [1, 2, 3, 4, 5, 6, 7]
/// ```
List<T> _concat<T>(List<T> array, List<dynamic> values) {
  List<T> result = List<T>.from(array); // Copy the original array

  for (var value in values) {
    if (value is List<T>) {
      result.addAll(
          value); // If the value is a list, add its elements individually
    } else {
      result.add(value); // Otherwise, add the value itself
    }
  }

  return result;
}
