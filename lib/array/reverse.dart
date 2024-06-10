/// Reverses the elements of the given [array] in place.
///
/// This function modifies the original array by reversing the order of its elements.
/// The first element becomes the last, the second element becomes the second to last, and so on.
///
/// Example:
/// ```dart
/// var array = [1, 2, 3];
/// reverse(array); // Output: [3, 2, 1]
/// print(array);  // Output: [3, 2, 1]
/// ```
///
/// Note: This function mutates the original array.
///
/// Arguments:
/// - [array]: The array to modify.
///
/// Returns:
/// - The modified array.
/// Reverses the elements of the given [array] in place.
///
/// This function modifies the original array by reversing the order of its elements.
/// The first element becomes the last, the second element becomes the second to last, and so on.
///
/// Example:
/// ```dart
/// var array = [1, 2, 3];
/// reverse(array); // Output: [3, 2, 1]
/// print(array);  // Output: [3, 2, 1]
/// ```
///
/// Note: This function mutates the original array.
///
/// Arguments:
/// - [array]: The array to modify.
///
/// Returns:
/// - The modified array.
List<T> reverse<T>(List<T> array) {
  int start = 0;
  int end = array.length - 1;
  while (start < end) {
    final temp = array[start];
    array[start] = array[end];
    array[end] = temp;
    start++;
    end--;
  }
  return array;
}
