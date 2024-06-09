/// Returns a new list containing elements of the [collection] for which the [predicate]
/// function returns `true`.
///
/// The [predicate] function is invoked for each element in the [collection] with the
/// element as its argument. If the [predicate] function returns `true` for an element,
/// that element is included in the result.
///
/// If no [predicate] function is provided, the function defaults to including elements
/// that are not `null`.
///
/// ## Example
///
/// ```dart
/// var users = [
///   { 'user': 'barney', 'age': 36, 'active': true },
///   { 'user': 'fred',   'age': 40, 'active': false }
/// ];
///
/// var filteredUsers1 = filter(users, (o) => !(o['active']));
/// print(filteredUsers1); // Output: [{user: fred, age: 40, active: false}]
///
/// var filteredUsers2 = filter(users, (o) => o['age'] == 36 && o['active'] == true);
/// print(filteredUsers2); // Output: [{user: barney, age: 36, active: true}]
///
/// var filteredUsers3 = filter(users, (o) => o['active'] == false);
/// print(filteredUsers3); // Output: [{user: fred, age: 40, active: false}]
///
/// var filteredUsers4 = filter(users, (o) => o['active']);
/// print(filteredUsers4); // Output: [{user: barney, age: 36, active: true}]
/// ```
///
/// The above example demonstrates how to use the `filter` function to filter a list of users
/// based on different criteria.
///
/// ## Parameters
///
/// - `collection`: The collection to iterate over. It can be either a list or a map.
/// - `[predicate]`: The function invoked per iteration. It takes an element of the collection
///   as an argument and returns a boolean value indicating whether the element should be included
///   in the result. If not provided, defaults to a function that includes elements not equal to `null`.
///
/// ## Returns
///
/// A new list containing elements of the [collection] for which the [predicate] function returns `true`.
List<dynamic> filter(List<dynamic> collection, [Function? predicate]) {
  List<dynamic> result = [];
  for (var i = 0; i < collection.length; i++) {
    var item = collection[i];
    if (predicate != null) {
      if (predicate(item)) {
        result.add(item);
      }
    } else {
      if (item != null) {
        result.add(item);
      }
    }
  }
  return result;
}
