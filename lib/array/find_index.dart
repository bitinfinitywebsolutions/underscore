import '../util/predicate.dart';

/// Returns the index of the first element in the list that satisfies the provided
/// [predicate] function. If no such element is found, returns -1.
///
/// The [predicate] function is an optional parameter that takes three arguments:
/// the current element, the index of the current element, and the entire list.
/// If [predicate] is not provided, the default predicate will be used which
/// checks if the element is not null.
///
/// The [fromIndex] parameter specifies the index to start the search from. It
/// defaults to 0.
///
/// Example:
/// ```dart
/// List<int> numbers = [1, 2, 3, 4, 5];
/// int index = findIndex(numbers, (value, index, array) => value == 3);
/// print(index); // Output: 2
///
/// List<String> words = ['apple', 'banana', 'cherry'];
/// int index = findIndex(words, (value, index, array) => value.startsWith('b'));
/// print(index); // Output: 1
///
/// List<int?> mixed = [null, 1, 2, null];
/// int index = findIndex(mixed);
/// print(index); // Output: 1
/// ```
///
/// - Parameter array: The list to search in.
/// - Parameter predicate: The function to test each element. Default is a function that checks for non-null values.
/// - Parameter fromIndex: The index to start the search from. Default is 0.
/// - Returns: The index of the first element that satisfies the [predicate], or -1 if no element satisfies the [predicate].
int findIndex<T>(List<T> array, [Predicate<T>? predicate, int fromIndex = 0]) {
  predicate ??= (value, index, array) => value != null;

  for (var i = fromIndex; i < array.length; i++) {
    if (predicate(array[i], i, array)) {
      return i;
    }
  }

  return -1;
}
