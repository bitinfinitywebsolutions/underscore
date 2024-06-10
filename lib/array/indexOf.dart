/// Gets the index at which the first occurrence of value is found in the array
/// using SameValueZero for equality comparisons. If [fromIndex] is negative,
/// it's used as the offset from the end of the array.
///
/// Arguments:
/// - [array] (`List<T>`): The array to inspect.
/// - [value] (`T`): The value to search for.
/// - [fromIndex] (`int`, optional): The index to search from. Defaults to 0.
///
/// Returns:
/// - (`int`): Returns the index of the matched value, else -1.
///
/// Example:
/// ```dart
/// print(indexOf([1, 2, 1, 2], 2)); // => 1
///
/// // Search from the `fromIndex`.
/// print(indexOf([1, 2, 1, 2], 2, 2)); // => 3
/// ```
int indexOf<T>(List<T> array, T value, [int fromIndex = 0]) {
  int length = array.length;

  if (length == 0) {
    return -1;
  }

  int startIndex = fromIndex >= 0 ? fromIndex : length + fromIndex;

  if (startIndex < 0) {
    startIndex = 0;
  }

  for (int i = startIndex; i < length; i++) {
    if (array[i] == value) {
      return i;
    }
  }

  return -1;
}
