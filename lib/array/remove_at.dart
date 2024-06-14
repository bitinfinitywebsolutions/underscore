/// Removes the element at the specified [index] from the given [List].
///
/// If the [index] is within the bounds of the [list], the element at that
/// index will be removed. If the [index] is out of bounds (i.e., less than
/// 0 or greater than or equal to the length of the [list]), this function
/// does nothing.
///
/// Example:
/// ```dart
/// List<int> numbers = [1, 2, 3, 4, 5];
/// removeAt(numbers, 2); // Removes element at index 2 (3)
/// print(numbers); // Output: [1, 2, 4, 5]
/// ```
///
/// Returns the modified [list] after removing the element, or the original
/// [list] if the [index] is out of bounds.
List<T> removeAt<T>(List<T> list, int index) {
  if (list.isEmpty || index < 0 || index >= list.length) {
    return list;
  }
  list.removeAt(index);
  return list;
}
