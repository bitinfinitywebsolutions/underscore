/// Sorts a list of maps [collection] based on the provided list of [iteratees].
///
/// Sorts the list of maps [collection] based on the values of keys specified in the list [iteratees].
///
/// The [collection] parameter is a list of maps (`List<Map<String, dynamic>>`) to be sorted.
/// The [iteratees] parameter is a list of dynamic values or functions that specify the keys or custom comparison functions for sorting.
///
/// If an element in [iteratees] is a function, it is applied to each map in [collection], and the return values are used for comparison.
/// If an element in [iteratees] is a string, it represents the key in each map to be used for comparison.
///
/// Returns the sorted list of maps [collection].
///
/// Example:
/// ```dart
/// var data = [
///   {'name': 'John', 'age': 30},
///   {'name': 'Jane', 'age': 25},
///   {'name': 'Bob', 'age': 35}
/// ];
///
/// var sortedByName = sortBy(data, ['name']);
/// print(sortedByName); // Output: [{'name': 'Bob', 'age': 35}, {'name': 'Jane', 'age': 25}, {'name': 'John', 'age': 30}]
///
/// var sortedByAge = sortBy(data, [(person) => person['age']]);
/// print(sortedByAge); // Output: [{'name': 'Jane', 'age': 25}, {'name': 'John', 'age': 30}, {'name': 'Bob', 'age': 35}]
/// ```
List<Map<String, dynamic>> sortBy(
    List<Map<String, dynamic>> collection, List<dynamic> iteratees) {
  collection.sort((a, b) {
    for (var iteratee in iteratees) {
      if (iteratee is Function) {
        var aValue = iteratee(a);
        var bValue = iteratee(b);
        if (aValue != bValue) {
          return aValue.compareTo(bValue);
        }
      } else if (a[iteratee] != b[iteratee]) {
        return a[iteratee].compareTo(b[iteratee]);
      }
    }
    return 0;
  });
  return collection;
}
