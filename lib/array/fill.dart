/// Fills elements of a List with a specified value within a given range.
///
/// This function fills elements of the provided [list] with the specified [value]
/// from the [start] index (inclusive) up to, but not including, the [end] index (exclusive).
/// If [start] is not provided, it defaults to 0, and if [end] is not provided,
/// it defaults to the length of the list.
///
/// The [list] parameter is the List to be filled.
/// The [value] parameter is the value to fill the list with.
/// The [start] parameter is the start position (inclusive) where filling begins.
/// The [end] parameter is the end position (exclusive) where filling ends.
///
/// Returns the modified list with the elements filled with the specified value.
///
/// Example:
/// ```dart
/// var list1 = [1, 2, 3];
/// _fill(list1, 'a');
/// print(list1); // Output: ['a', 'a', 'a']
///
/// var list2 = List<int>.filled(3, 0);
/// _fill(list2, 2);
/// print(list2); // Output: [2, 2, 2]
///
/// var list3 = [4, 6, 8, 10];
/// _fill(list3, '*', 1, 3);
/// print(list3); // Output: [4, '*', '*', 10]
/// ```
List<T> _fill<T>(List<T> array, dynamic value, [int start = 0, int? end]) {
  end ??= array.length;
  for (int i = start; i < end; i++) {
    array[i] = value;
  }
  return array;
}
