/// Checks if [predicate] returns truthy for any element of [collection].
/// Iteration is stopped once [predicate] returns truthy.
/// The [predicate] is invoked with three arguments: (value, index|key, collection).
///
/// Returns `true` if any element passes the predicate check, else `false`.
///
/// ### Arguments
///
/// - `collection` (Iterable<T>): The collection to iterate over. This can be a list, a set, or any iterable collection.
/// - `predicate` (bool Function(T value, int index, Iterable<T> collection)): The function invoked per iteration.
///   - `value` (T): The current element being processed in the collection.
///   - `index` (int): The index of the current element being processed.
///   - `collection` (Iterable<T>): The entire collection being iterated over.
///
/// ### Returns
///
/// - `bool`: Returns `true` if any element passes the predicate check, else `false`.
///
/// Example:
/// ```dart
/// some([null, 0, 'yes', false], (value) => value != null);
/// // => true
///
/// var users = [
///   { 'user': 'barney', 'active': true },
///   { 'user': 'fred', 'active': false }
/// ];
///
/// // Using custom predicate
/// some(users, (user) => user['user'] == 'barney' && user['active'] == false);
/// // => false
///
/// // Using property check predicate
/// some(users, (user) => user['active'] == false);
/// // => true
///
/// // Using property exists predicate
/// some(users, (user) => user['active']);
/// // => true
/// ```
bool some<T>(Iterable<T> collection,
    bool Function(T value, int index, Iterable<T> collection) predicate) {
  int index = 0;
  for (T element in collection) {
    if (predicate(element, index, collection)) {
      return true;
    }
    index++;
  }
  return false;
}
