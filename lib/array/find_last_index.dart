/// Returns the index of the last element in the [array] for which the [predicate]
/// function returns `true`. If no such element is found, returns `-1`.
///
/// This method is similar to [findIndex], but it iterates over elements of the
/// [array] from right to left.
///
/// ## Example
///
/// ```dart
/// var users = [
///   { 'user': 'barney', 'active': true },
///   { 'user': 'fred',   'active': false },
///   { 'user': 'pebbles', 'active': false }
/// ];
///
/// var index1 = findLastIndex(users, (o) => o['user'] == 'pebbles');
/// print(index1); // Output: 2
///
/// var index2 = findLastIndex(users, (o) => o['user'] == 'barney' && o['active'] == true);
/// print(index2); // Output: 0
///
/// var index3 = findLastIndex(users, (o) => o['active'] == false);
/// print(index3); // Output: 2
///
/// var index4 = findLastIndex(users, (o) => o['active']);
/// print(index4); // Output: 0
/// ```
///
/// The above example demonstrates how to use the `findLastIndex` function to find
/// the index of the last element in a list of users based on different criteria.
///
/// ## Parameters
///
/// - `array`: The list to inspect.
/// - `[predicate]`: The function invoked per iteration. It takes an element of the [array]
///   as an argument and returns a boolean value indicating whether the element should be included
///   in the result. If not provided, defaults to a function that returns `true` for non-null elements.
/// - `[fromIndex]`: The index to start searching from. If negative, it is used as an offset from the end
///   of the [array]. Defaults to `array.length - 1`, i.e., searching from the last element.
///
/// ## Returns
///
/// The index of the last element in the [array] for which the [predicate] function returns `true`.
/// If no such element is found, returns `-1`.
int findLastIndex(List<dynamic> array,
    [bool Function(dynamic)? predicate, int fromIndex = -1]) {
  if (fromIndex < 0) {
    fromIndex += array.length;
  }
  for (int i = fromIndex; i >= 0; i--) {
    var element = array[i];
    if (predicate != null) {
      if (predicate(element)) {
        return i;
      }
    } else {
      if (element != null) {
        return i;
      }
    }
  }
  return -1;
}
