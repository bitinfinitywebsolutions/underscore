/// Creates a slice of a list from start up to, but not including, end.
///
/// This method is used to ensure dense lists are returned.
///
/// Arguments:
/// - `list` (List): The list to slice.
/// - `[start=0]` (int): The start position.
/// - `[end=list.length]` (int): The end position.
///
/// Returns:
/// - `List`: Returns the slice of the list.
///
/// Example:
/// ```dart
/// slice([1, 2, 3, 4], 1, 3); // => [2, 3]
/// slice([1, 2, 3, 4], 2);    // => [3, 4]
/// ```
List<T> slice<T>(List<T> list, [int start = 0, int? end]) {
  end ??= list.length;
  if (start < 0) start = 0;
  if (end > list.length) end = list.length;
  if (start > end) start = end;
  return list.sublist(start, end);
}
